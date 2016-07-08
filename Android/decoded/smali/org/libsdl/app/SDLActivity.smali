.class public Lorg/libsdl/app/SDLActivity;
.super Landroid/app/Activity;
.source "SDLActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/SDLActivity$ShowTextInputTask;,
        Lorg/libsdl/app/SDLActivity$SDLCommandHandler;
    }
.end annotation


# static fields
.field static final COMMAND_CHANGE_TITLE:I = 0x1

.field static final COMMAND_SET_KEEP_SCREEN_ON:I = 0x5

.field static final COMMAND_TEXTEDIT_HIDE:I = 0x3

.field static final COMMAND_UNUSED:I = 0x2

.field protected static final COMMAND_USER:I = 0x8000

.field private static final TAG:Ljava/lang/String; = "SDL"

.field protected static mAudioTrack:Landroid/media/AudioTrack;

.field public static mBrokenLibraries:Z

.field public static mExitCalledFromJava:Z

.field public static mHasFocus:Z

.field public static mIsPaused:Z

.field public static mIsSurfaceReady:Z

.field protected static mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

.field protected static mLayout:Landroid/view/ViewGroup;

.field protected static mSDLThread:Ljava/lang/Thread;

.field public static mSeparateMouseAndTouch:Z

.field protected static mSingleton:Lorg/libsdl/app/SDLActivity;

.field protected static mSurface:Lorg/libsdl/app/SDLSurface;

.field protected static mTextEdit:Landroid/view/View;


# instance fields
.field commandHandler:Landroid/os/Handler;

.field protected dialogs:I

.field private expansionFile:Ljava/lang/Object;

.field private expansionFileMethod:Ljava/lang/reflect/Method;

.field protected final messageboxSelection:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 412
    new-instance v0, Lorg/libsdl/app/SDLActivity$SDLCommandHandler;

    invoke-direct {v0}, Lorg/libsdl/app/SDLActivity$SDLCommandHandler;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    .line 762
    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    .line 765
    const/4 v0, 0x0

    iput v0, p0, Lorg/libsdl/app/SDLActivity;->dialogs:I

    return-void
.end method

.method public static audioInit(IZZI)I
    .locals 10
    .param p0, "sampleRate"    # I
    .param p1, "is16Bit"    # Z
    .param p2, "isStereo"    # Z
    .param p3, "desiredFrames"    # I

    .prologue
    const/high16 v9, 0x447a0000    # 1000.0f

    const/4 v1, 0x3

    const/4 v6, 0x1

    const/4 v8, 0x2

    .line 562
    if-eqz p2, :cond_0

    move v3, v1

    .line 563
    .local v3, "channelConfig":I
    :goto_0
    if-eqz p1, :cond_1

    move v4, v8

    .line 564
    .local v4, "audioFormat":I
    :goto_1
    if-eqz p2, :cond_2

    move v2, v8

    :goto_2
    if-eqz p1, :cond_3

    move v0, v8

    :goto_3
    mul-int v7, v2, v0

    .line 566
    .local v7, "frameSize":I
    const-string v2, "SDL"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SDL audio: wanted "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p2, :cond_4

    const-string v0, "stereo"

    :goto_4
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p1, :cond_5

    const-string v0, "16-bit"

    :goto_5
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    int-to-float v5, p0

    div-float/2addr v5, v9

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "kHz, "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " frames buffer"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    invoke-static {p0, v3, v4}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v0

    add-int/2addr v0, v7

    add-int/lit8 v0, v0, -0x1

    div-int/2addr v0, v7

    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    move-result p3

    .line 573
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    if-nez v0, :cond_7

    .line 574
    new-instance v0, Landroid/media/AudioTrack;

    mul-int v5, p3, v7

    move v2, p0

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    .line 581
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    if-eq v0, v6, :cond_6

    .line 582
    const-string v0, "SDL"

    const-string v1, "Failed during initialization of Audio Track"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    .line 584
    const/4 v0, -0x1

    .line 592
    :goto_6
    return v0

    .end local v3    # "channelConfig":I
    .end local v4    # "audioFormat":I
    .end local v7    # "frameSize":I
    :cond_0
    move v3, v8

    .line 562
    goto :goto_0

    .restart local v3    # "channelConfig":I
    :cond_1
    move v4, v1

    .line 563
    goto :goto_1

    .restart local v4    # "audioFormat":I
    :cond_2
    move v2, v6

    .line 564
    goto :goto_2

    :cond_3
    move v0, v6

    goto :goto_3

    .line 566
    .restart local v7    # "frameSize":I
    :cond_4
    const-string v0, "mono"

    goto :goto_4

    :cond_5
    const-string v0, "8-bit"

    goto :goto_5

    .line 587
    :cond_6
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 590
    :cond_7
    const-string v1, "SDL"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SDL audio: got "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getChannelCount()I

    move-result v0

    if-lt v0, v8, :cond_8

    const-string v0, "stereo"

    :goto_7
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioFormat()I

    move-result v0

    if-ne v0, v8, :cond_9

    const-string v0, "16-bit"

    :goto_8
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getSampleRate()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v9

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "kHz, "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " frames buffer"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    const/4 v0, 0x0

    goto :goto_6

    .line 590
    :cond_8
    const-string v0, "mono"

    goto :goto_7

    :cond_9
    const-string v0, "8-bit"

    goto :goto_8
.end method

.method public static audioQuit()V
    .locals 1

    .prologue
    .line 641
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    .line 642
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 643
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    .line 645
    :cond_0
    return-void
.end method

.method public static audioWriteByteBuffer([B)V
    .locals 4
    .param p0, "buffer"    # [B

    .prologue
    .line 620
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 621
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    array-length v3, p0

    sub-int/2addr v3, v0

    invoke-virtual {v2, p0, v0, v3}, Landroid/media/AudioTrack;->write([BII)I

    move-result v1

    .line 622
    .local v1, "result":I
    if-lez v1, :cond_0

    .line 623
    add-int/2addr v0, v1

    goto :goto_0

    .line 624
    :cond_0
    if-nez v1, :cond_1

    .line 626
    const-wide/16 v2, 0x1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 627
    :catch_0
    move-exception v2

    goto :goto_0

    .line 631
    :cond_1
    const-string v2, "SDL"

    const-string v3, "SDL audio: error return from write(byte)"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 635
    .end local v1    # "result":I
    :cond_2
    return-void
.end method

.method public static audioWriteShortBuffer([S)V
    .locals 4
    .param p0, "buffer"    # [S

    .prologue
    .line 599
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 600
    sget-object v2, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    array-length v3, p0

    sub-int/2addr v3, v0

    invoke-virtual {v2, p0, v0, v3}, Landroid/media/AudioTrack;->write([SII)I

    move-result v1

    .line 601
    .local v1, "result":I
    if-lez v1, :cond_0

    .line 602
    add-int/2addr v0, v1

    goto :goto_0

    .line 603
    :cond_0
    if-nez v1, :cond_1

    .line 605
    const-wide/16 v2, 0x1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 606
    :catch_0
    move-exception v2

    goto :goto_0

    .line 610
    :cond_1
    const-string v2, "SDL"

    const-string v3, "SDL audio: error return from write(short)"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    .end local v1    # "result":I
    :cond_2
    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 471
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    return-object v0
.end method

.method public static getNativeSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 553
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLSurface;->getNativeSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public static handleJoystickMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p0, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 668
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0, p0}, Lorg/libsdl/app/SDLJoystickHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public static handleNativeExit()V
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    .line 338
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLActivity;->finish()V

    .line 339
    return-void
.end method

.method public static handlePause()V
    .locals 1

    .prologue
    .line 316
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsPaused:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsSurfaceReady:Z

    if-eqz v0, :cond_0

    .line 317
    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsPaused:Z

    .line 318
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativePause()V

    .line 319
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLSurface;->handlePause()V

    .line 321
    :cond_0
    return-void
.end method

.method public static handleResume()V
    .locals 1

    .prologue
    .line 328
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsPaused:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsSurfaceReady:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    if-eqz v0, :cond_0

    .line 329
    const/4 v0, 0x0

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsPaused:Z

    .line 330
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeResume()V

    .line 331
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLSurface;->handleResume()V

    .line 333
    :cond_0
    return-void
.end method

.method public static initialize()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 102
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    .line 103
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    .line 104
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mTextEdit:Landroid/view/View;

    .line 105
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    .line 106
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    .line 107
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    .line 108
    sput-object v0, Lorg/libsdl/app/SDLActivity;->mAudioTrack:Landroid/media/AudioTrack;

    .line 109
    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mExitCalledFromJava:Z

    .line 110
    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 111
    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mIsPaused:Z

    .line 112
    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mIsSurfaceReady:Z

    .line 113
    const/4 v0, 0x1

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    .line 114
    return-void
.end method

.method public static inputGetInputDeviceIds(I)[I
    .locals 7
    .param p0, "sources"    # I

    .prologue
    .line 654
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v3

    .line 655
    .local v3, "ids":[I
    array-length v6, v3

    new-array v1, v6, [I

    .line 656
    .local v1, "filtered":[I
    const/4 v4, 0x0

    .line 657
    .local v4, "used":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v3

    if-ge v2, v6, :cond_1

    .line 658
    aget v6, v3, v2

    invoke-static {v6}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v0

    .line 659
    .local v0, "device":Landroid/view/InputDevice;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/InputDevice;->getSources()I

    move-result v6

    and-int/2addr v6, p0

    if-eqz v6, :cond_0

    .line 660
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "used":I
    .local v5, "used":I
    invoke-virtual {v0}, Landroid/view/InputDevice;->getId()I

    move-result v6

    aput v6, v1, v4

    move v4, v5

    .line 657
    .end local v5    # "used":I
    .restart local v4    # "used":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 663
    .end local v0    # "device":Landroid/view/InputDevice;
    :cond_1
    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v6

    return-object v6
.end method

.method public static native nativeAddJoystick(ILjava/lang/String;IIIII)I
.end method

.method public static native nativeGetHint(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native nativeInit(Ljava/lang/Object;)I
.end method

.method public static native nativeLowMemory()V
.end method

.method public static native nativePause()V
.end method

.method public static native nativeQuit()V
.end method

.method public static native nativeRemoveJoystick(I)I
.end method

.method public static native nativeResume()V
.end method

.method public static native onNativeAccel(FFF)V
.end method

.method public static native onNativeDropFile(Ljava/lang/String;)V
.end method

.method public static native onNativeHat(IIII)V
.end method

.method public static native onNativeJoy(IIF)V
.end method

.method public static native onNativeKeyDown(I)V
.end method

.method public static native onNativeKeyUp(I)V
.end method

.method public static native onNativeKeyboardFocusLost()V
.end method

.method public static native onNativeMouse(IIFF)V
.end method

.method public static native onNativePadDown(II)I
.end method

.method public static native onNativePadUp(II)I
.end method

.method public static native onNativeResize(IIIF)V
.end method

.method public static native onNativeSurfaceChanged()V
.end method

.method public static native onNativeSurfaceDestroyed()V
.end method

.method public static native onNativeTouch(IIIFFF)V
.end method

.method public static pollInputDevices()V
    .locals 1

    .prologue
    .line 675
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 676
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    invoke-virtual {v0}, Lorg/libsdl/app/SDLJoystickHandler;->pollInputDevices()V

    .line 678
    :cond_0
    return-void
.end method

.method public static sendMessage(II)Z
    .locals 2
    .param p0, "command"    # I
    .param p1, "param"    # I

    .prologue
    .line 464
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lorg/libsdl/app/SDLActivity;->sendCommand(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static setActivityTitle(Ljava/lang/String;)Z
    .locals 2
    .param p0, "title"    # Ljava/lang/String;

    .prologue
    .line 457
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p0}, Lorg/libsdl/app/SDLActivity;->sendCommand(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static showTextInput(IIII)Z
    .locals 2
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    .line 546
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    iget-object v0, v0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    new-instance v1, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;

    invoke-direct {v1, p0, p1, p2, p3}, Lorg/libsdl/app/SDLActivity$ShowTextInputTask;-><init>(IIII)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 294
    sget-boolean v2, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v2, :cond_1

    .line 308
    :cond_0
    :goto_0
    return v1

    .line 298
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 300
    .local v0, "keyCode":I
    const/16 v2, 0x19

    if-eq v0, v2, :cond_0

    const/16 v2, 0x18

    if-eq v0, v2, :cond_0

    const/16 v2, 0x1b

    if-eq v0, v2, :cond_0

    const/16 v2, 0xa8

    if-eq v0, v2, :cond_0

    const/16 v2, 0xa9

    if-eq v0, v2, :cond_0

    .line 308
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method protected getArguments()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method protected getLibraries()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 72
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDL2"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "main"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getSystemServiceFromUiThread(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 479
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 480
    .local v1, "lock":Ljava/lang/Object;
    const/4 v3, 0x2

    new-array v2, v3, [Ljava/lang/Object;

    .line 481
    .local v2, "results":[Ljava/lang/Object;
    monitor-enter v1

    .line 482
    :try_start_0
    new-instance v3, Lorg/libsdl/app/SDLActivity$2;

    invoke-direct {v3, p0, v1, v2, p1}, Lorg/libsdl/app/SDLActivity$2;-><init>(Lorg/libsdl/app/SDLActivity;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/libsdl/app/SDLActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 492
    const/4 v3, 0x1

    aget-object v3, v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_0

    .line 494
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 499
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 500
    const/4 v3, 0x0

    aget-object v3, v2, v3

    return-object v3

    .line 495
    :catch_0
    move-exception v0

    .line 496
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 499
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3
.end method

.method public loadLibraries()V
    .locals 4

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getLibraries()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 85
    .local v3, "lib":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 84
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 87
    .end local v3    # "lib":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public messageboxShowMessageBox(ILjava/lang/String;Ljava/lang/String;[I[I[Ljava/lang/String;[I)I
    .locals 6
    .param p1, "flags"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "buttonFlags"    # [I
    .param p5, "buttonIds"    # [I
    .param p6, "buttonTexts"    # [Ljava/lang/String;
    .param p7, "colors"    # [I

    .prologue
    const/4 v5, 0x0

    const/4 v2, -0x1

    .line 786
    iget-object v3, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    aput v2, v3, v5

    .line 790
    array-length v3, p4

    array-length v4, p5

    if-eq v3, v4, :cond_0

    array-length v3, p5

    array-length v4, p6

    if-eq v3, v4, :cond_0

    .line 827
    :goto_0
    return v2

    .line 796
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 797
    .local v0, "args":Landroid/os/Bundle;
    const-string v3, "flags"

    invoke-virtual {v0, v3, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 798
    const-string v3, "title"

    invoke-virtual {v0, v3, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 799
    const-string v3, "message"

    invoke-virtual {v0, v3, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 800
    const-string v3, "buttonFlags"

    invoke-virtual {v0, v3, p4}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 801
    const-string v3, "buttonIds"

    invoke-virtual {v0, v3, p5}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 802
    const-string v3, "buttonTexts"

    invoke-virtual {v0, v3, p6}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 803
    const-string v3, "colors"

    invoke-virtual {v0, v3, p7}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 807
    new-instance v3, Lorg/libsdl/app/SDLActivity$3;

    invoke-direct {v3, p0, v0}, Lorg/libsdl/app/SDLActivity$3;-><init>(Lorg/libsdl/app/SDLActivity;Landroid/os/Bundle;)V

    invoke-virtual {p0, v3}, Lorg/libsdl/app/SDLActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 816
    iget-object v3, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    monitor-enter v3

    .line 818
    :try_start_0
    iget-object v4, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 823
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 827
    iget-object v2, p0, Lorg/libsdl/app/SDLActivity;->messageboxSelection:[I

    aget v2, v2, v5

    goto :goto_0

    .line 819
    :catch_0
    move-exception v1

    .line 820
    .local v1, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 821
    monitor-exit v3

    goto :goto_0

    .line 823
    .end local v1    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    .line 119
    const-string v5, "SDL"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Device: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    const-string v5, "SDL"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Model: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    const-string v5, "SDL"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onCreate(): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 124
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->startNative()V

    .line 127
    const-string v2, ""

    .line 129
    .local v2, "errorMsgBrokenLib":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->loadLibraries()V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 140
    :goto_0
    sget-boolean v5, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v5, :cond_1

    .line 142
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 143
    .local v0, "dlgAlert":Landroid/app/AlertDialog$Builder;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "An error occurred while trying to start the application. Please try again and/or reinstall."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "line.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "line.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 147
    const-string v5, "SDL Error"

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 148
    const-string v5, "Exit"

    new-instance v6, Lorg/libsdl/app/SDLActivity$1;

    invoke-direct {v6, p0}, Lorg/libsdl/app/SDLActivity$1;-><init>(Lorg/libsdl/app/SDLActivity;)V

    invoke-virtual {v0, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 156
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 157
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    .line 172
    .end local v0    # "dlgAlert":Landroid/app/AlertDialog$Builder;
    :cond_0
    :goto_1
    return-void

    .line 130
    :catch_0
    move-exception v1

    .line 131
    .local v1, "e":Ljava/lang/UnsatisfiedLinkError;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/UnsatisfiedLinkError;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 132
    sput-boolean v8, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 133
    invoke-virtual {v1}, Ljava/lang/UnsatisfiedLinkError;->getMessage()Ljava/lang/String;

    move-result-object v2

    .line 138
    goto :goto_0

    .line 134
    .end local v1    # "e":Ljava/lang/UnsatisfiedLinkError;
    :catch_1
    move-exception v1

    .line 135
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 136
    sput-boolean v8, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    .line 137
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 163
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 165
    .local v4, "intent":Landroid/content/Intent;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 166
    invoke-virtual {v4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 167
    .local v3, "filename":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 168
    const-string v5, "SDL"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got filename: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    invoke-static {v3}, Lorg/libsdl/app/SDLActivity;->onNativeDropFile(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
    .locals 22
    .param p1, "ignore"    # I
    .param p2, "args"    # Landroid/os/Bundle;

    .prologue
    .line 837
    const-string v21, "colors"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v12

    .line 843
    .local v12, "colors":[I
    if-eqz v12, :cond_7

    .line 844
    const/16 v16, -0x1

    .line 845
    .local v16, "i":I
    add-int/lit8 v16, v16, 0x1

    aget v3, v12, v16

    .line 846
    .local v3, "backgroundColor":I
    add-int/lit8 v16, v16, 0x1

    aget v20, v12, v16

    .line 847
    .local v20, "textColor":I
    add-int/lit8 v16, v16, 0x1

    aget v6, v12, v16

    .line 848
    .local v6, "buttonBorderColor":I
    add-int/lit8 v16, v16, 0x1

    aget v5, v12, v16

    .line 849
    .local v5, "buttonBackgroundColor":I
    add-int/lit8 v16, v16, 0x1

    aget v9, v12, v16

    .line 860
    .end local v16    # "i":I
    .local v9, "buttonSelectedColor":I
    :goto_0
    new-instance v14, Landroid/app/Dialog;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 861
    .local v14, "dialog":Landroid/app/Dialog;
    const-string v21, "title"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 862
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 863
    new-instance v21, Lorg/libsdl/app/SDLActivity$4;

    invoke-direct/range {v21 .. v22}, Lorg/libsdl/app/SDLActivity$4;-><init>(Lorg/libsdl/app/SDLActivity;)V

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 874
    new-instance v19, Landroid/widget/TextView;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 875
    .local v19, "message":Landroid/widget/TextView;
    const/16 v21, 0x11

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 876
    const-string v21, "message"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 877
    if-eqz v20, :cond_0

    .line 878
    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setTextColor(I)V

    .line 883
    :cond_0
    const-string v21, "buttonFlags"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v7

    .line 884
    .local v7, "buttonFlags":[I
    const-string v21, "buttonIds"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v8

    .line 885
    .local v8, "buttonIds":[I
    const-string v21, "buttonTexts"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 887
    .local v10, "buttonTexts":[Ljava/lang/String;
    new-instance v18, Landroid/util/SparseArray;

    invoke-direct/range {v18 .. v18}, Landroid/util/SparseArray;-><init>()V

    .line 889
    .local v18, "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    new-instance v11, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 890
    .local v11, "buttons":Landroid/widget/LinearLayout;
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 891
    const/16 v21, 0x11

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 892
    const/16 v16, 0x0

    .restart local v16    # "i":I
    :goto_1
    array-length v0, v10

    move/from16 v21, v0

    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_9

    .line 893
    new-instance v4, Landroid/widget/Button;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 894
    .local v4, "button":Landroid/widget/Button;
    aget v17, v8, v16

    .line 895
    .local v17, "id":I
    new-instance v21, Lorg/libsdl/app/SDLActivity$5;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move/from16 v2, v17

    invoke-direct {v0, v1, v2, v14}, Lorg/libsdl/app/SDLActivity$5;-><init>(Lorg/libsdl/app/SDLActivity;ILandroid/app/Dialog;)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 902
    aget v21, v7, v16

    if-eqz v21, :cond_2

    .line 904
    aget v21, v7, v16

    and-int/lit8 v21, v21, 0x1

    if-eqz v21, :cond_1

    .line 905
    const/16 v21, 0x42

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 907
    :cond_1
    aget v21, v7, v16

    and-int/lit8 v21, v21, 0x2

    if-eqz v21, :cond_2

    .line 908
    const/16 v21, 0x6f

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 911
    :cond_2
    aget-object v21, v10, v16

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 912
    if-eqz v20, :cond_3

    .line 913
    move/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setTextColor(I)V

    .line 915
    :cond_3
    if-eqz v6, :cond_4

    .line 918
    :cond_4
    if-eqz v5, :cond_5

    .line 919
    invoke-virtual {v4}, Landroid/widget/Button;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v15

    .line 920
    .local v15, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v15, :cond_8

    .line 922
    invoke-virtual {v4, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 928
    .end local v15    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_5
    :goto_2
    if-eqz v9, :cond_6

    .line 931
    :cond_6
    invoke-virtual {v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 892
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 851
    .end local v3    # "backgroundColor":I
    .end local v4    # "button":Landroid/widget/Button;
    .end local v5    # "buttonBackgroundColor":I
    .end local v6    # "buttonBorderColor":I
    .end local v7    # "buttonFlags":[I
    .end local v8    # "buttonIds":[I
    .end local v9    # "buttonSelectedColor":I
    .end local v10    # "buttonTexts":[Ljava/lang/String;
    .end local v11    # "buttons":Landroid/widget/LinearLayout;
    .end local v14    # "dialog":Landroid/app/Dialog;
    .end local v16    # "i":I
    .end local v17    # "id":I
    .end local v18    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .end local v19    # "message":Landroid/widget/TextView;
    .end local v20    # "textColor":I
    :cond_7
    const/4 v3, 0x0

    .line 852
    .restart local v3    # "backgroundColor":I
    const/16 v20, 0x0

    .line 853
    .restart local v20    # "textColor":I
    const/4 v6, 0x0

    .line 854
    .restart local v6    # "buttonBorderColor":I
    const/4 v5, 0x0

    .line 855
    .restart local v5    # "buttonBackgroundColor":I
    const/4 v9, 0x0

    .restart local v9    # "buttonSelectedColor":I
    goto/16 :goto_0

    .line 925
    .restart local v4    # "button":Landroid/widget/Button;
    .restart local v7    # "buttonFlags":[I
    .restart local v8    # "buttonIds":[I
    .restart local v10    # "buttonTexts":[Ljava/lang/String;
    .restart local v11    # "buttons":Landroid/widget/LinearLayout;
    .restart local v14    # "dialog":Landroid/app/Dialog;
    .restart local v15    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v16    # "i":I
    .restart local v17    # "id":I
    .restart local v18    # "mapping":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/widget/Button;>;"
    .restart local v19    # "message":Landroid/widget/TextView;
    :cond_8
    sget-object v21, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, v21

    invoke-virtual {v15, v5, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_2

    .line 936
    .end local v4    # "button":Landroid/widget/Button;
    .end local v15    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v17    # "id":I
    :cond_9
    new-instance v13, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 937
    .local v13, "content":Landroid/widget/LinearLayout;
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 938
    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 939
    invoke-virtual {v13, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 940
    if-eqz v3, :cond_a

    .line 941
    invoke-virtual {v13, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 946
    :cond_a
    invoke-virtual {v14, v13}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 947
    new-instance v21, Lorg/libsdl/app/SDLActivity$6;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/libsdl/app/SDLActivity$6;-><init>(Lorg/libsdl/app/SDLActivity;Landroid/util/SparseArray;)V

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 961
    return-object v14
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 275
    const-string v0, "SDL"

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 278
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 280
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->initialize()V

    .line 289
    :goto_0
    return-void

    .line 284
    :cond_0
    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->resetNative()V

    .line 286
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 288
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->initialize()V

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 217
    const-string v0, "SDL"

    const-string v1, "onLowMemory()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 220
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 225
    :goto_0
    return-void

    .line 224
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeLowMemory()V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 177
    const-string v0, "SDL"

    const-string v1, "onPause()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 180
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 185
    :goto_0
    return-void

    .line 184
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handlePause()V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 189
    const-string v0, "SDL"

    const-string v1, "onResume()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 192
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_0

    .line 197
    :goto_0
    return-void

    .line 196
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleResume()V

    goto :goto_0
.end method

.method protected onUnhandledMessage(ILjava/lang/Object;)Z
    .locals 1
    .param p1, "command"    # I
    .param p2, "param"    # Ljava/lang/Object;

    .prologue
    .line 359
    const/4 v0, 0x0

    return v0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 202
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 203
    const-string v0, "SDL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    sget-boolean v0, Lorg/libsdl/app/SDLActivity;->mBrokenLibraries:Z

    if-eqz v0, :cond_1

    .line 213
    :cond_0
    :goto_0
    return-void

    .line 209
    :cond_1
    sput-boolean p1, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    .line 210
    if-eqz p1, :cond_0

    .line 211
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleResume()V

    goto :goto_0
.end method

.method public openAPKExpansionInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 11
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 704
    iget-object v6, p0, Lorg/libsdl/app/SDLActivity;->expansionFile:Ljava/lang/Object;

    if-nez v6, :cond_2

    .line 705
    const-string v6, "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION"

    invoke-static {v6}, Lorg/libsdl/app/SDLActivity;->nativeGetHint(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 706
    .local v2, "mainHint":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 756
    .end local v2    # "mainHint":Ljava/lang/String;
    :cond_0
    return-object v1

    .line 709
    .restart local v2    # "mainHint":Ljava/lang/String;
    :cond_1
    const-string v6, "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION"

    invoke-static {v6}, Lorg/libsdl/app/SDLActivity;->nativeGetHint(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 710
    .local v4, "patchHint":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 717
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    .line 718
    .local v3, "mainVersion":Ljava/lang/Integer;
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 727
    .local v5, "patchVersion":Ljava/lang/Integer;
    :try_start_1
    const-string v6, "com.android.vending.expansion.zipfile.APKExpansionSupport"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-string v7, "getAPKExpansionZipFile"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/content/Context;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v8, v9

    const/4 v9, 0x2

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p0, v8, v9

    const/4 v9, 0x1

    aput-object v3, v8, v9

    const/4 v9, 0x2

    aput-object v5, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lorg/libsdl/app/SDLActivity;->expansionFile:Ljava/lang/Object;

    .line 731
    iget-object v6, p0, Lorg/libsdl/app/SDLActivity;->expansionFile:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "getInputStream"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    iput-object v6, p0, Lorg/libsdl/app/SDLActivity;->expansionFileMethod:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 744
    .end local v2    # "mainHint":Ljava/lang/String;
    .end local v3    # "mainVersion":Ljava/lang/Integer;
    .end local v4    # "patchHint":Ljava/lang/String;
    .end local v5    # "patchVersion":Ljava/lang/Integer;
    :cond_2
    :try_start_2
    iget-object v6, p0, Lorg/libsdl/app/SDLActivity;->expansionFileMethod:Ljava/lang/reflect/Method;

    iget-object v7, p0, Lorg/libsdl/app/SDLActivity;->expansionFile:Ljava/lang/Object;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/InputStream;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 751
    .local v1, "fileStream":Ljava/io/InputStream;
    if-nez v1, :cond_0

    .line 753
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Could not find path in APK expansion file"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 719
    .end local v1    # "fileStream":Ljava/io/InputStream;
    .restart local v2    # "mainHint":Ljava/lang/String;
    .restart local v4    # "patchHint":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 720
    .local v0, "ex":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 721
    new-instance v6, Ljava/io/IOException;

    const-string v7, "No valid file versions set for APK expansion files"

    invoke-direct {v6, v7, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 733
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    .restart local v3    # "mainVersion":Ljava/lang/Integer;
    .restart local v5    # "patchVersion":Ljava/lang/Integer;
    :catch_1
    move-exception v0

    .line 734
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 735
    iput-object v1, p0, Lorg/libsdl/app/SDLActivity;->expansionFile:Ljava/lang/Object;

    .line 736
    iput-object v1, p0, Lorg/libsdl/app/SDLActivity;->expansionFileMethod:Ljava/lang/reflect/Method;

    .line 737
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Could not access APK expansion support library"

    invoke-direct {v6, v7, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 745
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "mainHint":Ljava/lang/String;
    .end local v3    # "mainVersion":Ljava/lang/Integer;
    .end local v4    # "patchHint":Ljava/lang/String;
    .end local v5    # "patchVersion":Ljava/lang/Integer;
    :catch_2
    move-exception v0

    .line 747
    .restart local v0    # "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 748
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Could not open stream from APK expansion file"

    invoke-direct {v6, v7, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
.end method

.method public openAPKExtensionInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 694
    invoke-virtual {p0, p1}, Lorg/libsdl/app/SDLActivity;->openAPKExpansionInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public resetNative()V
    .locals 4

    .prologue
    .line 230
    const-string v1, "SDL"

    const-string v2, "resetNative()"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    const/4 v1, 0x1

    sput-boolean v1, Lorg/libsdl/app/SDLActivity;->mExitCalledFromJava:Z

    .line 234
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->nativeQuit()V

    .line 237
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 239
    :try_start_0
    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    :goto_0
    const/4 v1, 0x0

    sput-object v1, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    .line 248
    :cond_0
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->initialize()V

    .line 249
    return-void

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "SDL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Problem stopping thread: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method sendCommand(ILjava/lang/Object;)Z
    .locals 2
    .param p1, "command"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 416
    iget-object v1, p0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 417
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 418
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 419
    iget-object v1, p0, Lorg/libsdl/app/SDLActivity;->commandHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    move-result v1

    return v1
.end method

.method public startNative()V
    .locals 2

    .prologue
    .line 252
    const-string v0, "SDL"

    const-string v1, "startNative()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->initialize()V

    .line 255
    sput-object p0, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    .line 258
    new-instance v0, Lorg/libsdl/app/SDLSurface;

    invoke-virtual {p0}, Lorg/libsdl/app/SDLActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/libsdl/app/SDLSurface;-><init>(Landroid/content/Context;)V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    .line 260
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_0

    .line 261
    new-instance v0, Lorg/libsdl/app/SDLJoystickHandler_API12;

    invoke-direct {v0}, Lorg/libsdl/app/SDLJoystickHandler_API12;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    .line 267
    :goto_0
    new-instance v0, Landroid/widget/AbsoluteLayout;

    invoke-direct {v0, p0}, Landroid/widget/AbsoluteLayout;-><init>(Landroid/content/Context;)V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    .line 268
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    sget-object v1, Lorg/libsdl/app/SDLActivity;->mSurface:Lorg/libsdl/app/SDLSurface;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 270
    sget-object v0, Lorg/libsdl/app/SDLActivity;->mLayout:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLActivity;->setContentView(Landroid/view/View;)V

    .line 271
    return-void

    .line 264
    :cond_0
    new-instance v0, Lorg/libsdl/app/SDLJoystickHandler;

    invoke-direct {v0}, Lorg/libsdl/app/SDLJoystickHandler;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLActivity;->mJoystickHandler:Lorg/libsdl/app/SDLJoystickHandler;

    goto :goto_0
.end method
