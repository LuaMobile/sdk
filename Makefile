include config.mk

all: clean game.love

clean:
	rm -f game.love

game.love:
	cd src; zip -9 -q -r ../game.love . -x *\.git* *\.idea*

