.class public final Landroid/support/v4/widget/SearchViewCompat;
.super Ljava/lang/Object;
.source "SearchViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;,
        Landroid/support/v4/widget/SearchViewCompat$OnCloseListenerCompat;,
        Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;,
        Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListenerCompat;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method private static checkIfLegalArg(Landroid/view/View;)V
    .registers 3
    .param p0, "searchView"    # Landroid/view/View;

    .prologue
    .line 36
    if-nez p0, :cond_a

    .line 37
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "searchView must be non-null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_a
    instance-of v0, p0, Landroid/widget/SearchView;

    if-nez v0, :cond_16

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "searchView must be an instance of android.widget.SearchView"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_16
    return-void
.end method

.method public static getQuery(Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 256
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 257
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static isIconified(Landroid/view/View;)Z
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 322
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 323
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/widget/SearchView;->isIconified()Z

    move-result v0

    return v0
.end method

.method public static isQueryRefinementEnabled(Landroid/view/View;)Z
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 389
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 390
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/widget/SearchView;->isQueryRefinementEnabled()Z

    move-result v0

    return v0
.end method

.method public static isSubmitButtonEnabled(Landroid/view/View;)Z
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 353
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 354
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/widget/SearchView;->isSubmitButtonEnabled()Z

    move-result v0

    return v0
.end method

.method private static newOnCloseListener(Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;)Landroid/widget/SearchView$OnCloseListener;
    .registers 2
    .param p0, "listener"    # Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;

    .prologue
    .line 210
    new-instance v0, Landroid/support/v4/widget/SearchViewCompat$2;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/SearchViewCompat$2;-><init>(Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;)V

    return-object v0
.end method

.method private static newOnQueryTextListener(Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;)Landroid/widget/SearchView$OnQueryTextListener;
    .registers 2
    .param p0, "listener"    # Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;

    .prologue
    .line 136
    new-instance v0, Landroid/support/v4/widget/SearchViewCompat$1;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/SearchViewCompat$1;-><init>(Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;)V

    return-object v0
.end method

.method public static newSearchView(Landroid/content/Context;)Landroid/view/View;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 60
    new-instance v0, Landroid/widget/SearchView;

    invoke-direct {v0, p0}, Landroid/widget/SearchView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static setIconified(Landroid/view/View;Z)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "iconify"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 307
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 308
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setIconified(Z)V

    .line 309
    return-void
.end method

.method public static setImeOptions(Landroid/view/View;I)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "imeOptions"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 97
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 98
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setImeOptions(I)V

    .line 99
    return-void
.end method

.method public static setInputType(Landroid/view/View;I)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "inputType"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 114
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 115
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setInputType(I)V

    .line 116
    return-void
.end method

.method public static setMaxWidth(Landroid/view/View;I)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "maxpixels"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 401
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 402
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setMaxWidth(I)V

    .line 403
    return-void
.end method

.method public static setOnCloseListener(Landroid/view/View;Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;)V
    .registers 3
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "listener"    # Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 205
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 206
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-static {p1}, Landroid/support/v4/widget/SearchViewCompat;->newOnCloseListener(Landroid/support/v4/widget/SearchViewCompat$OnCloseListener;)Landroid/widget/SearchView$OnCloseListener;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/SearchView;->setOnCloseListener(Landroid/widget/SearchView$OnCloseListener;)V

    .line 207
    return-void
.end method

.method public static setOnQueryTextListener(Landroid/view/View;Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;)V
    .registers 3
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "listener"    # Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 130
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 131
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-static {p1}, Landroid/support/v4/widget/SearchViewCompat;->newOnQueryTextListener(Landroid/support/v4/widget/SearchViewCompat$OnQueryTextListener;)Landroid/widget/SearchView$OnQueryTextListener;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/SearchView;->setOnQueryTextListener(Landroid/widget/SearchView$OnQueryTextListener;)V

    .line 132
    return-void
.end method

.method public static setQuery(Landroid/view/View;Ljava/lang/CharSequence;Z)V
    .registers 3
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "query"    # Ljava/lang/CharSequence;
    .param p2, "submit"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 273
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 274
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1, p2}, Landroid/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 275
    return-void
.end method

.method public static setQueryHint(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "hint"    # Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 288
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 289
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    .line 290
    return-void
.end method

.method public static setQueryRefinementEnabled(Landroid/view/View;Z)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "enable"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 376
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 377
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setQueryRefinementEnabled(Z)V

    .line 378
    return-void
.end method

.method public static setSearchableInfo(Landroid/view/View;Landroid/content/ComponentName;)V
    .registers 5
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "searchableComponent"    # Landroid/content/ComponentName;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 77
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "search"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/SearchManager;

    .line 80
    .local v0, "searchManager":Landroid/app/SearchManager;
    check-cast p0, Landroid/widget/SearchView;

    .line 81
    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {v0, p1}, Landroid/app/SearchManager;->getSearchableInfo(Landroid/content/ComponentName;)Landroid/app/SearchableInfo;

    move-result-object v1

    .line 80
    invoke-virtual {p0, v1}, Landroid/widget/SearchView;->setSearchableInfo(Landroid/app/SearchableInfo;)V

    .line 82
    return-void
.end method

.method public static setSubmitButtonEnabled(Landroid/view/View;Z)V
    .registers 2
    .param p0, "searchView"    # Landroid/view/View;
    .param p1, "enabled"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 339
    invoke-static {p0}, Landroid/support/v4/widget/SearchViewCompat;->checkIfLegalArg(Landroid/view/View;)V

    .line 340
    check-cast p0, Landroid/widget/SearchView;

    .end local p0    # "searchView":Landroid/view/View;
    invoke-virtual {p0, p1}, Landroid/widget/SearchView;->setSubmitButtonEnabled(Z)V

    .line 341
    return-void
.end method
