# Makefile for micro_proxy

# CONFIGURE: If you are using a SystemV-based operating system, such as
# Solaris, you will need to uncomment this definition.
#SYSV_LIBS =	-lnsl -lsocket


BINDIR =	/usr/local/sbin
MANDIR =	/usr/local/man/man8
CC =		/home/pete/Desktop/code/dd/bin/mipsel-linux-gcc
#CFLAGS =	-O -Wall
CFLAGS =	-I/home/pete/Desktop/ssl/include
#LDFLAGS =	-s $(SYSV_LIBS)
LDFLAGS =	-L/home/pete/Desktop/ssl/lib -lssl -lcrypto  $(SYSV_LIBS)

all:		ssl

ssl:	ssl.o
	$(CC) $(CFLAGS) ssl.o $(LDFLAGS) -o ssl

ssl.o:	ssl.c
	$(CC) $(CFLAGS) -c ssl.c

install:	all
	rm -f $(BINDIR)/ssl
	cp micro_proxy $(BINDIR)
	rm -f $(MANDIR)/ssl.8
	cp ssl.8 $(MANDIR)

clean:
	rm -f ssl *.o core core.* *.core
