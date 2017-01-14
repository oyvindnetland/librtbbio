CC = $(BB_KERNEL)/dl/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc

LIBCFLAGS = -Wall -I../rtgpio -I$(XENO_INSTALL)/usr/xenomai/include/cobalt 
LIBCFLAGS += -I$(XENO_INSTALL)/usr/xenomai/include -I$(BB_KERNEL)/KERNEL/drivers/xenomai/beaglebone -fPIC  

CFLAGS = -Wall -I../rtio -Ilib -I$(XENO_INSTALL)/usr/xenomai/include/cobalt
CFLAGS += -I$(XENO_INSTALL)/usr/xenomai/include/alchemy -I$(XENO_INSTALL)/usr/xenomai/include 
CFLAGS += -march=armv7-a -mfpu=vfp3 -D_GNU_SOURCE -D_REENTRANT -D__COBALT__ -D__COBALT_WRAP_  

LFLAGS = -lalchemy -lcopperplate $(XENO_INSTALL)/usr/xenomai/lib/xenomai/bootstrap.o 
LFLAGS += -Wl,--wrap=main -Wl,--dynamic-list=$(XENO_INSTALL)/usr/xenomai/lib/dynlist.ld 
LFLAGS += -L$(XENO_INSTALL)/usr/xenomai/lib -lcobalt -lpthread -lrt 
LFLAGS += -lbbio  -march=armv7-a -mfpu=vfp3 -Llib  

lib: lib/libbbio.o
	$(CC) -o lib/libbbio.so lib/libbbio.o -shared

lib/libbbio.o:
	$(CC) -c -o lib/libbbio.o lib/libbbio.c $(LIBCFLAGS)

test: test/bbio_test.o
	$(CC) -o test/bbio_test test/bbio_test.o $(LFLAGS)
	
test/bbiotest.o: lib
	$(CC) -c -o test/bbio_test.o test/bbio_test.c $(CFLAGS)

.PHONY: clean

clean:
	rm -rf lib/*.o lib/*.so test/*.o test/test_bbio
