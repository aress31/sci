.class Landroid/support/v4/app/ActionBarDrawerToggleIcs;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggleIcs.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarDrawerToggleHoneycomb"

.field private static final THEME_ATTRS:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 44
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101030b

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/app/ActionBarDrawerToggleIcs;->THEME_ATTRS:[I

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    return-void
.end method

.method public static getThemeUpIndicator(Landroid/app/Activity;)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 93
    sget-object v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs;->THEME_ATTRS:[I

    invoke-virtual {p0, v2}, Landroid/app/Activity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 94
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 95
    .local v1, "result":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 96
    return-object v1
.end method

.method public static setActionBarDescription(Ljava/lang/Object;Landroid/app/Activity;I)Ljava/lang/Object;
    .registers 10
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "contentDescRes"    # I

    .prologue
    .line 72
    if-nez p0, :cond_7

    .line 73
    new-instance p0, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-direct {p0, p1}, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    :cond_7
    move-object v2, p0

    .line 75
    check-cast v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;

    .line 76
    .local v2, "sii":Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_2e

    .line 78
    :try_start_e
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 79
    .local v0, "actionBar":Landroid/app/ActionBar;
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-gt v3, v4, :cond_2e

    .line 83
    invoke-virtual {v0}, Landroid/app/ActionBar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_2e} :catch_2f

    .line 89
    .end local v0    # "actionBar":Landroid/app/ActionBar;
    :cond_2e
    :goto_2e
    return-object p0

    .line 85
    :catch_2f
    move-exception v1

    .line 86
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "ActionBarDrawerToggleHoneycomb"

    const-string v4, "Couldn\'t set content description via JB-MR2 API"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2e
.end method

.method public static setActionBarUpIndicator(Ljava/lang/Object;Landroid/app/Activity;Landroid/graphics/drawable/Drawable;I)Ljava/lang/Object;
    .registers 11
    .param p0, "info"    # Ljava/lang/Object;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p3, "contentDescRes"    # I

    .prologue
    .line 50
    if-nez p0, :cond_7

    .line 51
    new-instance p0, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;

    .end local p0    # "info":Ljava/lang/Object;
    invoke-direct {p0, p1}, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    :cond_7
    move-object v2, p0

    .line 53
    check-cast v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;

    .line 54
    .local v2, "sii":Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_36

    .line 56
    :try_start_e
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 57
    .local v0, "actionBar":Landroid/app/ActionBar;
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_2c} :catch_2d

    .line 67
    .end local v0    # "actionBar":Landroid/app/ActionBar;
    :goto_2c
    return-object p0

    .line 59
    :catch_2d
    move-exception v1

    .line 60
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "ActionBarDrawerToggleHoneycomb"

    const-string v4, "Couldn\'t set home-as-up indicator via JB-MR2 API"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2c

    .line 62
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_36
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    if-eqz v3, :cond_40

    .line 63
    iget-object v3, v2, Landroid/support/v4/app/ActionBarDrawerToggleIcs$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    invoke-virtual {v3, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2c

    .line 65
    :cond_40
    const-string v3, "ActionBarDrawerToggleHoneycomb"

    const-string v4, "Couldn\'t set home-as-up indicator"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2c
.end method
