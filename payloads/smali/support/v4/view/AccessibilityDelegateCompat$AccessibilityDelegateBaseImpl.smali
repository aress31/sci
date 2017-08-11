.class Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateBaseImpl;
.super Ljava/lang/Object;
.source "AccessibilityDelegateCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/AccessibilityDelegateCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AccessibilityDelegateBaseImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAccessibilityNodeProvider(Landroid/view/View$AccessibilityDelegate;Landroid/view/View;)Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;
    .registers 4
    .param p1, "delegate"    # Landroid/view/View$AccessibilityDelegate;
    .param p2, "host"    # Landroid/view/View;

    .prologue
    .line 97
    const/4 v0, 0x0

    return-object v0
.end method

.method public newAccessibilityDelegateBridge(Landroid/support/v4/view/AccessibilityDelegateCompat;)Landroid/view/View$AccessibilityDelegate;
    .registers 3
    .param p1, "compat"    # Landroid/support/v4/view/AccessibilityDelegateCompat;

    .prologue
    .line 52
    new-instance v0, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateBaseImpl$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateBaseImpl$1;-><init>(Landroid/support/v4/view/AccessibilityDelegateCompat$AccessibilityDelegateBaseImpl;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    return-object v0
.end method

.method public performAccessibilityAction(Landroid/view/View$AccessibilityDelegate;Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 6
    .param p1, "delegate"    # Landroid/view/View$AccessibilityDelegate;
    .param p2, "host"    # Landroid/view/View;
    .param p3, "action"    # I
    .param p4, "args"    # Landroid/os/Bundle;

    .prologue
    .line 103
    const/4 v0, 0x0

    return v0
.end method
