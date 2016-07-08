.class Lorg/love2d/android/DownloadService$1;
.super Landroid/content/BroadcastReceiver;
.source "DownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/love2d/android/DownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/love2d/android/DownloadService;


# direct methods
.method constructor <init>(Lorg/love2d/android/DownloadService;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lorg/love2d/android/DownloadService$1;->this$0:Lorg/love2d/android/DownloadService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 85
    const-string v0, "DownloadActivity"

    const-string v1, "downloadReceiver intent called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return-void
.end method
