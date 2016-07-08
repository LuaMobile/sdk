.class Lorg/libsdl/app/SDLJoystickHandler_API12;
.super Lorg/libsdl/app/SDLJoystickHandler;
.source "SDLActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/libsdl/app/SDLJoystickHandler_API12$RangeComparator;,
        Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    }
.end annotation


# instance fields
.field private mJoysticks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1519
    invoke-direct {p0}, Lorg/libsdl/app/SDLJoystickHandler;-><init>()V

    .line 1521
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    .line 1522
    return-void
.end method


# virtual methods
.method protected getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    .locals 2
    .param p1, "device_id"    # I

    .prologue
    .line 1596
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1597
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    iget v1, v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    if-ne v1, p1, :cond_0

    .line 1598
    iget-object v1, p0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    .line 1601
    :goto_1
    return-object v1

    .line 1596
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1601
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public handleMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1606
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v8

    const v9, 0x1000010

    and-int/2addr v8, v9

    if-eqz v8, :cond_0

    .line 1607
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    .line 1608
    .local v1, "actionPointerIndex":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 1609
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 1630
    .end local v0    # "action":I
    .end local v1    # "actionPointerIndex":I
    :cond_0
    const/4 v8, 0x1

    return v8

    .line 1611
    .restart local v0    # "action":I
    .restart local v1    # "actionPointerIndex":I
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v8

    invoke-virtual {p0, v8}, Lorg/libsdl/app/SDLJoystickHandler_API12;->getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    move-result-object v5

    .line 1612
    .local v5, "joystick":Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    if-eqz v5, :cond_0

    .line 1613
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_1

    .line 1614
    iget-object v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/InputDevice$MotionRange;

    .line 1616
    .local v6, "range":Landroid/view/InputDevice$MotionRange;
    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v8

    invoke-virtual {p1, v8, v1}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v8

    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getMin()F

    move-result v9

    sub-float/2addr v8, v9

    invoke-virtual {v6}, Landroid/view/InputDevice$MotionRange;->getRange()F

    move-result v9

    div-float/2addr v8, v9

    const/high16 v9, 0x40000000    # 2.0f

    mul-float/2addr v8, v9

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float v7, v8, v9

    .line 1617
    .local v7, "value":F
    iget v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    invoke-static {v8, v4, v7}, Lorg/libsdl/app/SDLActivity;->onNativeJoy(IIF)V

    .line 1613
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1619
    .end local v6    # "range":Landroid/view/InputDevice$MotionRange;
    .end local v7    # "value":F
    :cond_1
    const/4 v4, 0x0

    :goto_1
    iget-object v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_0

    .line 1620
    iget-object v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/InputDevice$MotionRange;

    invoke-virtual {v8}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v8

    invoke-virtual {p1, v8, v1}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 1621
    .local v2, "hatX":I
    iget-object v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->hats:Ljava/util/ArrayList;

    add-int/lit8 v9, v4, 0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/InputDevice$MotionRange;

    invoke-virtual {v8}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v8

    invoke-virtual {p1, v8, v1}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 1622
    .local v3, "hatY":I
    iget v8, v5, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    div-int/lit8 v9, v4, 0x2

    invoke-static {v8, v9, v2, v3}, Lorg/libsdl/app/SDLActivity;->onNativeHat(IIII)V

    .line 1619
    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    .line 1609
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public pollInputDevices()V
    .locals 18

    .prologue
    .line 1526
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v8

    .line 1532
    .local v8, "deviceIds":[I
    array-length v1, v8

    add-int/lit8 v10, v1, -0x1

    .local v10, "i":I
    :goto_0
    const/4 v1, -0x1

    if-le v10, v1, :cond_6

    .line 1533
    aget v1, v8, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/libsdl/app/SDLJoystickHandler_API12;->getJoystick(I)Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    move-result-object v13

    .line 1534
    .local v13, "joystick":Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    if-nez v13, :cond_5

    .line 1535
    new-instance v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    .end local v13    # "joystick":Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    invoke-direct {v13}, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;-><init>()V

    .line 1536
    .restart local v13    # "joystick":Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    aget v1, v8, v10

    invoke-static {v1}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v14

    .line 1538
    .local v14, "joystickDevice":Landroid/view/InputDevice;
    invoke-virtual {v14}, Landroid/view/InputDevice;->getSources()I

    move-result v1

    and-int/lit8 v1, v1, 0x10

    if-nez v1, :cond_0

    invoke-virtual {v14}, Landroid/view/InputDevice;->getSources()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_5

    .line 1544
    :cond_0
    aget v1, v8, v10

    iput v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    .line 1545
    invoke-virtual {v14}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->name:Ljava/lang/String;

    .line 1546
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->axes:Ljava/util/ArrayList;

    .line 1547
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->hats:Ljava/util/ArrayList;

    .line 1549
    invoke-virtual {v14}, Landroid/view/InputDevice;->getMotionRanges()Ljava/util/List;

    move-result-object v16

    .line 1550
    .local v16, "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/view/InputDevice$MotionRange;>;"
    new-instance v1, Lorg/libsdl/app/SDLJoystickHandler_API12$RangeComparator;

    invoke-direct {v1}, Lorg/libsdl/app/SDLJoystickHandler_API12$RangeComparator;-><init>()V

    move-object/from16 v0, v16

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1551
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/view/InputDevice$MotionRange;

    .line 1552
    .local v15, "range":Landroid/view/InputDevice$MotionRange;
    invoke-virtual {v15}, Landroid/view/InputDevice$MotionRange;->getSource()I

    move-result v1

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_1

    .line 1553
    invoke-virtual {v15}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v1

    const/16 v2, 0xf

    if-eq v1, v2, :cond_2

    invoke-virtual {v15}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_3

    .line 1555
    :cond_2
    iget-object v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v1, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1558
    :cond_3
    iget-object v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v1, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1563
    .end local v15    # "range":Landroid/view/InputDevice$MotionRange;
    :cond_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1564
    iget v1, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    iget-object v2, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->name:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, -0x1

    iget-object v5, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->axes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget-object v6, v13, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->hats:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    const/4 v7, 0x0

    invoke-static/range {v1 .. v7}, Lorg/libsdl/app/SDLActivity;->nativeAddJoystick(ILjava/lang/String;IIIII)I

    .line 1532
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v14    # "joystickDevice":Landroid/view/InputDevice;
    .end local v16    # "ranges":Ljava/util/List;, "Ljava/util/List<Landroid/view/InputDevice$MotionRange;>;"
    :cond_5
    add-int/lit8 v10, v10, -0x1

    goto/16 :goto_0

    .line 1571
    .end local v13    # "joystick":Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;
    :cond_6
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 1572
    .local v17, "removedDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v10, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v10, v1, :cond_a

    .line 1573
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    iget v9, v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    .line 1575
    .local v9, "device_id":I
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_3
    array-length v1, v8

    if-ge v12, v1, :cond_7

    .line 1576
    aget v1, v8, v12

    if-ne v9, v1, :cond_9

    .line 1578
    :cond_7
    array-length v1, v8

    if-ne v12, v1, :cond_8

    .line 1579
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1572
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 1575
    :cond_9
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 1583
    .end local v9    # "device_id":I
    .end local v12    # "j":I
    :cond_a
    const/4 v10, 0x0

    :goto_4
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v10, v1, :cond_d

    .line 1584
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 1585
    .restart local v9    # "device_id":I
    invoke-static {v9}, Lorg/libsdl/app/SDLActivity;->nativeRemoveJoystick(I)I

    .line 1586
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v12, v1, :cond_b

    .line 1587
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;

    iget v1, v1, Lorg/libsdl/app/SDLJoystickHandler_API12$SDLJoystick;->device_id:I

    if-ne v1, v9, :cond_c

    .line 1588
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/libsdl/app/SDLJoystickHandler_API12;->mJoysticks:Ljava/util/ArrayList;

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1583
    :cond_b
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 1586
    :cond_c
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 1593
    .end local v9    # "device_id":I
    .end local v12    # "j":I
    :cond_d
    return-void
.end method
