.class public Lorg/love2d/android/GameActivity;
.super Lorg/libsdl/app/SDLActivity;
.source "GameActivity.java"


# static fields
.field private static context:Landroid/content/Context;

.field private static gamePath:Ljava/lang/String;

.field private static immersiveActive:Z

.field private static metrics:Landroid/util/DisplayMetrics;

.field private static vibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    sput-object v0, Lorg/love2d/android/GameActivity;->metrics:Landroid/util/DisplayMetrics;

    .line 37
    const-string v0, ""

    sput-object v0, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    .line 40
    const/4 v0, 0x0

    sput-boolean v0, Lorg/love2d/android/GameActivity;->immersiveActive:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/libsdl/app/SDLActivity;-><init>()V

    return-void
.end method

.method public static getGamePath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 168
    const-string v0, "GameActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "called getGamePath(), game path = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    sget-object v0, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    return-object v0
.end method

.method public static getMetrics()Landroid/util/DisplayMetrics;
    .locals 1

    .prologue
    .line 173
    sget-object v0, Lorg/love2d/android/GameActivity;->metrics:Landroid/util/DisplayMetrics;

    return-object v0
.end method

.method public static openURL(Ljava/lang/String;)V
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 181
    const-string v1, "GameActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "opening url = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 183
    .local v0, "i":Landroid/content/Intent;
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 184
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 185
    sget-object v1, Lorg/love2d/android/GameActivity;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 186
    return-void
.end method

.method public static vibrate(D)V
    .locals 4
    .param p0, "seconds"    # D

    .prologue
    .line 177
    sget-object v0, Lorg/love2d/android/GameActivity;->vibrator:Landroid/os/Vibrator;

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, p0

    double-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 178
    return-void
.end method


# virtual methods
.method copyGameToCache(Landroid/net/Uri;)V
    .locals 12
    .param p1, "sourceuri"    # Landroid/net/Uri;

    .prologue
    .line 190
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->getCacheDir()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/downloaded.love"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 191
    .local v7, "destinationFilename":Ljava/lang/String;
    sput-object v7, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    .line 193
    const/4 v2, 0x0

    .line 195
    .local v2, "bos":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v9, Ljava/io/FileOutputStream;

    const/4 v10, 0x0

    invoke-direct {v9, v7, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v3, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "bos":Ljava/io/BufferedOutputStream;
    .local v3, "bos":Ljava/io/BufferedOutputStream;
    move-object v2, v3

    .line 200
    .end local v3    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v2    # "bos":Ljava/io/BufferedOutputStream;
    :goto_0
    const/4 v6, 0x0

    .line 201
    .local v6, "chunk_read":I
    const/4 v5, 0x0

    .line 203
    .local v5, "bytes_written":I
    const/4 v0, 0x0

    .line 204
    .local v0, "bis":Ljava/io/BufferedInputStream;
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v9

    const-string v10, "content"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 206
    :try_start_1
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    invoke-virtual {v9, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .local v1, "bis":Ljava/io/BufferedInputStream;
    move-object v0, v1

    .line 214
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    :goto_1
    if-eqz v0, :cond_1

    .line 217
    const/16 v9, 0x400

    :try_start_2
    new-array v4, v9, [B

    .line 218
    .local v4, "buf":[B
    invoke-virtual {v0, v4}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v6

    .line 220
    :cond_0
    const/4 v9, 0x0

    invoke-virtual {v2, v4, v9, v6}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 221
    add-int/2addr v5, v6

    .line 222
    invoke-virtual {v0, v4}, Ljava/io/BufferedInputStream;->read([B)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-result v6

    .line 223
    const/4 v9, -0x1

    if-ne v6, v9, :cond_0

    .line 231
    .end local v4    # "buf":[B
    :cond_1
    :goto_2
    if-eqz v0, :cond_2

    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 232
    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 237
    :cond_3
    :goto_3
    const-string v9, "GameActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Copied "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " bytes"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    return-void

    .line 196
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v5    # "bytes_written":I
    .end local v6    # "chunk_read":I
    :catch_0
    move-exception v8

    .line 197
    .local v8, "e":Ljava/io/IOException;
    const-string v9, "GameActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Could not open destination file:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 207
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bytes_written":I
    .restart local v6    # "chunk_read":I
    :catch_1
    move-exception v8

    .line 208
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v9, "GameActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Could not open game file:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 211
    .end local v8    # "e":Ljava/io/IOException;
    :cond_4
    const-string v9, "GameActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unsupported scheme: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 224
    :catch_2
    move-exception v8

    .line 225
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v9, "GameActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Copying failed:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 233
    .end local v8    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v8

    .line 234
    .restart local v8    # "e":Ljava/io/IOException;
    const-string v9, "GameActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Copying failed: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3
.end method

.method public getImmersiveMode()Z
    .locals 1

    .prologue
    .line 164
    sget-boolean v0, Lorg/love2d/android/GameActivity;->immersiveActive:Z

    return v0
.end method

.method protected getLibraries()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 44
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "gnustl_shared"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "mpg123"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "openal"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "love"

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected handleIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 74
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 75
    .local v0, "game":Landroid/net/Uri;
    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "file"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 77
    const-string v2, "GameActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received intent with path: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-virtual {v0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    .line 82
    .local v1, "path_segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "main.lua"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 83
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, "main.lua"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    .line 91
    .end local v1    # "path_segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    const-string v2, "GameActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "new gamePath: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_0
    return-void

    .line 85
    .restart local v1    # "path_segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/love2d/android/GameActivity;->gamePath:Ljava/lang/String;

    goto :goto_0

    .line 88
    .end local v1    # "path_segments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    invoke-virtual {p0, v0}, Lorg/love2d/android/GameActivity;->copyGameToCache(Landroid/net/Uri;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 54
    const-string v0, "GameActivity"

    const-string v1, "started"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lorg/love2d/android/GameActivity;->context:Landroid/content/Context;

    .line 57
    sget-object v0, Lorg/love2d/android/GameActivity;->context:Landroid/content/Context;

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    sput-object v0, Lorg/love2d/android/GameActivity;->vibrator:Landroid/os/Vibrator;

    .line 59
    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/love2d/android/GameActivity;->handleIntent(Landroid/content/Intent;)V

    .line 61
    invoke-super {p0, p1}, Lorg/libsdl/app/SDLActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    sget-object v1, Lorg/love2d/android/GameActivity;->metrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 63
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 97
    const-string v0, "GameActivity"

    const-string v1, "Cancelling vibration"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    sget-object v0, Lorg/love2d/android/GameActivity;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 99
    invoke-super {p0}, Lorg/libsdl/app/SDLActivity;->onDestroy()V

    .line 100
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 67
    const-string v0, "GameActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNewIntent() with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-virtual {p0, p1}, Lorg/love2d/android/GameActivity;->handleIntent(Landroid/content/Intent;)V

    .line 69
    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->resetNative()V

    .line 70
    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->startNative()V

    .line 71
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 104
    const-string v0, "GameActivity"

    const-string v1, "Cancelling vibration"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    sget-object v0, Lorg/love2d/android/GameActivity;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 106
    invoke-super {p0}, Lorg/libsdl/app/SDLActivity;->onPause()V

    .line 107
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 111
    invoke-super {p0}, Lorg/libsdl/app/SDLActivity;->onResume()V

    .line 113
    sget-boolean v0, Lorg/love2d/android/GameActivity;->immersiveActive:Z

    if-eqz v0, :cond_0

    .line 114
    invoke-virtual {p0}, Lorg/love2d/android/GameActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 122
    :cond_0
    return-void
.end method

.method public setImmersiveMode(Z)V
    .locals 4
    .param p1, "immersive_mode"    # Z

    .prologue
    .line 125
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_0

    .line 161
    :goto_0
    return-void

    .line 132
    :cond_0
    sput-boolean p1, Lorg/love2d/android/GameActivity;->immersiveActive:Z

    .line 134
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 135
    .local v1, "lock":Ljava/lang/Object;
    move v0, p1

    .line 136
    .local v0, "immersive_enabled":Z
    monitor-enter v1

    .line 137
    :try_start_0
    new-instance v2, Lorg/love2d/android/GameActivity$1;

    invoke-direct {v2, p0, v1, v0}, Lorg/love2d/android/GameActivity$1;-><init>(Lorg/love2d/android/GameActivity;Ljava/lang/Object;Z)V

    invoke-virtual {p0, v2}, Lorg/love2d/android/GameActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 160
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
