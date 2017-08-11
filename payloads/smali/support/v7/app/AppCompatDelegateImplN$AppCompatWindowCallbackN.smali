.class Landroid/support/v7/app/AppCompatDelegateImplN$AppCompatWindowCallbackN;
.super Landroid/support/v7/app/AppCompatDelegateImplV23$AppCompatWindowCallbackV23;
.source "AppCompatDelegateImplN.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AppCompatDelegateImplN;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AppCompatWindowCallbackN"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/app/AppCompatDelegateImplN;


# direct methods
.method constructor <init>(Landroid/support/v7/app/AppCompatDelegateImplN;Landroid/view/Window$Callback;)V
    .registers 3
    .param p1, "this$0"    # Landroid/support/v7/app/AppCompatDelegateImplN;
    .param p2, "callback"    # Landroid/view/Window$Callback;

    .prologue
    .line 40
    iput-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImplN$AppCompatWindowCallbackN;->this$0:Landroid/support/v7/app/AppCompatDelegateImplN;

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/support/v7/app/AppCompatDelegateImplV23$AppCompatWindowCallbackV23;-><init>(Landroid/support/v7/app/AppCompatDelegateImplV23;Landroid/view/Window$Callback;)V

    .line 42
    return-void
.end method


# virtual methods
.method public onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V
    .registers 8
    .param p2, "menu"    # Landroid/view/Menu;
    .param p3, "deviceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/KeyboardShortcutGroup;",
            ">;",
            "Landroid/view/Menu;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Landroid/view/KeyboardShortcutGroup;>;"
    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplN$AppCompatWindowCallbackN;->this$0:Landroid/support/v7/app/AppCompatDelegateImplN;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/app/AppCompatDelegateImplN;->getPanelState(IZ)Landroid/support/v7/app/AppCompatDelegateImplV9$PanelFeatureState;

    move-result-object v0

    .line 48
    .local v0, "panel":Landroid/support/v7/app/AppCompatDelegateImplV9$PanelFeatureState;
    if-eqz v0, :cond_14

    iget-object v1, v0, Landroid/support/v7/app/AppCompatDelegateImplV9$PanelFeatureState;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eqz v1, :cond_14

    .line 51
    iget-object v1, v0, Landroid/support/v7/app/AppCompatDelegateImplV9$PanelFeatureState;->menu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-super {p0, p1, v1, p3}, Landroid/support/v7/app/AppCompatDelegateImplV23$AppCompatWindowCallbackV23;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 56
    :goto_13
    return-void

    .line 54
    :cond_14
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatDelegateImplV23$AppCompatWindowCallbackV23;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    goto :goto_13
.end method
