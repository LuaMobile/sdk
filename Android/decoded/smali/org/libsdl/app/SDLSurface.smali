.class Lorg/libsdl/app/SDLSurface;
.super Landroid/view/SurfaceView;
.source "SDLActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/hardware/SensorEventListener;


# static fields
.field protected static mDisplay:Landroid/view/Display;

.field protected static mHeight:F

.field protected static mSensorManager:Landroid/hardware/SensorManager;

.field protected static mWidth:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    .line 997
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 998
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 1000
    invoke-virtual {p0, v1}, Lorg/libsdl/app/SDLSurface;->setFocusable(Z)V

    .line 1001
    invoke-virtual {p0, v1}, Lorg/libsdl/app/SDLSurface;->setFocusableInTouchMode(Z)V

    .line 1002
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->requestFocus()Z

    .line 1003
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1004
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1006
    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    sput-object v0, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    .line 1007
    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    sput-object v0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    .line 1009
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_0

    .line 1010
    new-instance v0, Lorg/libsdl/app/SDLGenericMotionListener_API12;

    invoke-direct {v0}, Lorg/libsdl/app/SDLGenericMotionListener_API12;-><init>()V

    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setOnGenericMotionListener(Landroid/view/View$OnGenericMotionListener;)V

    .line 1014
    :cond_0
    sput v2, Lorg/libsdl/app/SDLSurface;->mWidth:F

    .line 1015
    sput v2, Lorg/libsdl/app/SDLSurface;->mHeight:F

    .line 1016
    return-void
.end method


# virtual methods
.method public enableSensor(IZ)V
    .locals 4
    .param p1, "sensortype"    # I
    .param p2, "enabled"    # Z

    .prologue
    .line 1307
    if-eqz p2, :cond_0

    .line 1308
    sget-object v0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    sget-object v1, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, p1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 1315
    :goto_0
    return-void

    .line 1312
    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    sget-object v1, Lorg/libsdl/app/SDLSurface;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, p1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    goto :goto_0
.end method

.method public getNativeSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 1032
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public handlePause()V
    .locals 2

    .prologue
    .line 1019
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/libsdl/app/SDLSurface;->enableSensor(IZ)V

    .line 1020
    return-void
.end method

.method public handleResume()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 1023
    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setFocusable(Z)V

    .line 1024
    invoke-virtual {p0, v0}, Lorg/libsdl/app/SDLSurface;->setFocusableInTouchMode(Z)V

    .line 1025
    invoke-virtual {p0}, Lorg/libsdl/app/SDLSurface;->requestFocus()Z

    .line 1026
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1027
    invoke-virtual {p0, p0}, Lorg/libsdl/app/SDLSurface;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1028
    invoke-virtual {p0, v0, v0}, Lorg/libsdl/app/SDLSurface;->enableSensor(IZ)V

    .line 1029
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 1320
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 1188
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    and-int/lit16 v1, v1, 0x401

    if-nez v1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    and-int/lit16 v1, v1, 0x201

    if-eqz v1, :cond_3

    .line 1190
    :cond_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_2

    .line 1191
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-static {v1, p2}, Lorg/libsdl/app/SDLActivity;->onNativePadDown(II)I

    move-result v1

    if-nez v1, :cond_3

    .line 1214
    :cond_1
    :goto_0
    return v0

    .line 1194
    :cond_2
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_3

    .line 1195
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-static {v1, p2}, Lorg/libsdl/app/SDLActivity;->onNativePadUp(II)I

    move-result v1

    if-eqz v1, :cond_1

    .line 1201
    :cond_3
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    and-int/lit16 v1, v1, 0x101

    if-eqz v1, :cond_5

    .line 1202
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_4

    .line 1204
    invoke-static {p2}, Lorg/libsdl/app/SDLActivity;->onNativeKeyDown(I)V

    goto :goto_0

    .line 1207
    :cond_4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_5

    .line 1209
    invoke-static {p2}, Lorg/libsdl/app/SDLActivity;->onNativeKeyUp(I)V

    goto :goto_0

    .line 1214
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const v6, 0x411ce80a

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1324
    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    if-ne v2, v3, :cond_0

    .line 1326
    sget-object v2, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 1340
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v2, v4

    .line 1341
    .local v0, "x":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v2, v3

    .line 1344
    .local v1, "y":F
    :goto_0
    neg-float v2, v0

    div-float/2addr v2, v6

    div-float v3, v1, v6

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v5, 0x2

    aget v4, v4, v5

    div-float/2addr v4, v6

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v4, v5

    invoke-static {v2, v3, v4}, Lorg/libsdl/app/SDLActivity;->onNativeAccel(FFF)V

    .line 1348
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_0
    return-void

    .line 1328
    :pswitch_0
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    neg-float v0, v2

    .line 1329
    .restart local v0    # "x":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v2, v4

    .line 1330
    .restart local v1    # "y":F
    goto :goto_0

    .line 1332
    .end local v0    # "x":F
    .end local v1    # "y":F
    :pswitch_1
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v2, v3

    .line 1333
    .restart local v0    # "x":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v4

    neg-float v1, v2

    .line 1334
    .restart local v1    # "y":F
    goto :goto_0

    .line 1336
    .end local v0    # "x":F
    .end local v1    # "y":F
    :pswitch_2
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    neg-float v0, v2

    .line 1337
    .restart local v0    # "x":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v4

    neg-float v1, v2

    .line 1338
    .restart local v1    # "y":F
    goto :goto_0

    .line 1326
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 17
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1221
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v1

    .line 1222
    .local v1, "touchDevId":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v16

    .line 1223
    .local v16, "pointerCount":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    .line 1226
    .local v3, "action":I
    const/4 v14, -0x1

    .line 1230
    .local v14, "i":I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getSource()I

    move-result v7

    const/16 v8, 0x2002

    if-ne v7, v8, :cond_2

    sget-boolean v7, Lorg/libsdl/app/SDLActivity;->mSeparateMouseAndTouch:Z

    if-eqz v7, :cond_2

    .line 1231
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xe

    if-ge v7, v8, :cond_1

    .line 1232
    const/4 v15, 0x1

    .line 1240
    .local v15, "mouseButton":I
    :goto_0
    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    const/4 v8, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    invoke-static {v15, v3, v7, v8}, Lorg/libsdl/app/SDLActivity;->onNativeMouse(IIFF)V

    .line 1301
    .end local v15    # "mouseButton":I
    :cond_0
    :goto_1
    const/4 v7, 0x1

    return v7

    .line 1235
    :cond_1
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "getButtonState"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    move-object/from16 v0, p2

    invoke-virtual {v7, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v15

    .restart local v15    # "mouseButton":I
    goto :goto_0

    .line 1236
    .end local v15    # "mouseButton":I
    :catch_0
    move-exception v13

    .line 1237
    .local v13, "e":Ljava/lang/Exception;
    const/4 v15, 0x1

    .restart local v15    # "mouseButton":I
    goto :goto_0

    .line 1242
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v15    # "mouseButton":I
    :cond_2
    packed-switch v3, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 1261
    :pswitch_1
    const/4 v14, 0x0

    .line 1265
    :pswitch_2
    const/4 v7, -0x1

    if-ne v14, v7, :cond_3

    .line 1266
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v14

    .line 1269
    :cond_3
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 1270
    .local v2, "pointerFingerId":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    sget v8, Lorg/libsdl/app/SDLSurface;->mWidth:F

    div-float v4, v7, v8

    .line 1271
    .local v4, "x":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    sget v8, Lorg/libsdl/app/SDLSurface;->mHeight:F

    div-float v5, v7, v8

    .line 1272
    .local v5, "y":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v6

    .line 1273
    .local v6, "p":F
    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v7, v6, v7

    if-lez v7, :cond_4

    .line 1276
    const/high16 v6, 0x3f800000    # 1.0f

    .line 1278
    :cond_4
    invoke-static/range {v1 .. v6}, Lorg/libsdl/app/SDLActivity;->onNativeTouch(IIIFFF)V

    goto :goto_1

    .line 1244
    .end local v2    # "pointerFingerId":I
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local v6    # "p":F
    :pswitch_3
    const/4 v14, 0x0

    :goto_2
    move/from16 v0, v16

    if-ge v14, v0, :cond_0

    .line 1245
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 1246
    .restart local v2    # "pointerFingerId":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    sget v8, Lorg/libsdl/app/SDLSurface;->mWidth:F

    div-float v4, v7, v8

    .line 1247
    .restart local v4    # "x":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    sget v8, Lorg/libsdl/app/SDLSurface;->mHeight:F

    div-float v5, v7, v8

    .line 1248
    .restart local v5    # "y":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v6

    .line 1249
    .restart local v6    # "p":F
    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v7, v6, v7

    if-lez v7, :cond_5

    .line 1252
    const/high16 v6, 0x3f800000    # 1.0f

    .line 1254
    :cond_5
    invoke-static/range {v1 .. v6}, Lorg/libsdl/app/SDLActivity;->onNativeTouch(IIIFFF)V

    .line 1244
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 1282
    .end local v2    # "pointerFingerId":I
    .end local v4    # "x":F
    .end local v5    # "y":F
    .end local v6    # "p":F
    :pswitch_4
    const/4 v14, 0x0

    :goto_3
    move/from16 v0, v16

    if-ge v14, v0, :cond_0

    .line 1283
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 1284
    .restart local v2    # "pointerFingerId":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    sget v8, Lorg/libsdl/app/SDLSurface;->mWidth:F

    div-float v4, v7, v8

    .line 1285
    .restart local v4    # "x":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    sget v8, Lorg/libsdl/app/SDLSurface;->mHeight:F

    div-float v5, v7, v8

    .line 1286
    .restart local v5    # "y":F
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v6

    .line 1287
    .restart local v6    # "p":F
    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v7, v6, v7

    if-lez v7, :cond_6

    .line 1290
    const/high16 v6, 0x3f800000    # 1.0f

    .line 1292
    :cond_6
    const/4 v9, 0x1

    move v7, v1

    move v8, v2

    move v10, v4

    move v11, v5

    move v12, v6

    invoke-static/range {v7 .. v12}, Lorg/libsdl/app/SDLActivity;->onNativeTouch(IIIFFF)V

    .line 1282
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 1242
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 14
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 1056
    const-string v10, "SDL"

    const-string v11, "surfaceChanged()"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1058
    const v7, 0x15151002

    .line 1059
    .local v7, "sdlFormat":I
    packed-switch p2, :pswitch_data_0

    .line 1099
    :pswitch_0
    const-string v10, "SDL"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "pixel format unknown "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    :goto_0
    move/from16 v0, p3

    int-to-float v10, v0

    sput v10, Lorg/libsdl/app/SDLSurface;->mWidth:F

    .line 1104
    move/from16 v0, p4

    int-to-float v10, v0

    sput v10, Lorg/libsdl/app/SDLSurface;->mHeight:F

    .line 1105
    sget-object v10, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v10}, Landroid/view/Display;->getRefreshRate()F

    move-result v10

    move/from16 v0, p3

    move/from16 v1, p4

    invoke-static {v0, v1, v7, v10}, Lorg/libsdl/app/SDLActivity;->onNativeResize(IIIF)V

    .line 1106
    const-string v10, "SDL"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Window size: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "x"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p4

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1109
    const/4 v9, 0x0

    .line 1110
    .local v9, "skip":Z
    sget-object v10, Lorg/libsdl/app/SDLActivity;->mSingleton:Lorg/libsdl/app/SDLActivity;

    invoke-virtual {v10}, Lorg/libsdl/app/SDLActivity;->getRequestedOrientation()I

    move-result v6

    .line 1112
    .local v6, "requestedOrientation":I
    const/4 v10, -0x1

    if-ne v6, v10, :cond_3

    .line 1128
    :cond_0
    :goto_1
    if-eqz v9, :cond_1

    .line 1129
    sget v10, Lorg/libsdl/app/SDLSurface;->mWidth:F

    sget v11, Lorg/libsdl/app/SDLSurface;->mHeight:F

    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v10

    float-to-double v4, v10

    .line 1130
    .local v4, "min":D
    sget v10, Lorg/libsdl/app/SDLSurface;->mWidth:F

    sget v11, Lorg/libsdl/app/SDLSurface;->mHeight:F

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v10

    float-to-double v2, v10

    .line 1132
    .local v2, "max":D
    div-double v10, v2, v4

    const-wide v12, 0x3ff3333333333333L    # 1.2

    cmpg-double v10, v10, v12

    if-gez v10, :cond_1

    .line 1133
    const-string v10, "SDL"

    const-string v11, "Don\'t skip on such aspect-ratio. Could be a square resolution."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1134
    const/4 v9, 0x0

    .line 1138
    .end local v2    # "max":D
    .end local v4    # "min":D
    :cond_1
    if-eqz v9, :cond_5

    .line 1139
    const-string v10, "SDL"

    const-string v11, "Skip .. Surface is not ready."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1179
    :cond_2
    :goto_2
    return-void

    .line 1061
    .end local v6    # "requestedOrientation":I
    .end local v9    # "skip":Z
    :pswitch_1
    const-string v10, "SDL"

    const-string v11, "pixel format A_8"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1064
    :pswitch_2
    const-string v10, "SDL"

    const-string v11, "pixel format LA_88"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1067
    :pswitch_3
    const-string v10, "SDL"

    const-string v11, "pixel format L_8"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1070
    :pswitch_4
    const-string v10, "SDL"

    const-string v11, "pixel format RGBA_4444"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1071
    const v7, 0x15421002

    .line 1072
    goto/16 :goto_0

    .line 1074
    :pswitch_5
    const-string v10, "SDL"

    const-string v11, "pixel format RGBA_5551"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1075
    const v7, 0x15441002

    .line 1076
    goto/16 :goto_0

    .line 1078
    :pswitch_6
    const-string v10, "SDL"

    const-string v11, "pixel format RGBA_8888"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1079
    const v7, 0x16462004

    .line 1080
    goto/16 :goto_0

    .line 1082
    :pswitch_7
    const-string v10, "SDL"

    const-string v11, "pixel format RGBX_8888"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    const v7, 0x16261804

    .line 1084
    goto/16 :goto_0

    .line 1086
    :pswitch_8
    const-string v10, "SDL"

    const-string v11, "pixel format RGB_332"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1087
    const v7, 0x14110801

    .line 1088
    goto/16 :goto_0

    .line 1090
    :pswitch_9
    const-string v10, "SDL"

    const-string v11, "pixel format RGB_565"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1091
    const v7, 0x15151002

    .line 1092
    goto/16 :goto_0

    .line 1094
    :pswitch_a
    const-string v10, "SDL"

    const-string v11, "pixel format RGB_888"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1096
    const v7, 0x16161804

    .line 1097
    goto/16 :goto_0

    .line 1116
    .restart local v6    # "requestedOrientation":I
    .restart local v9    # "skip":Z
    :cond_3
    const/4 v10, 0x1

    if-ne v6, v10, :cond_4

    .line 1118
    sget v10, Lorg/libsdl/app/SDLSurface;->mWidth:F

    sget v11, Lorg/libsdl/app/SDLSurface;->mHeight:F

    cmpl-float v10, v10, v11

    if-lez v10, :cond_0

    .line 1119
    const/4 v9, 0x1

    goto/16 :goto_1

    .line 1121
    :cond_4
    if-nez v6, :cond_0

    .line 1122
    sget v10, Lorg/libsdl/app/SDLSurface;->mWidth:F

    sget v11, Lorg/libsdl/app/SDLSurface;->mHeight:F

    cmpg-float v10, v10, v11

    if-gez v10, :cond_0

    .line 1123
    const/4 v9, 0x1

    goto/16 :goto_1

    .line 1145
    :cond_5
    const/4 v10, 0x1

    sput-boolean v10, Lorg/libsdl/app/SDLActivity;->mIsSurfaceReady:Z

    .line 1146
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSurfaceChanged()V

    .line 1149
    sget-object v10, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    if-nez v10, :cond_6

    .line 1153
    new-instance v8, Ljava/lang/Thread;

    new-instance v10, Lorg/libsdl/app/SDLMain;

    invoke-direct {v10}, Lorg/libsdl/app/SDLMain;-><init>()V

    const-string v11, "SDLThread"

    invoke-direct {v8, v10, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 1154
    .local v8, "sdlThread":Ljava/lang/Thread;
    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/libsdl/app/SDLSurface;->enableSensor(IZ)V

    .line 1155
    invoke-virtual {v8}, Ljava/lang/Thread;->start()V

    .line 1158
    new-instance v10, Ljava/lang/Thread;

    new-instance v11, Lorg/libsdl/app/SDLSurface$1;

    invoke-direct {v11, p0, v8}, Lorg/libsdl/app/SDLSurface$1;-><init>(Lorg/libsdl/app/SDLSurface;Ljava/lang/Thread;)V

    const-string v12, "SDLThreadListener"

    invoke-direct {v10, v11, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v10, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    .line 1173
    sget-object v10, Lorg/libsdl/app/SDLActivity;->mSDLThread:Ljava/lang/Thread;

    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    .line 1176
    .end local v8    # "sdlThread":Ljava/lang/Thread;
    :cond_6
    sget-boolean v10, Lorg/libsdl/app/SDLActivity;->mHasFocus:Z

    if-eqz v10, :cond_2

    .line 1177
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handleResume()V

    goto/16 :goto_2

    .line 1059
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_7
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_8
    .end packed-switch
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 1038
    const-string v0, "SDL"

    const-string v1, "surfaceCreated()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 1040
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 1045
    const-string v0, "SDL"

    const-string v1, "surfaceDestroyed()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1047
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->handlePause()V

    .line 1048
    const/4 v0, 0x0

    sput-boolean v0, Lorg/libsdl/app/SDLActivity;->mIsSurfaceReady:Z

    .line 1049
    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeSurfaceDestroyed()V

    .line 1050
    return-void
.end method
