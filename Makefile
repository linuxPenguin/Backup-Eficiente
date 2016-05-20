CFLAGS = -Wall -Wextra -O2
TARGET_ARCH = -march=native

all: sobucli sobusrv

.PHONY: all install clean

install: all
	bash install.sh

unninstall:
	bash unninstall.sh

debug: CFLAGS = -Wall -Wextra -g
debug: all

sobucli: sobucli.o readln.o comando.o comando.h
	$(LINK.c) $^ $(OUTPUT_OPTION)

sobusrv: sobusrv.o comando.o
	$(LINK.c) $^ $(OUTPUT_OPTION)

clean:
	$(RM) sobucli sobusrv
	$(RM) *.o
