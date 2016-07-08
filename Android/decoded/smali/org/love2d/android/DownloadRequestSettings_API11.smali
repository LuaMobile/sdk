.class Lorg/love2d/android/DownloadRequestSettings_API11;
.super Ljava/lang/Object;
.source "DownloadService.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setup(Landroid/app/DownloadManager$Request;)V
    .locals 1
    .param p0, "request"    # Landroid/app/DownloadManager$Request;

    .prologue
    .line 93
    invoke-virtual {p0}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 94
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 95
    return-void
.end method
