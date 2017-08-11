.class Landroid/support/v7/app/ResourcesFlusher;
.super Ljava/lang/Object;
.source "ResourcesFlusher.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResourcesFlusher"

.field private static sDrawableCacheField:Ljava/lang/reflect/Field;

.field private static sDrawableCacheFieldFetched:Z

.field private static sResourcesImplField:Ljava/lang/reflect/Field;

.field private static sResourcesImplFieldFetched:Z

.field private static sThemedResourceCacheClazz:Ljava/lang/Class;

.field private static sThemedResourceCacheClazzFetched:Z

.field private static sThemedResourceCache_mUnthemedEntriesField:Ljava/lang/reflect/Field;

.field private static sThemedResourceCache_mUnthemedEntriesFieldFetched:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static flush(Landroid/content/res/Resources;)Z
    .registers 3
    .param p0, "resources"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 44
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 45
    .local v0, "sdk":I
    const/16 v1, 0x18

    if-lt v0, v1, :cond_b

    .line 46
    invoke-static {p0}, Landroid/support/v7/app/ResourcesFlusher;->flushNougats(Landroid/content/res/Resources;)Z

    move-result v1

    .line 52
    :goto_a
    return v1

    .line 47
    :cond_b
    const/16 v1, 0x17

    if-lt v0, v1, :cond_14

    .line 48
    invoke-static {p0}, Landroid/support/v7/app/ResourcesFlusher;->flushMarshmallows(Landroid/content/res/Resources;)Z

    move-result v1

    goto :goto_a

    .line 49
    :cond_14
    const/16 v1, 0x15

    if-lt v0, v1, :cond_1d

    .line 50
    invoke-static {p0}, Landroid/support/v7/app/ResourcesFlusher;->flushLollipops(Landroid/content/res/Resources;)Z

    move-result v1

    goto :goto_a

    .line 52
    :cond_1d
    const/4 v1, 0x0

    goto :goto_a
.end method

.method private static flushLollipops(Landroid/content/res/Resources;)Z
    .registers 7
    .param p0, "resources"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x1

    .line 56
    sget-boolean v3, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheFieldFetched:Z

    if-nez v3, :cond_17

    .line 58
    :try_start_5
    const-class v3, Landroid/content/res/Resources;

    const-string v5, "mDrawableCache"

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    sput-object v3, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    .line 59
    sget-object v3, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_15
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_15} :catch_2d

    .line 63
    :goto_15
    sput-boolean v4, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheFieldFetched:Z

    .line 65
    :cond_17
    sget-object v3, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    if-eqz v3, :cond_3f

    .line 66
    const/4 v1, 0x0

    .line 68
    .local v1, "drawableCache":Ljava/util/Map;
    :try_start_1c
    sget-object v3, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/util/Map;

    move-object v1, v0
    :try_end_26
    .catch Ljava/lang/IllegalAccessException; {:try_start_1c .. :try_end_26} :catch_36

    .line 72
    :goto_26
    if-eqz v1, :cond_3f

    .line 73
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    move v3, v4

    .line 77
    .end local v1    # "drawableCache":Ljava/util/Map;
    :goto_2c
    return v3

    .line 60
    :catch_2d
    move-exception v2

    .line 61
    .local v2, "e":Ljava/lang/NoSuchFieldException;
    const-string v3, "ResourcesFlusher"

    const-string v5, "Could not retrieve Resources#mDrawableCache field"

    invoke-static {v3, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_15

    .line 69
    .end local v2    # "e":Ljava/lang/NoSuchFieldException;
    .restart local v1    # "drawableCache":Ljava/util/Map;
    :catch_36
    move-exception v2

    .line 70
    .local v2, "e":Ljava/lang/IllegalAccessException;
    const-string v3, "ResourcesFlusher"

    const-string v5, "Could not retrieve value from Resources#mDrawableCache"

    invoke-static {v3, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_26

    .line 77
    .end local v1    # "drawableCache":Ljava/util/Map;
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :cond_3f
    const/4 v3, 0x0

    goto :goto_2c
.end method

.method private static flushMarshmallows(Landroid/content/res/Resources;)Z
    .registers 7
    .param p0, "resources"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 81
    sget-boolean v4, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheFieldFetched:Z

    if-nez v4, :cond_18

    .line 83
    :try_start_6
    const-class v4, Landroid/content/res/Resources;

    const-string v5, "mDrawableCache"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    sput-object v4, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    .line 84
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_16
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_16} :catch_26

    .line 88
    :goto_16
    sput-boolean v2, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheFieldFetched:Z

    .line 91
    :cond_18
    const/4 v0, 0x0

    .line 92
    .local v0, "drawableCache":Ljava/lang/Object;
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    if-eqz v4, :cond_23

    .line 94
    :try_start_1d
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/IllegalAccessException; {:try_start_1d .. :try_end_22} :catch_2f

    move-result-object v0

    .line 100
    .end local v0    # "drawableCache":Ljava/lang/Object;
    :cond_23
    :goto_23
    if-nez v0, :cond_38

    .line 105
    :goto_25
    return v3

    .line 85
    :catch_26
    move-exception v1

    .line 86
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve Resources#mDrawableCache field"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_16

    .line 95
    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    .restart local v0    # "drawableCache":Ljava/lang/Object;
    :catch_2f
    move-exception v1

    .line 96
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v4, "ResourcesFlusher"

    const-string v5, "Could not retrieve value from Resources#mDrawableCache"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_23

    .line 105
    .end local v0    # "drawableCache":Ljava/lang/Object;
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_38
    if-eqz v0, :cond_42

    invoke-static {v0}, Landroid/support/v7/app/ResourcesFlusher;->flushThemedResourcesCache(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    :goto_40
    move v3, v2

    goto :goto_25

    :cond_42
    move v2, v3

    goto :goto_40
.end method

.method private static flushNougats(Landroid/content/res/Resources;)Z
    .registers 8
    .param p0, "resources"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 109
    sget-boolean v5, Landroid/support/v7/app/ResourcesFlusher;->sResourcesImplFieldFetched:Z

    if-nez v5, :cond_18

    .line 111
    :try_start_6
    const-class v5, Landroid/content/res/Resources;

    const-string v6, "mResourcesImpl"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    sput-object v5, Landroid/support/v7/app/ResourcesFlusher;->sResourcesImplField:Ljava/lang/reflect/Field;

    .line 112
    sget-object v5, Landroid/support/v7/app/ResourcesFlusher;->sResourcesImplField:Ljava/lang/reflect/Field;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_16
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_16} :catch_1d

    .line 116
    :goto_16
    sput-boolean v3, Landroid/support/v7/app/ResourcesFlusher;->sResourcesImplFieldFetched:Z

    .line 119
    :cond_18
    sget-object v5, Landroid/support/v7/app/ResourcesFlusher;->sResourcesImplField:Ljava/lang/reflect/Field;

    if-nez v5, :cond_26

    .line 155
    :cond_1c
    :goto_1c
    return v4

    .line 113
    :catch_1d
    move-exception v1

    .line 114
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    const-string v5, "ResourcesFlusher"

    const-string v6, "Could not retrieve Resources#mResourcesImpl field"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_16

    .line 124
    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    :cond_26
    const/4 v2, 0x0

    .line 126
    .local v2, "resourcesImpl":Ljava/lang/Object;
    :try_start_27
    sget-object v5, Landroid/support/v7/app/ResourcesFlusher;->sResourcesImplField:Ljava/lang/reflect/Field;

    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/lang/IllegalAccessException; {:try_start_27 .. :try_end_2c} :catch_5c

    move-result-object v2

    .line 131
    .end local v2    # "resourcesImpl":Ljava/lang/Object;
    :goto_2d
    if-eqz v2, :cond_1c

    .line 136
    sget-boolean v5, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheFieldFetched:Z

    if-nez v5, :cond_47

    .line 138
    :try_start_33
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "mDrawableCache"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    sput-object v5, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    .line 139
    sget-object v5, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_45
    .catch Ljava/lang/NoSuchFieldException; {:try_start_33 .. :try_end_45} :catch_65

    .line 143
    :goto_45
    sput-boolean v3, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheFieldFetched:Z

    .line 146
    :cond_47
    const/4 v0, 0x0

    .line 147
    .local v0, "drawableCache":Ljava/lang/Object;
    sget-object v5, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    if-eqz v5, :cond_52

    .line 149
    :try_start_4c
    sget-object v5, Landroid/support/v7/app/ResourcesFlusher;->sDrawableCacheField:Ljava/lang/reflect/Field;

    invoke-virtual {v5, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_51
    .catch Ljava/lang/IllegalAccessException; {:try_start_4c .. :try_end_51} :catch_6e

    move-result-object v0

    .line 155
    .end local v0    # "drawableCache":Ljava/lang/Object;
    :cond_52
    :goto_52
    if-eqz v0, :cond_77

    invoke-static {v0}, Landroid/support/v7/app/ResourcesFlusher;->flushThemedResourcesCache(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_77

    :goto_5a
    move v4, v3

    goto :goto_1c

    .line 127
    .restart local v2    # "resourcesImpl":Ljava/lang/Object;
    :catch_5c
    move-exception v1

    .line 128
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v5, "ResourcesFlusher"

    const-string v6, "Could not retrieve value from Resources#mResourcesImpl"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2d

    .line 140
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "resourcesImpl":Ljava/lang/Object;
    :catch_65
    move-exception v1

    .line 141
    .local v1, "e":Ljava/lang/NoSuchFieldException;
    const-string v5, "ResourcesFlusher"

    const-string v6, "Could not retrieve ResourcesImpl#mDrawableCache field"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_45

    .line 150
    .end local v1    # "e":Ljava/lang/NoSuchFieldException;
    .restart local v0    # "drawableCache":Ljava/lang/Object;
    :catch_6e
    move-exception v1

    .line 151
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v5, "ResourcesFlusher"

    const-string v6, "Could not retrieve value from ResourcesImpl#mDrawableCache"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_52

    .end local v0    # "drawableCache":Ljava/lang/Object;
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_77
    move v3, v4

    .line 155
    goto :goto_5a
.end method

.method private static flushThemedResourcesCache(Ljava/lang/Object;)Z
    .registers 9
    .param p0, "cache"    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 159
    sget-boolean v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCacheClazzFetched:Z

    if-nez v4, :cond_10

    .line 161
    :try_start_6
    const-string v4, "android.content.res.ThemedResourceCache"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCacheClazz:Ljava/lang/Class;
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6 .. :try_end_e} :catch_16

    .line 165
    :goto_e
    sput-boolean v6, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCacheClazzFetched:Z

    .line 168
    :cond_10
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCacheClazz:Ljava/lang/Class;

    if-nez v4, :cond_1f

    move v4, v5

    .line 201
    :goto_15
    return v4

    .line 162
    :catch_16
    move-exception v1

    .line 163
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const-string v4, "ResourcesFlusher"

    const-string v7, "Could not find ThemedResourceCache class"

    invoke-static {v4, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_e

    .line 173
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :cond_1f
    sget-boolean v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCache_mUnthemedEntriesFieldFetched:Z

    if-nez v4, :cond_35

    .line 175
    :try_start_23
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCacheClazz:Ljava/lang/Class;

    const-string v7, "mUnthemedEntries"

    .line 176
    invoke-virtual {v4, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    sput-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCache_mUnthemedEntriesField:Ljava/lang/reflect/Field;

    .line 177
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCache_mUnthemedEntriesField:Ljava/lang/reflect/Field;

    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_33
    .catch Ljava/lang/NoSuchFieldException; {:try_start_23 .. :try_end_33} :catch_3b

    .line 181
    :goto_33
    sput-boolean v6, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCache_mUnthemedEntriesFieldFetched:Z

    .line 184
    :cond_35
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCache_mUnthemedEntriesField:Ljava/lang/reflect/Field;

    if-nez v4, :cond_44

    move v4, v5

    .line 186
    goto :goto_15

    .line 178
    :catch_3b
    move-exception v2

    .line 179
    .local v2, "ee":Ljava/lang/NoSuchFieldException;
    const-string v4, "ResourcesFlusher"

    const-string v7, "Could not retrieve ThemedResourceCache#mUnthemedEntries field"

    invoke-static {v4, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_33

    .line 189
    .end local v2    # "ee":Ljava/lang/NoSuchFieldException;
    :cond_44
    const/4 v3, 0x0

    .line 191
    .local v3, "unthemedEntries":Landroid/util/LongSparseArray;
    :try_start_45
    sget-object v4, Landroid/support/v7/app/ResourcesFlusher;->sThemedResourceCache_mUnthemedEntriesField:Ljava/lang/reflect/Field;

    .line 192
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Landroid/util/LongSparseArray;

    move-object v3, v0
    :try_end_4f
    .catch Ljava/lang/IllegalAccessException; {:try_start_45 .. :try_end_4f} :catch_56

    .line 197
    :goto_4f
    if-eqz v3, :cond_5f

    .line 198
    invoke-virtual {v3}, Landroid/util/LongSparseArray;->clear()V

    move v4, v6

    .line 199
    goto :goto_15

    .line 193
    :catch_56
    move-exception v1

    .line 194
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v4, "ResourcesFlusher"

    const-string v7, "Could not retrieve value from ThemedResourceCache#mUnthemedEntries"

    invoke-static {v4, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4f

    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_5f
    move v4, v5

    .line 201
    goto :goto_15
.end method
