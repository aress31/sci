.class Landroid/support/v4/view/ViewCompatICS$TooltipHandler;
.super Ljava/lang/Object;
.source "ViewCompatICS.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnHoverListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewCompatICS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TooltipHandler"
.end annotation


# instance fields
.field private final mAnchor:Landroid/view/View;

.field private final mShowRunnable:Ljava/lang/Runnable;

.field private mTooltip:Landroid/widget/Toast;

.field private final mTooltipText:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "tooltipText"    # Ljava/lang/CharSequence;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler$1;

    invoke-direct {v0, p0}, Landroid/support/v4/view/ViewCompatICS$TooltipHandler$1;-><init>(Landroid/support/v4/view/ViewCompatICS$TooltipHandler;)V

    iput-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mShowRunnable:Ljava/lang/Runnable;

    .line 57
    iput-object p1, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    .line 58
    iput-object p2, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltipText:Ljava/lang/CharSequence;

    .line 60
    iget-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 61
    iget-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    .line 62
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/view/ViewCompatICS$TooltipHandler;I)V
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/ViewCompatICS$TooltipHandler;
    .param p1, "x1"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->show(I)V

    return-void
.end method

.method private hide()V
    .registers 3

    .prologue
    .line 132
    iget-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    if-eqz v0, :cond_c

    .line 133
    iget-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    .line 136
    :cond_c
    iget-object v0, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mShowRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 137
    return-void
.end method

.method private show(I)V
    .registers 20
    .param p1, "duration"    # I

    .prologue
    .line 90
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 91
    .local v4, "context":Landroid/content/Context;
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 92
    .local v8, "resources":Landroid/content/res/Resources;
    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v10, v12, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 93
    .local v10, "screenWidth":I
    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v9, v12, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 95
    .local v9, "screenHeight":I
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 96
    .local v5, "displayFrame":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v12, v5}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 97
    iget v12, v5, Landroid/graphics/Rect;->left:I

    if-gez v12, :cond_40

    iget v12, v5, Landroid/graphics/Rect;->top:I

    if-gez v12, :cond_40

    .line 101
    const-string v12, "status_bar_height"

    const-string v13, "dimen"

    const-string v14, "android"

    invoke-virtual {v8, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    .line 102
    .local v7, "resourceId":I
    if-lez v7, :cond_a8

    .line 103
    invoke-virtual {v8, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 107
    .local v11, "statusBarHeight":I
    :goto_3c
    const/4 v12, 0x0

    invoke-virtual {v5, v12, v11, v10, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 110
    .end local v7    # "resourceId":I
    .end local v11    # "statusBarHeight":I
    :cond_40
    const/4 v12, 0x2

    new-array v2, v12, [I

    .line 111
    .local v2, "anchorPos":[I
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v12, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 112
    const/4 v12, 0x0

    aget v12, v2, v12

    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    div-int/lit8 v13, v13, 0x2

    add-int v6, v12, v13

    .line 113
    .local v6, "referenceX":I
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-static {v12}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v12

    if-nez v12, :cond_65

    .line 114
    sub-int v6, v10, v6

    .line 116
    :cond_65
    const/4 v12, 0x1

    aget v3, v2, v12

    .line 117
    .local v3, "anchorTop":I
    invoke-direct/range {p0 .. p0}, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->hide()V

    .line 118
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltipText:Ljava/lang/CharSequence;

    move/from16 v0, p1

    invoke-static {v4, v12, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    .line 119
    int-to-double v12, v3

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v14

    int-to-double v14, v14

    const-wide v16, 0x3fe999999999999aL    # 0.8

    mul-double v14, v14, v16

    cmpg-double v12, v12, v14

    if-gez v12, :cond_aa

    .line 121
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    const v13, 0x800035

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    .line 122
    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    add-int/2addr v14, v3

    iget v15, v5, Landroid/graphics/Rect;->top:I

    sub-int/2addr v14, v15

    .line 121
    invoke-virtual {v12, v13, v6, v14}, Landroid/widget/Toast;->setGravity(III)V

    .line 128
    :goto_a0
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    invoke-virtual {v12}, Landroid/widget/Toast;->show()V

    .line 129
    return-void

    .line 105
    .end local v2    # "anchorPos":[I
    .end local v3    # "anchorTop":I
    .end local v6    # "referenceX":I
    .restart local v7    # "resourceId":I
    :cond_a8
    const/4 v11, 0x0

    .restart local v11    # "statusBarHeight":I
    goto :goto_3c

    .line 125
    .end local v7    # "resourceId":I
    .end local v11    # "statusBarHeight":I
    .restart local v2    # "anchorPos":[I
    .restart local v3    # "anchorTop":I
    .restart local v6    # "referenceX":I
    :cond_aa
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mTooltip:Landroid/widget/Toast;

    const v13, 0x800055

    iget v14, v5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v14, v3

    invoke-virtual {v12, v13, v6, v14}, Landroid/widget/Toast;->setGravity(III)V

    goto :goto_a0
.end method


# virtual methods
.method public onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x0

    .line 72
    iget-object v2, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    .line 73
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "accessibility"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    .line 74
    .local v1, "manager":Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 75
    invoke-static {v1}, Landroid/support/v4/view/accessibility/AccessibilityManagerCompat;->isTouchExplorationEnabled(Landroid/view/accessibility/AccessibilityManager;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 86
    :cond_1b
    :goto_1b
    return v6

    .line 78
    :cond_1c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 79
    .local v0, "action":I
    const/4 v2, 0x7

    if-ne v0, v2, :cond_37

    .line 80
    invoke-direct {p0}, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->hide()V

    .line 81
    iget-object v2, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mAnchor:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->mShowRunnable:Ljava/lang/Runnable;

    .line 82
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v4

    int-to-long v4, v4

    .line 81
    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1b

    .line 83
    :cond_37
    const/16 v2, 0xa

    if-ne v0, v2, :cond_1b

    .line 84
    invoke-direct {p0}, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->hide()V

    goto :goto_1b
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v4/view/ViewCompatICS$TooltipHandler;->show(I)V

    .line 67
    const/4 v0, 0x1

    return v0
.end method
