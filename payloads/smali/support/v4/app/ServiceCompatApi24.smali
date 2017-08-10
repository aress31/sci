.class Landroid/support/v4/app/ServiceCompatApi24;
.super Ljava/lang/Object;
.source "ServiceCompatApi24.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x18
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static stopForeground(Landroid/app/Service;I)V
    .registers 2
    .param p0, "service"    # Landroid/app/Service;
    .param p1, "flags"    # I

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Landroid/app/Service;->stopForeground(I)V

    .line 25
    return-void
.end method
