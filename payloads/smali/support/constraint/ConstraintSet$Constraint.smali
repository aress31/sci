.class Landroid/support/constraint/ConstraintSet$Constraint;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/ConstraintSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Constraint"
.end annotation


# static fields
.field static final UNSET:I = -0x1


# instance fields
.field public alpha:F

.field public applyElevation:Z

.field public baselineToBaseline:I

.field public bottomMargin:I

.field public bottomToBottom:I

.field public bottomToTop:I

.field public dimensionRatio:Ljava/lang/String;

.field public editorAbsoluteX:I

.field public editorAbsoluteY:I

.field public elevation:F

.field public endMargin:I

.field public endToEnd:I

.field public endToStart:I

.field public goneBottomMargin:I

.field public goneEndMargin:I

.field public goneLeftMargin:I

.field public goneRightMargin:I

.field public goneStartMargin:I

.field public goneTopMargin:I

.field public guideBegin:I

.field public guideEnd:I

.field public guidePercent:F

.field public heightDefault:I

.field public heightMax:I

.field public heightMin:I

.field public horizontalBias:F

.field public horizontalChainStyle:I

.field public horizontalWeight:F

.field public leftMargin:I

.field public leftToLeft:I

.field public leftToRight:I

.field public mHeight:I

.field mIsGuideline:Z

.field mViewId:I

.field public mWidth:I

.field public orientation:I

.field public rightMargin:I

.field public rightToLeft:I

.field public rightToRight:I

.field public rotationX:F

.field public rotationY:F

.field public scaleX:F

.field public scaleY:F

.field public startMargin:I

.field public startToEnd:I

.field public startToStart:I

.field public topMargin:I

.field public topToBottom:I

.field public topToTop:I

.field public transformPivotX:F

.field public transformPivotY:F

.field public translationX:F

.field public translationY:F

.field public translationZ:F

.field public verticalBias:F

.field public verticalChainStyle:I

.field public verticalWeight:F

.field public visibility:I

.field public widthDefault:I

.field public widthMax:I

.field public widthMin:I


# direct methods
.method private constructor <init>()V
    .registers 7

    .prologue
    const/high16 v5, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 328
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    iput-boolean v3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    .line 335
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 336
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 337
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    .line 339
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 340
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 341
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 342
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    .line 343
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 344
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 345
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 346
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 347
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 349
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 350
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 351
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 352
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 354
    iput v5, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 355
    iput v5, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    .line 356
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    .line 358
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    .line 359
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    .line 361
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    .line 362
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    .line 363
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    .line 364
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    .line 365
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    .line 366
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    .line 367
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    .line 368
    iput v3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    .line 369
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneLeftMargin:I

    .line 370
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneTopMargin:I

    .line 371
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneRightMargin:I

    .line 372
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneBottomMargin:I

    .line 373
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneEndMargin:I

    .line 374
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneStartMargin:I

    .line 375
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    .line 376
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    .line 377
    iput v3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    .line 378
    iput v3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    .line 379
    iput v4, p0, Landroid/support/constraint/ConstraintSet$Constraint;->alpha:F

    .line 380
    iput-boolean v3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->applyElevation:Z

    .line 381
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->elevation:F

    .line 382
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rotationX:F

    .line 383
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rotationY:F

    .line 384
    iput v4, p0, Landroid/support/constraint/ConstraintSet$Constraint;->scaleX:F

    .line 385
    iput v4, p0, Landroid/support/constraint/ConstraintSet$Constraint;->scaleY:F

    .line 386
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->transformPivotX:F

    .line 387
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->transformPivotY:F

    .line 388
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->translationX:F

    .line 389
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->translationY:F

    .line 390
    iput v2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->translationZ:F

    .line 391
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthDefault:I

    .line 392
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightDefault:I

    .line 393
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMax:I

    .line 394
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMax:I

    .line 395
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMin:I

    .line 396
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMin:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/constraint/ConstraintSet$1;)V
    .registers 2
    .param p1, "x0"    # Landroid/support/constraint/ConstraintSet$1;

    .prologue
    .line 328
    invoke-direct {p0}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>()V

    return-void
.end method

.method static synthetic access$100(Landroid/support/constraint/ConstraintSet$Constraint;ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .registers 3
    .param p0, "x0"    # Landroid/support/constraint/ConstraintSet$Constraint;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/support/constraint/ConstraintLayout$LayoutParams;

    .prologue
    .line 328
    invoke-direct {p0, p1, p2}, Landroid/support/constraint/ConstraintSet$Constraint;->fillFrom(ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V

    return-void
.end method

.method private fillFrom(ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .registers 5
    .param p1, "viewId"    # I
    .param p2, "param"    # Landroid/support/constraint/ConstraintLayout$LayoutParams;

    .prologue
    .line 470
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mViewId:I

    .line 471
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 472
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 473
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 474
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    .line 475
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 476
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 477
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 478
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 479
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 480
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 481
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 482
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 483
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 485
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 486
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    .line 487
    iget-object v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    iput-object v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    .line 488
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    .line 489
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    .line 490
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    .line 491
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    .line 492
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 493
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 494
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->width:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    .line 495
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    .line 496
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftMargin:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    .line 497
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightMargin:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    .line 498
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topMargin:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    .line 499
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomMargin:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    .line 500
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    .line 501
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    .line 502
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    .line 503
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    .line 504
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthDefault:I

    .line 505
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightDefault:I

    .line 506
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMax:I

    .line 507
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMax:I

    .line 508
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMin:I

    .line 509
    iget v1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMin:I

    .line 510
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 511
    .local v0, "currentapiVersion":I
    const/16 v1, 0x11

    if-lt v0, v1, :cond_ac

    .line 512
    invoke-virtual {p2}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->getMarginEnd()I

    move-result v1

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    .line 513
    invoke-virtual {p2}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->getMarginStart()I

    move-result v1

    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    .line 515
    :cond_ac
    return-void
.end method


# virtual methods
.method public applyTo(Landroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .registers 4
    .param p1, "param"    # Landroid/support/constraint/ConstraintLayout$LayoutParams;

    .prologue
    .line 518
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 519
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 520
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 521
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 523
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 524
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 525
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 526
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 528
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 530
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 531
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 532
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 533
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 535
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftMargin:I

    .line 536
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightMargin:I

    .line 537
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topMargin:I

    .line 538
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomMargin:I

    .line 539
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneStartMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    .line 540
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneEndMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    .line 542
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 543
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    .line 545
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    iput-object v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    .line 546
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 547
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 548
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    .line 549
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 550
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 551
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 552
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthDefault:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintDefaultWidth:I

    .line 553
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightDefault:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintDefaultHeight:I

    .line 554
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMax:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMaxWidth:I

    .line 555
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMax:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMaxHeight:I

    .line 556
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMinWidth:I

    .line 557
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->matchConstraintMinHeight:I

    .line 558
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 559
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 560
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 561
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    .line 562
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->width:I

    .line 563
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    .line 564
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b0

    .line 565
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->setMarginStart(I)V

    .line 566
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->setMarginEnd(I)V

    .line 569
    :cond_b0
    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->validate()V

    .line 570
    return-void
.end method

.method public clone()Landroid/support/constraint/ConstraintSet$Constraint;
    .registers 3

    .prologue
    .line 399
    new-instance v0, Landroid/support/constraint/ConstraintSet$Constraint;

    invoke-direct {v0}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>()V

    .line 400
    .local v0, "clone":Landroid/support/constraint/ConstraintSet$Constraint;
    iget-boolean v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    iput-boolean v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    .line 401
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    .line 402
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    .line 403
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 404
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 405
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    .line 406
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 407
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 408
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 409
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    .line 410
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 411
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 412
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 413
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 414
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 415
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 416
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 417
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 418
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 419
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 420
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    .line 421
    iget-object v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    iput-object v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    .line 422
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    .line 423
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    .line 424
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 425
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 426
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 427
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 428
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 429
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    .line 430
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    .line 431
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    .line 432
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    .line 433
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    .line 434
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    .line 435
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    .line 436
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    .line 437
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneLeftMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->goneLeftMargin:I

    .line 438
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneTopMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->goneTopMargin:I

    .line 439
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneRightMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->goneRightMargin:I

    .line 440
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneBottomMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->goneBottomMargin:I

    .line 441
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneEndMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->goneEndMargin:I

    .line 442
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->goneStartMargin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->goneStartMargin:I

    .line 443
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    .line 444
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    .line 445
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    .line 446
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    .line 447
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->alpha:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->alpha:F

    .line 448
    iget-boolean v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->applyElevation:Z

    iput-boolean v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->applyElevation:Z

    .line 449
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->elevation:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->elevation:F

    .line 450
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rotationX:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->rotationX:F

    .line 451
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rotationY:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->rotationY:F

    .line 452
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->scaleX:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->scaleX:F

    .line 453
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->scaleY:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->scaleY:F

    .line 454
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->transformPivotX:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->transformPivotX:F

    .line 455
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->transformPivotY:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->transformPivotY:F

    .line 456
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->translationX:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->translationX:F

    .line 457
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->translationY:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->translationY:F

    .line 458
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->translationZ:F

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->translationZ:F

    .line 459
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthDefault:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->widthDefault:I

    .line 460
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightDefault:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->heightDefault:I

    .line 461
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMax:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMax:I

    .line 462
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMax:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMax:I

    .line 463
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->widthMin:I

    .line 464
    iget v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMin:I

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->heightMin:I

    .line 466
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 328
    invoke-virtual {p0}, Landroid/support/constraint/ConstraintSet$Constraint;->clone()Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    return-object v0
.end method
