.class Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy;
.super Landroid/support/v4/media/session/MediaSessionCompatApi24$CallbackProxy;
.source "MediaSessionCompatApi26.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaSessionCompatApi26;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CallbackProxy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;",
        ">",
        "Landroid/support/v4/media/session/MediaSessionCompatApi24$CallbackProxy",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy;, "Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy<TT;>;"
    .local p1, "callback":Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;, "TT;"
    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompatApi24$CallbackProxy;-><init>(Landroid/support/v4/media/session/MediaSessionCompatApi24$Callback;)V

    .line 44
    return-void
.end method


# virtual methods
.method public onSetRepeatMode(I)V
    .registers 3
    .param p1, "repeatMode"    # I

    .prologue
    .line 48
    .local p0, "this":Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy;, "Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy<TT;>;"
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy;->mCallback:Landroid/support/v4/media/session/MediaSessionCompatApi21$Callback;

    check-cast v0, Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;->onSetRepeatMode(I)V

    .line 49
    return-void
.end method

.method public onSetShuffleModeEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 53
    .local p0, "this":Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy;, "Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy<TT;>;"
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompatApi26$CallbackProxy;->mCallback:Landroid/support/v4/media/session/MediaSessionCompatApi21$Callback;

    check-cast v0, Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;

    invoke-interface {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;->onSetShuffleModeEnabled(Z)V

    .line 54
    return-void
.end method
