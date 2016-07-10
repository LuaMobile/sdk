Place your binary modules into the corresponding architecture folder.

## How this dark magic works?

Android's security arquitecture and phyfs prevent apps from running directly
from the writable storage, instead they are sandboxed and loaded somewhere into
a safe in-memory storage. In order to workaround this, all the contents of this
folder get copied on the very first run of the app. This approach has the
drawback of duplicated used space. Hopefully they are deleted by Android when
the app is uninstalled.

## Compatibility

On Android, this SDK supports ```armeabi``` and ```armeeabi-v7```, yet you
should build a different apk file for each of them, containing the corresponding
binaries compiled specifically for each architecture. This could be improved
with a good detection algo on runtime. Pull requests are welcome!

## Compiling binary modules for your app

This requires a bit hard work:

1. Download and compile the [Android Port of LÖVE](https://bitbucket.org/MartinFelis/love-android-sdl2)
2. Find the file ```libluajit.a``` and pass its containing folder to your linker
3. Link it statically, because shared is not working yet (at least for me)
4. You might require to pass LuaJIT headers from love-android-sdl2 as well
5. If you have success please file an issue so we can congratulate you!
