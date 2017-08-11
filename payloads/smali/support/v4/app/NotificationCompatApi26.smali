.class Landroid/support/v4/app/NotificationCompatApi26;
.super Ljava/lang/Object;
.source "NotificationCompatApi26.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/NotificationCompatApi26$Builder;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static getChannel(Landroid/app/Notification;)Ljava/lang/String;
    .registers 2
    .param p0, "n"    # Landroid/app/Notification;

    .prologue
    .line 114
    invoke-virtual {p0}, Landroid/app/Notification;->getChannel()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
