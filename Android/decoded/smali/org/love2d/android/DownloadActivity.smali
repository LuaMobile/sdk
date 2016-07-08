.class public Lorg/love2d/android/DownloadActivity;
.super Landroid/app/Activity;
.source "DownloadActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 11
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 13
    invoke-virtual {p0}, Lorg/love2d/android/DownloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 15
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    const-string v4, "http"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 16
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 17
    .local v2, "url":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lorg/love2d/android/DownloadService;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "url"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    invoke-virtual {p0, v0}, Lorg/love2d/android/DownloadActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 22
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v2    # "url":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/love2d/android/DownloadActivity;->finish()V

    .line 23
    return-void
.end method
