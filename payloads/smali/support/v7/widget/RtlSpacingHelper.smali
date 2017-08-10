.class Landroid/support/v7/widget/RtlSpacingHelper;
.super Ljava/lang/Object;
.source "RtlSpacingHelper.java"


# static fields
.field public static final UNDEFINED:I = -0x80000000


# instance fields
.field private mEnd:I

.field private mExplicitLeft:I

.field private mExplicitRight:I

.field private mIsRelative:Z

.field private mIsRtl:Z

.field private mLeft:I

.field private mRight:I

.field private mStart:I


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/high16 v1, -0x80000000

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 29
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    .line 30
    iput v1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mStart:I

    .line 31
    iput v1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mEnd:I

    .line 32
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitLeft:I

    .line 33
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitRight:I

    .line 35
    iput-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRtl:Z

    .line 36
    iput-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRelative:Z

    return-void
.end method


# virtual methods
.method public getEnd()I
    .registers 2

    .prologue
    .line 51
    iget-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRtl:Z

    if-eqz v0, :cond_7

    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    :goto_6
    return v0

    :cond_7
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    goto :goto_6
.end method

.method public getLeft()I
    .registers 2

    .prologue
    .line 39
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    return v0
.end method

.method public getRight()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    return v0
.end method

.method public getStart()I
    .registers 2

    .prologue
    .line 47
    iget-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRtl:Z

    if-eqz v0, :cond_7

    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    :goto_6
    return v0

    :cond_7
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    goto :goto_6
.end method

.method public setAbsolute(II)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "right"    # I

    .prologue
    const/high16 v1, -0x80000000

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRelative:Z

    .line 69
    if-eq p1, v1, :cond_b

    iput p1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitLeft:I

    iput p1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 70
    :cond_b
    if-eq p2, v1, :cond_11

    iput p2, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitRight:I

    iput p2, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    .line 71
    :cond_11
    return-void
.end method

.method public setDirection(Z)V
    .registers 4
    .param p1, "isRtl"    # Z

    .prologue
    const/high16 v1, -0x80000000

    .line 74
    iget-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRtl:Z

    if-ne p1, v0, :cond_7

    .line 90
    :goto_6
    return-void

    .line 77
    :cond_7
    iput-boolean p1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRtl:Z

    .line 78
    iget-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRelative:Z

    if-eqz v0, :cond_3d

    .line 79
    if-eqz p1, :cond_26

    .line 80
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mEnd:I

    if-eq v0, v1, :cond_20

    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mEnd:I

    :goto_15
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 81
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mStart:I

    if-eq v0, v1, :cond_23

    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mStart:I

    :goto_1d
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    goto :goto_6

    .line 80
    :cond_20
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitLeft:I

    goto :goto_15

    .line 81
    :cond_23
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitRight:I

    goto :goto_1d

    .line 83
    :cond_26
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mStart:I

    if-eq v0, v1, :cond_37

    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mStart:I

    :goto_2c
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 84
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mEnd:I

    if-eq v0, v1, :cond_3a

    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mEnd:I

    :goto_34
    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    goto :goto_6

    .line 83
    :cond_37
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitLeft:I

    goto :goto_2c

    .line 84
    :cond_3a
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitRight:I

    goto :goto_34

    .line 87
    :cond_3d
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitLeft:I

    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 88
    iget v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mExplicitRight:I

    iput v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    goto :goto_6
.end method

.method public setRelative(II)V
    .registers 5
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    const/high16 v1, -0x80000000

    .line 55
    iput p1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mStart:I

    .line 56
    iput p2, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mEnd:I

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRelative:Z

    .line 58
    iget-boolean v0, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mIsRtl:Z

    if-eqz v0, :cond_16

    .line 59
    if-eq p2, v1, :cond_11

    iput p2, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 60
    :cond_11
    if-eq p1, v1, :cond_15

    iput p1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    .line 65
    :cond_15
    :goto_15
    return-void

    .line 62
    :cond_16
    if-eq p1, v1, :cond_1a

    iput p1, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mLeft:I

    .line 63
    :cond_1a
    if-eq p2, v1, :cond_15

    iput p2, p0, Landroid/support/v7/widget/RtlSpacingHelper;->mRight:I

    goto :goto_15
.end method
