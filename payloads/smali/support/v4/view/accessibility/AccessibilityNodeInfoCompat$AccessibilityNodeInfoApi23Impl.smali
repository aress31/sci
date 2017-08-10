.class Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi23Impl;
.super Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi22Impl;
.source "AccessibilityNodeInfoCompat.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityNodeInfoApi23Impl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 2275
    invoke-direct {p0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityNodeInfoApi22Impl;-><init>()V

    return-void
.end method


# virtual methods
.method public getActionContextClick()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2308
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionContextClick()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getActionScrollDown()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2293
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionScrollDown()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getActionScrollLeft()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2298
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionScrollLeft()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getActionScrollRight()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2303
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionScrollRight()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getActionScrollToPosition()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2278
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionScrollToPosition()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getActionScrollUp()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2288
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionScrollUp()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getActionShowOnScreen()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2283
    invoke-static {}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->getActionShowOnScreen()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isContextClickable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;

    .prologue
    .line 2313
    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->isContextClickable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setContextClickable(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "info"    # Ljava/lang/Object;
    .param p2, "contextClickable"    # Z

    .prologue
    .line 2318
    invoke-static {p1, p2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompatApi23;->setContextClickable(Ljava/lang/Object;Z)V

    .line 2319
    return-void
.end method
