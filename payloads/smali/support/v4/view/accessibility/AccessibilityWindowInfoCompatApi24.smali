.class Landroid/support/v4/view/accessibility/AccessibilityWindowInfoCompatApi24;
.super Ljava/lang/Object;
.source "AccessibilityWindowInfoCompatApi24.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x18
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAnchor(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .prologue
    .line 33
    check-cast p0, Landroid/view/accessibility/AccessibilityWindowInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getAnchor()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getTitle(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "info"    # Ljava/lang/Object;

    .prologue
    .line 29
    check-cast p0, Landroid/view/accessibility/AccessibilityWindowInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method
