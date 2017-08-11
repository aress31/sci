.class public Landroid/support/v7/view/menu/ActionMenuItem;
.super Ljava/lang/Object;
.source "ActionMenuItem.java"

# interfaces
.implements Landroid/support/v4/internal/view/SupportMenuItem;


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final CHECKABLE:I = 0x1

.field private static final CHECKED:I = 0x2

.field private static final ENABLED:I = 0x10

.field private static final EXCLUSIVE:I = 0x4

.field private static final HIDDEN:I = 0x8

.field private static final NO_ICON:I


# instance fields
.field private final mCategoryOrder:I

.field private mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private mContentDescription:Ljava/lang/CharSequence;

.field private mContext:Landroid/content/Context;

.field private mFlags:I

.field private final mGroup:I

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mIconResId:I

.field private final mId:I

.field private mIntent:Landroid/content/Intent;

.field private final mOrdering:I

.field private mShortcutAlphabeticChar:C

.field private mShortcutNumericChar:C

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleCondensed:Ljava/lang/CharSequence;

.field private mTooltipText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;IIIILjava/lang/CharSequence;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "group"    # I
    .param p3, "id"    # I
    .param p4, "categoryOrder"    # I
    .param p5, "ordering"    # I
    .param p6, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIconResId:I

    .line 62
    const/16 v0, 0x10

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    .line 71
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mContext:Landroid/content/Context;

    .line 72
    iput p3, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mId:I

    .line 73
    iput p2, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mGroup:I

    .line 74
    iput p4, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mCategoryOrder:I

    .line 75
    iput p5, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mOrdering:I

    .line 76
    iput-object p6, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitle:Ljava/lang/CharSequence;

    .line 77
    return-void
.end method


# virtual methods
.method public collapseActionView()Z
    .registers 2

    .prologue
    .line 284
    const/4 v0, 0x0

    return v0
.end method

.method public expandActionView()Z
    .registers 2

    .prologue
    .line 279
    const/4 v0, 0x0

    return v0
.end method

.method public getActionProvider()Landroid/view/ActionProvider;
    .registers 2

    .prologue
    .line 253
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getActionView()Landroid/view/View;
    .registers 2

    .prologue
    .line 243
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAlphabeticShortcut()C
    .registers 2

    .prologue
    .line 80
    iget-char v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mShortcutAlphabeticChar:C

    return v0
.end method

.method public getContentDescription()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mContentDescription:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mGroup:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getItemId()I
    .registers 2

    .prologue
    .line 96
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mId:I

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNumericShortcut()C
    .registers 2

    .prologue
    .line 104
    iget-char v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mShortcutNumericChar:C

    return v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mOrdering:I

    return v0
.end method

.method public getSubMenu()Landroid/view/SubMenu;
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportActionProvider()Landroid/support/v4/view/ActionProvider;
    .registers 2

    .prologue
    .line 263
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitleCondensed:Ljava/lang/CharSequence;

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitleCondensed:Ljava/lang/CharSequence;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitle:Ljava/lang/CharSequence;

    goto :goto_6
.end method

.method public getTooltipText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 323
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTooltipText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public hasSubMenu()Z
    .registers 2

    .prologue
    .line 124
    const/4 v0, 0x0

    return v0
.end method

.method public invoke()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 222
    iget-object v1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v1, :cond_e

    iget-object v1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v1, p0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 231
    :goto_d
    return v0

    .line 226
    :cond_e
    iget-object v1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIntent:Landroid/content/Intent;

    if-eqz v1, :cond_1a

    .line 227
    iget-object v1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mContext:Landroid/content/Context;

    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_d

    .line 231
    :cond_1a
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isActionViewExpanded()Z
    .registers 2

    .prologue
    .line 289
    const/4 v0, 0x0

    return v0
.end method

.method public isCheckable()Z
    .registers 2

    .prologue
    .line 128
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 136
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 140
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .registers 3
    .param p1, "actionProvider"    # Landroid/view/ActionProvider;

    .prologue
    .line 248
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setActionView(I)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 258
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 3
    .param p1, "actionView"    # Landroid/view/View;

    .prologue
    .line 239
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic setActionView(I)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Landroid/support/v7/view/menu/ActionMenuItem;->setActionView(I)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setActionView(Landroid/view/View;)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Landroid/support/v7/view/menu/ActionMenuItem;->setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setAlphabeticShortcut(C)Landroid/view/MenuItem;
    .registers 2
    .param p1, "alphaChar"    # C

    .prologue
    .line 144
    iput-char p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mShortcutAlphabeticChar:C

    .line 145
    return-object p0
.end method

.method public setCheckable(Z)Landroid/view/MenuItem;
    .registers 4
    .param p1, "checkable"    # Z

    .prologue
    .line 149
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v1, v0, -0x2

    if-eqz p1, :cond_b

    const/4 v0, 0x1

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    .line 150
    return-object p0

    .line 149
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setChecked(Z)Landroid/view/MenuItem;
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 159
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v1, v0, -0x3

    if-eqz p1, :cond_b

    const/4 v0, 0x2

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    .line 160
    return-object p0

    .line 159
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "contentDescription"    # Ljava/lang/CharSequence;

    .prologue
    .line 306
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mContentDescription:Ljava/lang/CharSequence;

    .line 307
    return-object p0
.end method

.method public bridge synthetic setContentDescription(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Landroid/support/v7/view/menu/ActionMenuItem;->setContentDescription(Ljava/lang/CharSequence;)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setEnabled(Z)Landroid/view/MenuItem;
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 164
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v1, v0, -0x11

    if-eqz p1, :cond_c

    const/16 v0, 0x10

    :goto_8
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    .line 165
    return-object p0

    .line 164
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setExclusiveCheckable(Z)Landroid/support/v7/view/menu/ActionMenuItem;
    .registers 4
    .param p1, "exclusive"    # Z

    .prologue
    .line 154
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v1, v0, -0x5

    if-eqz p1, :cond_b

    const/4 v0, 0x4

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    .line 155
    return-object p0

    .line 154
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIcon(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "iconRes"    # I

    .prologue
    .line 175
    iput p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIconResId:I

    .line 176
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 177
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 169
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 170
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIconResId:I

    .line 171
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 181
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mIntent:Landroid/content/Intent;

    .line 182
    return-object p0
.end method

.method public setNumericShortcut(C)Landroid/view/MenuItem;
    .registers 2
    .param p1, "numericChar"    # C

    .prologue
    .line 186
    iput-char p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mShortcutNumericChar:C

    .line 187
    return-object p0
.end method

.method public setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .registers 3
    .param p1, "listener"    # Landroid/view/MenuItem$OnActionExpandListener;

    .prologue
    .line 294
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "menuItemClickListener"    # Landroid/view/MenuItem$OnMenuItemClickListener;

    .prologue
    .line 191
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 192
    return-object p0
.end method

.method public setShortcut(CC)Landroid/view/MenuItem;
    .registers 3
    .param p1, "numericChar"    # C
    .param p2, "alphaChar"    # C

    .prologue
    .line 196
    iput-char p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mShortcutNumericChar:C

    .line 197
    iput-char p2, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mShortcutAlphabeticChar:C

    .line 198
    return-object p0
.end method

.method public setShowAsAction(I)V
    .registers 2
    .param p1, "show"    # I

    .prologue
    .line 236
    return-void
.end method

.method public setShowAsActionFlags(I)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "actionEnum"    # I

    .prologue
    .line 273
    invoke-virtual {p0, p1}, Landroid/support/v7/view/menu/ActionMenuItem;->setShowAsAction(I)V

    .line 274
    return-object p0
.end method

.method public bridge synthetic setShowAsActionFlags(I)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Landroid/support/v7/view/menu/ActionMenuItem;->setShowAsActionFlags(I)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setSupportActionProvider(Landroid/support/v4/view/ActionProvider;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 3
    .param p1, "actionProvider"    # Landroid/support/v4/view/ActionProvider;

    .prologue
    .line 268
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setSupportOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "listener"    # Landroid/view/MenuItem$OnActionExpandListener;

    .prologue
    .line 301
    return-object p0
.end method

.method public setTitle(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "title"    # I

    .prologue
    .line 207
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitle:Ljava/lang/CharSequence;

    .line 208
    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 202
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitle:Ljava/lang/CharSequence;

    .line 203
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 212
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTitleCondensed:Ljava/lang/CharSequence;

    .line 213
    return-object p0
.end method

.method public setTooltipText(Ljava/lang/CharSequence;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "tooltipText"    # Ljava/lang/CharSequence;

    .prologue
    .line 317
    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mTooltipText:Ljava/lang/CharSequence;

    .line 318
    return-object p0
.end method

.method public bridge synthetic setTooltipText(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Landroid/support/v7/view/menu/ActionMenuItem;->setTooltipText(Ljava/lang/CharSequence;)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setVisible(Z)Landroid/view/MenuItem;
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 217
    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    and-int/lit8 v1, v0, 0x8

    if-eqz p1, :cond_b

    const/4 v0, 0x0

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/view/menu/ActionMenuItem;->mFlags:I

    .line 218
    return-object p0

    .line 217
    :cond_b
    const/16 v0, 0x8

    goto :goto_7
.end method
