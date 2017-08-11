.class Landroid/support/v4/os/CancellationSignalCompatJellybean;
.super Ljava/lang/Object;
.source "CancellationSignalCompatJellybean.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x10
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cancel(Ljava/lang/Object;)V
    .registers 1
    .param p0, "cancellationSignalObj"    # Ljava/lang/Object;

    .prologue
    .line 28
    check-cast p0, Landroid/os/CancellationSignal;

    .end local p0    # "cancellationSignalObj":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    .line 29
    return-void
.end method

.method public static create()Ljava/lang/Object;
    .registers 1

    .prologue
    .line 24
    new-instance v0, Landroid/os/CancellationSignal;

    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    return-object v0
.end method
