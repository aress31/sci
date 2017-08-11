.class Landroid/support/v4/media/session/MediaControllerCompatApi26;
.super Ljava/lang/Object;
.source "MediaControllerCompatApi26.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;,
        Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;,
        Landroid/support/v4/media/session/MediaControllerCompatApi26$TransportControls;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method public static createCallback(Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;)Ljava/lang/Object;
    .registers 2
    .param p0, "callback"    # Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;

    .prologue
    .line 23
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;

    invoke-direct {v0, p0}, Landroid/support/v4/media/session/MediaControllerCompatApi26$CallbackProxy;-><init>(Landroid/support/v4/media/session/MediaControllerCompatApi26$Callback;)V

    return-object v0
.end method

.method public static getRepeatMode(Ljava/lang/Object;)I
    .registers 2
    .param p0, "controllerObj"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p0, Landroid/media/session/MediaController;

    .end local p0    # "controllerObj":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/media/session/MediaController;->getRepeatMode()I

    move-result v0

    return v0
.end method

.method public static isShuffleModeEnabled(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "controllerObj"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p0, Landroid/media/session/MediaController;

    .end local p0    # "controllerObj":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/media/session/MediaController;->isShuffleModeEnabled()Z

    move-result v0

    return v0
.end method
