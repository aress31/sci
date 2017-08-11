.class Landroid/support/v4/content/IntentCompat$IntentCompatApi15Impl;
.super Landroid/support/v4/content/IntentCompat$IntentCompatBaseImpl;
.source "IntentCompat.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0xf
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/content/IntentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IntentCompatApi15Impl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/support/v4/content/IntentCompat$IntentCompatBaseImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public makeMainSelectorActivity(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .registers 4
    .param p1, "selectorAction"    # Ljava/lang/String;
    .param p2, "selectorCategory"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p1, p2}, Landroid/content/Intent;->makeMainSelectorActivity(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method
