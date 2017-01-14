# librtbbio

Install the Xenomai 3 user space libraries

export PATH=$PATH:<xenomai kernel folder>/bb-kernel/dl/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin

wget https://xenomai.org/downloads/xenomai/stable/latest/xenomai-3.0.3.tar.bz2
tar xf xenomai-3.0.3.tar.bz2
cd xenomai-3.0.3
./configure CFLAGS="-march=armv7-a -mfpu=vfp3" LDFLAGS="-march=armv7-a -mfpu=vfp3" --build=i686-pc-linux-gnu --host=arm-linux-gnueabihf --with-core=cobalt
make DESTDIR=<xenomai kernel folder>/xenomai-install install

Install files in xenomai-install on Beaglebone

Library for easy use of the GPIO and PWM (and possibly more later) RTDM drivers for Beaglebone Xenomai 3.
Make librtbbio
git clone https://github.com/oyvindnetland/librtbbio.git
cd librtbbio
make BB-KERNEL=<xenomai kernel folder>/bb-kernel/ XENO_INSTALL=<xenomai kernel folder>/xenomai-3.0.3 lib

Library is fully working, but not test program. Only GPIO input (connect two GPIO, and the input read the value of the output) is currently implemented.
Make test program
cd librtbbio
make BB-KERNEL=<xenomai kernel folder>/bb-kernel/ XENO_INSTALL=<xenomai kernel folder>/xenomai-3.0.3 test


