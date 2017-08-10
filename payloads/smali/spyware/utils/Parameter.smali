.class public Landroid/spyware/utils/Parameter;
.super Ljava/lang/Object;
.source "Parameter.java"


# instance fields
.field private JSONArray:Lorg/json/JSONArray;

.field private JSONObject:Lorg/json/JSONObject;

.field private action:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONArray;)V
    .registers 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "JSONArray"    # Lorg/json/JSONArray;

    .prologue
    .line 27
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v1, v0, Landroid/spyware/utils/Parameter;->action:Ljava/lang/String;

    .line 29
    iput-object v2, v0, Landroid/spyware/utils/Parameter;->JSONArray:Lorg/json/JSONArray;

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "JSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 32
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object v1, v0, Landroid/spyware/utils/Parameter;->action:Ljava/lang/String;

    .line 34
    iput-object v2, v0, Landroid/spyware/utils/Parameter;->JSONObject:Lorg/json/JSONObject;

    .line 35
    return-void
.end method


# virtual methods
.method getAction()Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    iget-object v0, v1, Landroid/spyware/utils/Parameter;->action:Ljava/lang/String;

    return-object v0
.end method

.method getJArray()Lorg/json/JSONArray;
    .registers 2

    .prologue
    .line 42
    iget-object v0, v1, Landroid/spyware/utils/Parameter;->JSONArray:Lorg/json/JSONArray;

    return-object v0
.end method

.method getJObject()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 46
    iget-object v0, v1, Landroid/spyware/utils/Parameter;->JSONObject:Lorg/json/JSONObject;

    return-object v0
.end method

.method isJSONArray()Z
    .registers 2

    .prologue
    .line 50
    iget-object v0, v1, Landroid/spyware/utils/Parameter;->JSONArray:Lorg/json/JSONArray;

    instance-of v0, v0, Lorg/json/JSONArray;

    return v0
.end method
