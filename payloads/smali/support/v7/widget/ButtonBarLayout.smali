.class public Landroid/support/v7/widget/ButtonBarLayout;
.super Landroid/widget/LinearLayout;
.source "ButtonBarLayout.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final ALLOW_STACKING_MIN_HEIGHT_DP:I = 0x140

.field private static final PEEK_BUTTON_DP:I = 0x10


# instance fields
.field private mAllowStacking:Z

.field private mLastWidthSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    const/4 v2, -0x1

    iput v2, p0, Landroid/support/v7/widget/ButtonBarLayout;->mLastWidthSize:I

    .line 52
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v3, 0x140

    if-lt v2, v3, :cond_27

    const/4 v0, 0x1

    .line 53
    .local v0, "allowStackingDefault":Z
    :goto_15
    sget-object v2, Landroid/support/v7/appcompat/R$styleable;->ButtonBarLayout:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 54
    .local v1, "ta":Landroid/content/res/TypedArray;
    sget v2, Landroid/support/v7/appcompat/R$styleable;->ButtonBarLayout_allowStacking:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    .line 56
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 57
    return-void

    .line 52
    .end local v0    # "allowStackingDefault":Z
    .end local v1    # "ta":Landroid/content/res/TypedArray;
    :cond_27
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private getNextVisibleChildIndex(I)I
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 143
    move v1, p1

    .local v1, "i":I
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getChildCount()I

    move-result v0

    .local v0, "count":I
    :goto_5
    if-ge v1, v0, :cond_15

    .line 144
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ButtonBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_12

    .line 148
    .end local v1    # "i":I
    :goto_11
    return v1

    .line 143
    .restart local v1    # "i":I
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 148
    :cond_15
    const/4 v1, -0x1

    goto :goto_11
.end method

.method private isStacked()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 169
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getOrientation()I

    move-result v1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private setStacked(Z)V
    .registers 6
    .param p1, "stacked"    # Z

    .prologue
    .line 152
    if-eqz p1, :cond_2d

    const/4 v3, 0x1

    :goto_3
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->setOrientation(I)V

    .line 153
    if-eqz p1, :cond_2f

    const/4 v3, 0x5

    :goto_9
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->setGravity(I)V

    .line 155
    sget v3, Landroid/support/v7/appcompat/R$id;->spacer:I

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 156
    .local v2, "spacer":Landroid/view/View;
    if-eqz v2, :cond_1b

    .line 157
    if-eqz p1, :cond_32

    const/16 v3, 0x8

    :goto_18
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 162
    :cond_1b
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getChildCount()I

    move-result v0

    .line 163
    .local v0, "childCount":I
    add-int/lit8 v1, v0, -0x2

    .local v1, "i":I
    :goto_21
    if-ltz v1, :cond_34

    .line 164
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ButtonBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->bringChildToFront(Landroid/view/View;)V

    .line 163
    add-int/lit8 v1, v1, -0x1

    goto :goto_21

    .line 152
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    .end local v2    # "spacer":Landroid/view/View;
    :cond_2d
    const/4 v3, 0x0

    goto :goto_3

    .line 153
    :cond_2f
    const/16 v3, 0x50

    goto :goto_9

    .line 157
    .restart local v2    # "spacer":Landroid/view/View;
    :cond_32
    const/4 v3, 0x4

    goto :goto_18

    .line 166
    .restart local v0    # "childCount":I
    .restart local v1    # "i":I
    :cond_34
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 20
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 71
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v12

    .line 73
    .local v12, "widthSize":I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-eqz v13, :cond_20

    .line 74
    move-object/from16 v0, p0

    iget v13, v0, Landroid/support/v7/widget/ButtonBarLayout;->mLastWidthSize:I

    if-le v12, v13, :cond_1c

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v13

    if-eqz v13, :cond_1c

    .line 76
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/support/v7/widget/ButtonBarLayout;->setStacked(Z)V

    .line 79
    :cond_1c
    move-object/from16 v0, p0

    iput v12, v0, Landroid/support/v7/widget/ButtonBarLayout;->mLastWidthSize:I

    .line 82
    :cond_20
    const/4 v9, 0x0

    .line 88
    .local v9, "needsRemeasure":Z
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v13

    if-nez v13, :cond_c7

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    const/high16 v14, 0x40000000    # 2.0f

    if-ne v13, v14, :cond_c7

    .line 89
    const/high16 v13, -0x80000000

    invoke-static {v12, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 92
    .local v5, "initialWidthMeasureSpec":I
    const/4 v9, 0x1

    .line 97
    :goto_36
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-super {v0, v5, v1}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 99
    move-object/from16 v0, p0

    iget-boolean v13, v0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-eqz v13, :cond_5f

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v13

    if-nez v13, :cond_5f

    .line 102
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->getMeasuredWidthAndState()I

    move-result v6

    .line 103
    .local v6, "measuredWidth":I
    const/high16 v13, -0x1000000

    and-int v7, v6, v13

    .line 104
    .local v7, "measuredWidthState":I
    const/high16 v13, 0x1000000

    if-ne v7, v13, :cond_cb

    const/4 v11, 0x1

    .line 106
    .local v11, "stack":Z
    :goto_56
    if-eqz v11, :cond_5f

    .line 107
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/support/v7/widget/ButtonBarLayout;->setStacked(Z)V

    .line 109
    const/4 v9, 0x1

    .line 113
    .end local v6    # "measuredWidth":I
    .end local v7    # "measuredWidthState":I
    .end local v11    # "stack":Z
    :cond_5f
    if-eqz v9, :cond_64

    .line 114
    invoke-super/range {p0 .. p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 119
    :cond_64
    const/4 v8, 0x0

    .line 120
    .local v8, "minHeight":I
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/support/v7/widget/ButtonBarLayout;->getNextVisibleChildIndex(I)I

    move-result v4

    .line 121
    .local v4, "firstVisible":I
    if-ltz v4, :cond_bb

    .line 122
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/ButtonBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 123
    .local v2, "firstButton":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 124
    .local v3, "firstParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->getPaddingTop()I

    move-result v13

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v13, v14

    iget v14, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v13, v14

    iget v14, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v13, v14

    add-int/2addr v8, v13

    .line 126
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v13

    if-eqz v13, :cond_cd

    .line 127
    add-int/lit8 v13, v4, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/support/v7/widget/ButtonBarLayout;->getNextVisibleChildIndex(I)I

    move-result v10

    .line 128
    .local v10, "secondVisible":I
    if-ltz v10, :cond_bb

    .line 129
    int-to-float v13, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Landroid/support/v7/widget/ButtonBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getPaddingTop()I

    move-result v14

    int-to-float v14, v14

    const/high16 v15, 0x41800000    # 16.0f

    .line 130
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v16

    move-object/from16 v0, v16

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    move/from16 v16, v0

    mul-float v15, v15, v16

    add-float/2addr v14, v15

    add-float/2addr v13, v14

    float-to-int v8, v13

    .line 137
    .end local v2    # "firstButton":Landroid/view/View;
    .end local v3    # "firstParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v10    # "secondVisible":I
    :cond_bb
    :goto_bb
    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v13

    if-eq v13, v8, :cond_c6

    .line 138
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Landroid/support/v7/widget/ButtonBarLayout;->setMinimumHeight(I)V

    .line 140
    :cond_c6
    return-void

    .line 94
    .end local v4    # "firstVisible":I
    .end local v5    # "initialWidthMeasureSpec":I
    .end local v8    # "minHeight":I
    :cond_c7
    move/from16 v5, p1

    .restart local v5    # "initialWidthMeasureSpec":I
    goto/16 :goto_36

    .line 104
    .restart local v6    # "measuredWidth":I
    .restart local v7    # "measuredWidthState":I
    :cond_cb
    const/4 v11, 0x0

    goto :goto_56

    .line 133
    .end local v6    # "measuredWidth":I
    .end local v7    # "measuredWidthState":I
    .restart local v2    # "firstButton":Landroid/view/View;
    .restart local v3    # "firstParams":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v4    # "firstVisible":I
    .restart local v8    # "minHeight":I
    :cond_cd
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ButtonBarLayout;->getPaddingBottom()I

    move-result v13

    add-int/2addr v8, v13

    goto :goto_bb
.end method

.method public setAllowStacking(Z)V
    .registers 4
    .param p1, "allowStacking"    # Z

    .prologue
    .line 60
    iget-boolean v0, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-eq v0, p1, :cond_18

    .line 61
    iput-boolean p1, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    .line 62
    iget-boolean v0, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-nez v0, :cond_15

    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_15

    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ButtonBarLayout;->setStacked(Z)V

    .line 65
    :cond_15
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->requestLayout()V

    .line 67
    :cond_18
    return-void
.end method
