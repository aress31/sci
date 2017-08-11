.class public final Landroid/support/v4/graphics/BitmapCompat;
.super Ljava/lang/Object;
.source "BitmapCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/graphics/BitmapCompat$BitmapCompatApi19Impl;,
        Landroid/support/v4/graphics/BitmapCompat$BitmapCompatApi18Impl;,
        Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;
    }
.end annotation


# static fields
.field static final IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 68
    .local v0, "version":I
    const/16 v1, 0x13

    if-lt v0, v1, :cond_e

    .line 69
    new-instance v1, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatApi19Impl;

    invoke-direct {v1}, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatApi19Impl;-><init>()V

    sput-object v1, Landroid/support/v4/graphics/BitmapCompat;->IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    .line 75
    :goto_d
    return-void

    .line 70
    :cond_e
    const/16 v1, 0x12

    if-lt v0, v1, :cond_1a

    .line 71
    new-instance v1, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatApi18Impl;

    invoke-direct {v1}, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatApi18Impl;-><init>()V

    sput-object v1, Landroid/support/v4/graphics/BitmapCompat;->IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    goto :goto_d

    .line 73
    :cond_1a
    new-instance v1, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    invoke-direct {v1}, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;-><init>()V

    sput-object v1, Landroid/support/v4/graphics/BitmapCompat;->IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    goto :goto_d
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAllocationByteCount(Landroid/graphics/Bitmap;)I
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 93
    sget-object v0, Landroid/support/v4/graphics/BitmapCompat;->IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    invoke-virtual {v0, p0}, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;->getAllocationByteCount(Landroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method

.method public static hasMipMap(Landroid/graphics/Bitmap;)Z
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 78
    sget-object v0, Landroid/support/v4/graphics/BitmapCompat;->IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    invoke-virtual {v0, p0}, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;->hasMipMap(Landroid/graphics/Bitmap;)Z

    move-result v0

    return v0
.end method

.method public static setHasMipMap(Landroid/graphics/Bitmap;Z)V
    .registers 3
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "hasMipMap"    # Z

    .prologue
    .line 82
    sget-object v0, Landroid/support/v4/graphics/BitmapCompat;->IMPL:Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Landroid/support/v4/graphics/BitmapCompat$BitmapCompatBaseImpl;->setHasMipMap(Landroid/graphics/Bitmap;Z)V

    .line 83
    return-void
.end method
