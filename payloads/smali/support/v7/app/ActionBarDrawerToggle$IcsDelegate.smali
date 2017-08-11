.class Landroid/support/v7/app/ActionBarDrawerToggle$IcsDelegate;
.super Landroid/support/v7/app/ActionBarDrawerToggle$HoneycombDelegate;
.source "ActionBarDrawerToggle.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/ActionBarDrawerToggle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IcsDelegate"
.end annotation


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 552
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarDrawerToggle$HoneycombDelegate;-><init>(Landroid/app/Activity;)V

    .line 553
    return-void
.end method


# virtual methods
.method public getActionBarThemedContext()Landroid/content/Context;
    .registers 4

    .prologue
    .line 557
    iget-object v2, p0, Landroid/support/v7/app/ActionBarDrawerToggle$IcsDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 559
    .local v0, "actionBar":Landroid/app/ActionBar;
    if-eqz v0, :cond_d

    .line 560
    invoke-virtual {v0}, Landroid/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v1

    .line 564
    .local v1, "context":Landroid/content/Context;
    :goto_c
    return-object v1

    .line 562
    .end local v1    # "context":Landroid/content/Context;
    :cond_d
    iget-object v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle$IcsDelegate;->mActivity:Landroid/app/Activity;

    .restart local v1    # "context":Landroid/content/Context;
    goto :goto_c
.end method
