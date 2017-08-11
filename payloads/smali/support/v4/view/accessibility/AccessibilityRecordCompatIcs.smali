.class Landroid/support/v4/view/accessibility/AccessibilityRecordCompatIcs;
.super Ljava/lang/Object;
.source "AccessibilityRecordCompatIcs.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0xe
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAddedCount(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 42
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getAddedCount()I

    move-result v0

    return v0
.end method

.method public static getBeforeText(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 46
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getBeforeText()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getClassName(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 50
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getClassName()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getContentDescription(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 54
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentItemIndex(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 58
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getCurrentItemIndex()I

    move-result v0

    return v0
.end method

.method public static getFromIndex(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 62
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getFromIndex()I

    move-result v0

    return v0
.end method

.method public static getItemCount(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 66
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getItemCount()I

    move-result v0

    return v0
.end method

.method public static getParcelableData(Ljava/lang/Object;)Landroid/os/Parcelable;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 70
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getParcelableData()Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method public static getRemovedCount(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 74
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getRemovedCount()I

    move-result v0

    return v0
.end method

.method public static getScrollX(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 78
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getScrollX()I

    move-result v0

    return v0
.end method

.method public static getScrollY(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 82
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getScrollY()I

    move-result v0

    return v0
.end method

.method public static getSource(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 86
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getSource()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    return-object v0
.end method

.method public static getText(Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getToIndex(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 94
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getToIndex()I

    move-result v0

    return v0
.end method

.method public static getWindowId(Ljava/lang/Object;)I
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 98
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->getWindowId()I

    move-result v0

    return v0
.end method

.method public static isChecked(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 102
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->isChecked()Z

    move-result v0

    return v0
.end method

.method public static isEnabled(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 106
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public static isFullScreen(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 110
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->isFullScreen()Z

    move-result v0

    return v0
.end method

.method public static isPassword(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 114
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->isPassword()Z

    move-result v0

    return v0
.end method

.method public static isScrollable(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 118
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->isScrollable()Z

    move-result v0

    return v0
.end method

.method public static obtain()Ljava/lang/Object;
    .registers 1

    .prologue
    .line 34
    invoke-static {}, Landroid/view/accessibility/AccessibilityRecord;->obtain()Landroid/view/accessibility/AccessibilityRecord;

    move-result-object v0

    return-object v0
.end method

.method public static obtain(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-static {p0}, Landroid/view/accessibility/AccessibilityRecord;->obtain(Landroid/view/accessibility/AccessibilityRecord;)Landroid/view/accessibility/AccessibilityRecord;

    move-result-object v0

    return-object v0
.end method

.method public static recycle(Ljava/lang/Object;)V
    .registers 1
    .param p0, "record"    # Ljava/lang/Object;

    .prologue
    .line 122
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityRecord;->recycle()V

    .line 123
    return-void
.end method

.method public static setAddedCount(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "addedCount"    # I

    .prologue
    .line 126
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setAddedCount(I)V

    .line 127
    return-void
.end method

.method public static setBeforeText(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "beforeText"    # Ljava/lang/CharSequence;

    .prologue
    .line 130
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setBeforeText(Ljava/lang/CharSequence;)V

    .line 131
    return-void
.end method

.method public static setChecked(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "isChecked"    # Z

    .prologue
    .line 134
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setChecked(Z)V

    .line 135
    return-void
.end method

.method public static setClassName(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "className"    # Ljava/lang/CharSequence;

    .prologue
    .line 138
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setClassName(Ljava/lang/CharSequence;)V

    .line 139
    return-void
.end method

.method public static setContentDescription(Ljava/lang/Object;Ljava/lang/CharSequence;)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "contentDescription"    # Ljava/lang/CharSequence;

    .prologue
    .line 142
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 143
    return-void
.end method

.method public static setCurrentItemIndex(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "currentItemIndex"    # I

    .prologue
    .line 146
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setCurrentItemIndex(I)V

    .line 147
    return-void
.end method

.method public static setEnabled(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "isEnabled"    # Z

    .prologue
    .line 150
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setEnabled(Z)V

    .line 151
    return-void
.end method

.method public static setFromIndex(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "fromIndex"    # I

    .prologue
    .line 154
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 155
    return-void
.end method

.method public static setFullScreen(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "isFullScreen"    # Z

    .prologue
    .line 158
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setFullScreen(Z)V

    .line 159
    return-void
.end method

.method public static setItemCount(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "itemCount"    # I

    .prologue
    .line 162
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setItemCount(I)V

    .line 163
    return-void
.end method

.method public static setParcelableData(Ljava/lang/Object;Landroid/os/Parcelable;)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "parcelableData"    # Landroid/os/Parcelable;

    .prologue
    .line 166
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setParcelableData(Landroid/os/Parcelable;)V

    .line 167
    return-void
.end method

.method public static setPassword(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "isPassword"    # Z

    .prologue
    .line 170
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setPassword(Z)V

    .line 171
    return-void
.end method

.method public static setRemovedCount(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "removedCount"    # I

    .prologue
    .line 174
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setRemovedCount(I)V

    .line 175
    return-void
.end method

.method public static setScrollX(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "scrollX"    # I

    .prologue
    .line 178
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollX(I)V

    .line 179
    return-void
.end method

.method public static setScrollY(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "scrollY"    # I

    .prologue
    .line 182
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollY(I)V

    .line 183
    return-void
.end method

.method public static setScrollable(Ljava/lang/Object;Z)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "scrollable"    # Z

    .prologue
    .line 186
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollable(Z)V

    .line 187
    return-void
.end method

.method public static setSource(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "source"    # Landroid/view/View;

    .prologue
    .line 190
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setSource(Landroid/view/View;)V

    .line 191
    return-void
.end method

.method public static setToIndex(Ljava/lang/Object;I)V
    .registers 2
    .param p0, "record"    # Ljava/lang/Object;
    .param p1, "toIndex"    # I

    .prologue
    .line 194
    check-cast p0, Landroid/view/accessibility/AccessibilityRecord;

    .end local p0    # "record":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 195
    return-void
.end method
