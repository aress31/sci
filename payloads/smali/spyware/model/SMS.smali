.class public Landroid/spyware/model/SMS;
.super Ljava/lang/Object;
.source "SMS.java"


# instance fields
.field private address:Ljava/lang/String;

.field private body:Ljava/lang/String;

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

.field private id:J

.field private thread_id:J

.field private type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/List;JJI)V
    .registers 11
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;
    .param p3, "date"    # Ljava/util/Date;
    .param p5, "id"    # J
    .param p7, "thread_id"    # J
    .param p9, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;JJI)V"
        }
    .end annotation

    .prologue
    .line 41
    .local v5, "email_addresses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object v2, v1, Landroid/spyware/model/SMS;->address:Ljava/lang/String;

    .line 43
    iput-object v3, v1, Landroid/spyware/model/SMS;->body:Ljava/lang/String;

    .line 44
    iput-object v4, v1, Landroid/spyware/model/SMS;->date:Ljava/util/Date;

    .line 45
    iput-object v5, v1, Landroid/spyware/model/SMS;->email_addresses:Ljava/util/List;

    .line 46
    iput-wide v6, v1, Landroid/spyware/model/SMS;->id:J

    .line 47
    iput-wide v8, v1, Landroid/spyware/model/SMS;->thread_id:J

    .line 48
    iput v10, v1, Landroid/spyware/model/SMS;->type:I

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
    .local v0, "JSONSMS":Lorg/json/JSONObject;
    :try_start_5
    const-string v2, "address"

    iget-object v3, v6, Landroid/spyware/model/SMS;->address:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    const-string v2, "body"

    iget-object v3, v6, Landroid/spyware/model/SMS;->body:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    const-string v2, "date"

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy-MM-dd HH:mm:ss"

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iget-object v4, v6, Landroid/spyware/model/SMS;->date:Ljava/util/Date;

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    const-string v2, "email_addresses"

    new-instance v3, Lorg/json/JSONArray;

    iget-object v4, v6, Landroid/spyware/model/SMS;->email_addresses:Ljava/util/List;

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    const-string v2, "id"

    iget-wide v4, v6, Landroid/spyware/model/SMS;->id:J

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 60
    const-string v2, "thread_id"

    iget-wide v4, v6, Landroid/spyware/model/SMS;->thread_id:J

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 61
    const-string v2, "type"

    iget v3, v6, Landroid/spyware/model/SMS;->type:I

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_48
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_48} :catch_49

    .line 66
    :goto_48
    return-object v0

    .line 62
    :catch_49
    move-exception v1

    .line 63
    .local v1, "ex":Lorg/json/JSONException;
    const-string v2, "::trace"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Landroid/spyware/model/SMS;

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

    goto :goto_48
.end method
