.class Landroid/support/v4/content/res/ConfigurationHelper$ConfigurationHelperApi17Impl;
.super Landroid/support/v4/content/res/ConfigurationHelper$ConfigurationHelperBaseImpl;
.source "ConfigurationHelper.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x11
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/content/res/ConfigurationHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConfigurationHelperApi17Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v4/content/res/ConfigurationHelper$ConfigurationHelperBaseImpl;-><init>(Landroid/support/v4/content/res/ConfigurationHelper$1;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/content/res/ConfigurationHelper$1;)V
    .registers 2
    .param p1, "x0"    # Landroid/support/v4/content/res/ConfigurationHelper$1;

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/support/v4/content/res/ConfigurationHelper$ConfigurationHelperApi17Impl;-><init>()V

    return-void
.end method


# virtual methods
.method public getDensityDpi(Landroid/content/res/Resources;)I
    .registers 3
    .param p1, "resources"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 53
    invoke-static {p1}, Landroid/support/v4/content/res/ConfigurationHelperJellybeanMr1;->getDensityDpi(Landroid/content/res/Resources;)I

    move-result v0

    return v0
.end method
