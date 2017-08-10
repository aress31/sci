.class public Landroid/support/constraint/solver/Goal;
.super Ljava/lang/Object;
.source "Goal.java"


# instance fields
.field variables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/constraint/solver/SolverVariable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    return-void
.end method

.method private initFromSystemErrors(Landroid/support/constraint/solver/LinearSystem;)V
    .registers 8
    .param p1, "system"    # Landroid/support/constraint/solver/LinearSystem;

    .prologue
    .line 66
    iget-object v3, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 67
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_6
    iget v3, p1, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    if-ge v0, v3, :cond_33

    .line 68
    iget-object v3, p1, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v3, v3, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v2, v3, v0

    .line 69
    .local v2, "variable":Landroid/support/constraint/solver/SolverVariable;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_11
    const/4 v3, 0x6

    if-ge v1, v3, :cond_1c

    .line 70
    iget-object v3, v2, Landroid/support/constraint/solver/SolverVariable;->strengthVector:[F

    const/4 v4, 0x0

    aput v4, v3, v1

    .line 69
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 72
    :cond_1c
    iget-object v3, v2, Landroid/support/constraint/solver/SolverVariable;->strengthVector:[F

    iget v4, v2, Landroid/support/constraint/solver/SolverVariable;->strength:I

    const/high16 v5, 0x3f800000    # 1.0f

    aput v5, v3, v4

    .line 73
    iget-object v3, v2, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v4, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    if-eq v3, v4, :cond_2d

    .line 67
    :goto_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 76
    :cond_2d
    iget-object v3, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .line 78
    .end local v1    # "j":I
    .end local v2    # "variable":Landroid/support/constraint/solver/SolverVariable;
    :cond_33
    return-void
.end method


# virtual methods
.method getPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 37
    iget-object v7, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 38
    .local v1, "count":I
    const/4 v0, 0x0

    .line 39
    .local v0, "candidate":Landroid/support/constraint/solver/SolverVariable;
    const/4 v5, 0x0

    .line 42
    .local v5, "strength":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a
    if-ge v3, v1, :cond_33

    .line 43
    iget-object v7, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/SolverVariable;

    .line 44
    .local v2, "element":Landroid/support/constraint/solver/SolverVariable;
    const/4 v4, 0x5

    .local v4, "k":I
    :goto_15
    if-ltz v4, :cond_30

    .line 45
    iget-object v7, v2, Landroid/support/constraint/solver/SolverVariable;->strengthVector:[F

    aget v6, v7, v4

    .line 46
    .local v6, "value":F
    if-nez v0, :cond_25

    cmpg-float v7, v6, v8

    if-gez v7, :cond_25

    if-lt v4, v5, :cond_25

    .line 47
    move v5, v4

    .line 48
    move-object v0, v2

    .line 50
    :cond_25
    cmpl-float v7, v6, v8

    if-lez v7, :cond_2d

    if-le v4, v5, :cond_2d

    .line 51
    move v5, v4

    .line 52
    const/4 v0, 0x0

    .line 44
    :cond_2d
    add-int/lit8 v4, v4, -0x1

    goto :goto_15

    .line 42
    .end local v6    # "value":F
    :cond_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 56
    .end local v2    # "element":Landroid/support/constraint/solver/SolverVariable;
    .end local v4    # "k":I
    :cond_33
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 119
    const-string v3, "Goal: "

    .line 120
    .local v3, "representation":Ljava/lang/String;
    iget-object v4, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 122
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v0, :cond_2b

    .line 123
    iget-object v4, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/SolverVariable;

    .line 124
    .local v1, "element":Landroid/support/constraint/solver/SolverVariable;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/support/constraint/solver/SolverVariable;->strengthsToString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 122
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 126
    .end local v1    # "element":Landroid/support/constraint/solver/SolverVariable;
    :cond_2b
    return-object v3
.end method

.method updateFromSystem(Landroid/support/constraint/solver/LinearSystem;)V
    .registers 15
    .param p1, "system"    # Landroid/support/constraint/solver/LinearSystem;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/Goal;->initFromSystemErrors(Landroid/support/constraint/solver/LinearSystem;)V

    .line 87
    iget-object v10, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 88
    .local v0, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a
    if-ge v3, v0, :cond_5a

    .line 89
    iget-object v10, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/SolverVariable;

    .line 90
    .local v2, "element":Landroid/support/constraint/solver/SolverVariable;
    iget v10, v2, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    const/4 v11, -0x1

    if-eq v10, v11, :cond_57

    .line 91
    iget v10, v2, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    invoke-virtual {p1, v10}, Landroid/support/constraint/solver/LinearSystem;->getRow(I)Landroid/support/constraint/solver/ArrayRow;

    move-result-object v1

    .line 92
    .local v1, "definition":Landroid/support/constraint/solver/ArrayRow;
    iget-object v9, v1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    .line 93
    .local v9, "variables":Landroid/support/constraint/solver/ArrayLinkedVariables;
    iget v6, v9, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 94
    .local v6, "size":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_24
    if-ge v4, v6, :cond_54

    .line 95
    invoke-virtual {v9, v4}, Landroid/support/constraint/solver/ArrayLinkedVariables;->getVariable(I)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v8

    .line 96
    .local v8, "var":Landroid/support/constraint/solver/SolverVariable;
    if-nez v8, :cond_2f

    .line 94
    :cond_2c
    :goto_2c
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 99
    :cond_2f
    invoke-virtual {v9, v4}, Landroid/support/constraint/solver/ArrayLinkedVariables;->getVariableValue(I)F

    move-result v7

    .line 100
    .local v7, "value":F
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_34
    const/4 v10, 0x6

    if-ge v5, v10, :cond_46

    .line 101
    iget-object v10, v8, Landroid/support/constraint/solver/SolverVariable;->strengthVector:[F

    aget v11, v10, v5

    iget-object v12, v2, Landroid/support/constraint/solver/SolverVariable;->strengthVector:[F

    aget v12, v12, v5

    mul-float/2addr v12, v7

    add-float/2addr v11, v12

    aput v11, v10, v5

    .line 100
    add-int/lit8 v5, v5, 0x1

    goto :goto_34

    .line 103
    :cond_46
    iget-object v10, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2c

    .line 104
    iget-object v10, p0, Landroid/support/constraint/solver/Goal;->variables:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    .line 107
    .end local v5    # "k":I
    .end local v7    # "value":F
    .end local v8    # "var":Landroid/support/constraint/solver/SolverVariable;
    :cond_54
    invoke-virtual {v2}, Landroid/support/constraint/solver/SolverVariable;->clearStrengths()V

    .line 88
    .end local v1    # "definition":Landroid/support/constraint/solver/ArrayRow;
    .end local v4    # "j":I
    .end local v6    # "size":I
    .end local v9    # "variables":Landroid/support/constraint/solver/ArrayLinkedVariables;
    :cond_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 110
    .end local v2    # "element":Landroid/support/constraint/solver/SolverVariable;
    :cond_5a
    return-void
.end method
