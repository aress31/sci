.class Landroid/support/v4/view/ViewPropertyAnimatorCompatKK;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompatKK.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x13
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setUpdateListener(Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)V
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "listener"    # Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;

    .prologue
    .line 27
    const/4 v0, 0x0

    .line 28
    .local v0, "wrapped":Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    if-eqz p1, :cond_8

    .line 29
    new-instance v0, Landroid/support/v4/view/ViewPropertyAnimatorCompatKK$1;

    .end local v0    # "wrapped":Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    invoke-direct {v0, p1, p0}, Landroid/support/v4/view/ViewPropertyAnimatorCompatKK$1;-><init>(Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;Landroid/view/View;)V

    .line 36
    .restart local v0    # "wrapped":Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    .line 37
    return-void
.end method
