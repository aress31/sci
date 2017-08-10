.class Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi26;
.super Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi24;
.source "MediaControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TransportControlsApi26"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "controlsObj"    # Ljava/lang/Object;

    .prologue
    .line 2226
    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi24;-><init>(Ljava/lang/Object;)V

    .line 2227
    return-void
.end method


# virtual methods
.method public setRepeatMode(I)V
    .registers 3
    .param p1, "repeatMode"    # I

    .prologue
    .line 2231
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi26;->mControlsObj:Ljava/lang/Object;

    invoke-static {v0, p1}, Landroid/support/v4/media/session/MediaControllerCompatApi26$TransportControls;->setRepeatMode(Ljava/lang/Object;I)V

    .line 2232
    return-void
.end method

.method public setShuffleModeEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 2236
    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$TransportControlsApi26;->mControlsObj:Ljava/lang/Object;

    invoke-static {v0, p1}, Landroid/support/v4/media/session/MediaControllerCompatApi26$TransportControls;->setShuffleModeEnabled(Ljava/lang/Object;Z)V

    .line 2238
    return-void
.end method
