.class Landroid/support/v4/view/WindowInsetsCompatApi21;
.super Ljava/lang/Object;
.source "WindowInsetsCompatApi21.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x15
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static consumeStableInsets(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 26
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->consumeStableInsets()Landroid/view/WindowInsets;

    move-result-object v0

    return-object v0
.end method

.method public static getStableInsetBottom(Ljava/lang/Object;)I
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 30
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getStableInsetBottom()I

    move-result v0

    return v0
.end method

.method public static getStableInsetLeft(Ljava/lang/Object;)I
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 34
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getStableInsetLeft()I

    move-result v0

    return v0
.end method

.method public static getStableInsetRight(Ljava/lang/Object;)I
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getStableInsetRight()I

    move-result v0

    return v0
.end method

.method public static getStableInsetTop(Ljava/lang/Object;)I
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 42
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getStableInsetTop()I

    move-result v0

    return v0
.end method

.method public static hasStableInsets(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 46
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->hasStableInsets()Z

    move-result v0

    return v0
.end method

.method public static isConsumed(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "insets"    # Ljava/lang/Object;

    .prologue
    .line 50
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/WindowInsets;->isConsumed()Z

    move-result v0

    return v0
.end method

.method public static replaceSystemWindowInsets(Ljava/lang/Object;Landroid/graphics/Rect;)Ljava/lang/Object;
    .registers 3
    .param p0, "insets"    # Ljava/lang/Object;
    .param p1, "systemWindowInsets"    # Landroid/graphics/Rect;

    .prologue
    .line 54
    check-cast p0, Landroid/view/WindowInsets;

    .end local p0    # "insets":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    move-result-object v0

    return-object v0
.end method
