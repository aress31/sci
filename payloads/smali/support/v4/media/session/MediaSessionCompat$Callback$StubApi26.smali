.class Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi26;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi24;
.source "MediaSessionCompat.java"

# interfaces
.implements Landroid/support/v4/media/session/MediaSessionCompatApi26$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StubApi26"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/session/MediaSessionCompat$Callback;


# direct methods
.method private constructor <init>(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V
    .registers 2

    .prologue
    .line 1119
    iput-object p1, p0, Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi26;->this$0:Landroid/support/v4/media/session/MediaSessionCompat$Callback;

    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi24;-><init>(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/media/session/MediaSessionCompat$Callback;Landroid/support/v4/media/session/MediaSessionCompat$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v4/media/session/MediaSessionCompat$Callback;
    .param p2, "x1"    # Landroid/support/v4/media/session/MediaSessionCompat$1;

    .prologue
    .line 1119
    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi26;-><init>(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V

    return-void
.end method


# virtual methods
.method public onSetRepeatMode(I)V
    .registers 3
    .param p1, "repeatMode"    # I

    .prologue
    .line 1122
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi26;->this$0:Landroid/support/v4/media/session/MediaSessionCompat$Callback;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onSetRepeatMode(I)V

    .line 1123
    return-void
.end method

.method public onSetShuffleModeEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 1127
    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat$Callback$StubApi26;->this$0:Landroid/support/v4/media/session/MediaSessionCompat$Callback;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onSetShuffleModeEnabled(Z)V

    .line 1128
    return-void
.end method
