.class Lorg/libsdl/app/SDLSurface$1;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/libsdl/app/SDLSurface;->surfaceChanged(Landroid/view/SurfaceHolder;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/libsdl/app/SDLSurface;

.field final synthetic val$sdlThread:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lorg/libsdl/app/SDLSurface;Ljava/lang/Thread;)V
    .locals 0

    .prologue
    .line 1158
    iput-object p1, p0, Lorg/libsdl/app/SDLSurface$1;->this$0:Lorg/libsdl/app/SDLSurface;

    iput-object p2, p0, Lorg/libsdl/app/SDLSurface$1;->val$sdlThread:Ljava/lang/Thread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1162
    :try_start_0
    iget-object v0, p0, Lorg/libsdl/app/SDLSurface$1;->val$sdlThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1167
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mExitCalledFromJava:Z

    if-nez v0, :cond_0

    .line 1168
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeExit()V

    .line 1171
    :cond_0
    :goto_0
    return-void

    .line 1164
    :catch_0
    move-exception v0

    .line 1167
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mExitCalledFromJava:Z

    if-nez v0, :cond_0

    .line 1168
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeExit()V

    goto :goto_0

    .line 1167
    :catchall_0
    move-exception v0

    sget-boolean v1, Lorg/libsdl/app/SDLActivity;->mExitCalledFromJava:Z

    if-nez v1, :cond_1

    .line 1168
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleNativeExit()V

    :cond_1
    throw v0
.end method
