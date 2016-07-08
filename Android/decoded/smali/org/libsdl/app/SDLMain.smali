.class Lorg/libsdl/app/SDLMain;
.super Ljava/lang/Object;
.source "SDLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 968
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 972
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->getArguments()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/SDLActivity;->nativeInit(Ljava/lang/Object;)I

    .line 975
    return-void
.end method
