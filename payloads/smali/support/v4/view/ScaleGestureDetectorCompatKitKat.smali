.class Landroid/support/v4/view/ScaleGestureDetectorCompatKitKat;
.super Ljava/lang/Object;
.source "ScaleGestureDetectorCompatKitKat.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x13
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static isQuickScaleEnabled(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "scaleGestureDetector"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p0, Landroid/view/ScaleGestureDetector;

    .end local p0    # "scaleGestureDetector":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isQuickScaleEnabled()Z

    move-result v0

    return v0
.end method

.method public static setQuickScaleEnabled(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "scaleGestureDetector"    # Ljava/lang/Object;
    .param p1, "enabled"    # Z

    .prologue
    .line 34
    check-cast p0, Landroid/view/ScaleGestureDetector;

    .end local p0    # "scaleGestureDetector":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    .line 35
    return-void
.end method
