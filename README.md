# LuaMobile SDK

This project is aimed to easy the development of mobile applications that are
easy to extend, native and cross-platform thanks to the flexibility and power of
[Lua](http://lua.org), LuaJIT and [LÖVE](https://love2d.org/).

Please report your issues and feedback to: https://github.com/LuaMobile/sdk/issues

## Dependencies

- Android
  - [Apktool](http://ibotpeaches.github.io/Apktool/)
  - Java JRE & JDK 7
- iOS (nothing yet)

## Building apps with LuaMobile

### Configure your project settings

In order to start building your app, please create a file called ```config.mk```.
Please see the template file ```example_config.mk``` for reference.

### Android packager

```AndroidManifest.xml``` along with other customizable settings and goodies are
available into the folder ```Android/decoded```, see [Game Packaging](https://bitbucket.org/MartinFelis/love-android-sdl2/wiki/Game_Packaging).


Just run the following commands:

```
$ cd Android
$ make
```

### iOS packager

Not implemented yet. Do you want it sooner? We accept pull requests!

### Running local

The root folder has a general ```Makefile``` so you can generate the
```game.love``` file, then just run it.

```
$ make
$ love game.love
```

## Credits

The Android packager is possible thanks to the [Android Port of LÖVE](https://bitbucket.org/MartinFelis/love-android-sdl2)
by Martin Felis.
