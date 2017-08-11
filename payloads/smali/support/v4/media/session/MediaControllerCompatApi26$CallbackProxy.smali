.class Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;
.super Landroid/support/v4/media/session/MediaControllerCompatApi21$CallbackProxy;
.source "MediaControllerCompatApi26.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompatApi26;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CallbackProxy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;",
        ">",
        "Landroid/support/v4/media/session/MediaControllerCompatApi21$CallbackProxy",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;, "Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy<TT;>;"
    .local p1, "callback":Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;, "TT;"
    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompatApi21$CallbackProxy;-><init>(Landroid/support/v4/media/session/MediaControllerCompatApi21$Callback;)V

    .line 53
    return-void
.end method


# virtual methods
.method public onRepeatModeChanged(I)V
    .registers 3
    .param p1, "repeatMode"    # I

    .prologue
    .line 57
    .local p0, "this":Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;, "Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy<TT;>;"
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;->mCallback:Landroid/support/v4/media/session/MediaControllerCompatApi21$Callback;

    check-cast v0, Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;->onRepeatModeChanged(I)V

    .line 58
    return-void
.end method

.method public onShuffleModeChanged(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 62
    .local p0, "this":Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;, "Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy<TT;>;"
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;->mCallback:Landroid/support/v4/media/session/MediaControllerCompatApi21$Callback;

    check-cast v0, Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;->onShuffleModeChanged(Z)V

    .line 63
    return-void
.end method
