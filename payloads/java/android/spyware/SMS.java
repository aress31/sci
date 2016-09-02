package android.spyware;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This class contains a SMS declaration along with some related helper methods.
 */
public class SMS {
    private long idS;
    private long thread;
    private String simNo;
    private String email;
    private String contactNo;
    private String contactName;
    private String message;
    private Date date;
    private String type;

    public SMS(long idS, String email, String simNo, long thread, String contactNo,
               String contactName, String message, int type, Date date) {
        this.idS = idS;
        this.email = email;
        this.simNo = simNo;
        this.thread = thread;
        this.contactNo = contactNo;
        this.contactName = contactName;
        this.message = message;

        switch (type) {
            case 0:
                this.type = "ALL";
                break;
            case 1:
                this.type = "INBOX";
                break;
            case 2:
                this.type = "SENT";
                break;
            case 3:
                this.type = "DRAFT";
                break;
            case 4:
                this.type = "OUTBOX";
                break;
            case 5:
                this.type = "FAILED";
                break;
            case 6:
                this.type = "QUEUED";
                break;
            default:
                this.type = "N/A";
                break;
        }

        this.date = date;
    }

    public Date getDate() {
        return this.date;
    }

    public JSONObject toJSON() {
        JSONObject jSMS = new JSONObject();

        try {
            jSMS.put("idS", idS);
            jSMS.put("simNo", simNo);
            jSMS.put("email", email);
            jSMS.put("thread", thread);
            jSMS.put("contactNo", contactNo);
            jSMS.put("contactName", contactName);
            jSMS.put("message", message);
            jSMS.put("type", type);

            // Formatting the date
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
            jSMS.put("date", formatter.format(date));
        } catch (JSONException e) {
            if (DEV_MODE)
                Log.wtf(TAG, Log.getStackTraceString(e));
            return null;
        }

        return jSMS;
    }
}
