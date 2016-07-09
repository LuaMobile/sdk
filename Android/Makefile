include ../config.mk
APK_FILE=$(APP_NAME)_$(APK_VERSION).apk
TEMP_DIR := $(shell mktemp -u)

all: build

sign: cert
	jarsigner -sigalg MD5withRSA -digestalg SHA1 -storepass love2d -verbose -keystore app.keystore $(APK_FILE) CERT

build: game.love
	apktool b decoded -o $(APK_FILE)
	$(MAKE) sign
	@echo
	@echo Success!

game.love:
	mkdir -p decoded/assets
	cd ../; test -f game.love || $(MAKE) game.love
	cp ../game.love decoded/assets/game.love;

decode:
	@echo ""
	@echo Löve APK files extracted to folder: decoded/
	@echo When you finish your changes run this:
	@echo
	@echo "    $$ make build"
	@echo
	@echo That will build and sign the following file:
	@echo
	@echo "    $$PWD/$(APK_FILE)"
	@echo
	test -d decoded || apktool d *.apk -o decoded

cert:
	test -f app.keystore || keytool -genkey -v -keystore app.keystore \
	-alias CERT -sigalg MD5withRSA -keyalg RSA -keysize 2048 -validity 1825 \
	-dname "CN=$(APP_NAME),OU=None,O=None,L=None,C=None" -keypass love2d -storepass love2d

clean:
	rm -rf $(APK_FILE) decoded/assets/game.love app.keystore
