.class Lorg/love2d/android/GameActivity$1;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/love2d/android/GameActivity;->setImmersiveMode(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/love2d/android/GameActivity;

.field final synthetic val$immersive_enabled:Z

.field final synthetic val$lock:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/love2d/android/GameActivity;Ljava/lang/Object;Z)V
    .locals 0

    .prologue
    .line 137
    iput-object p1, p0, Lorg/love2d/android/GameActivity$1;->this$0:Lorg/love2d/android/GameActivity;

    iput-object p2, p0, Lorg/love2d/android/GameActivity$1;->val$lock:Ljava/lang/Object;

    iput-boolean p3, p0, Lorg/love2d/android/GameActivity$1;->val$immersive_enabled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 140
    iget-object v1, p0, Lorg/love2d/android/GameActivity$1;->val$lock:Ljava/lang/Object;

    monitor-enter v1

    .line 141
    :try_start_0
    iget-boolean v0, p0, Lorg/love2d/android/GameActivity$1;->val$immersive_enabled:Z

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lorg/love2d/android/GameActivity$1;->this$0:Lorg/love2d/android/GameActivity;

    invoke-virtual {v0}, Lorg/love2d/android/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x1706

    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 156
    :goto_0
    iget-object v0, p0, Lorg/love2d/android/GameActivity$1;->val$lock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 157
    monitor-exit v1

    .line 158
    return-void

    .line 150
    :cond_0
    iget-object v0, p0, Lorg/love2d/android/GameActivity$1;->this$0:Lorg/love2d/android/GameActivity;

    invoke-virtual {v0}, Lorg/love2d/android/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x500

    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 157
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
