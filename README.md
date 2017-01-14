# librtbbio

Insctructions for building kernel, xenomai and drivers in folder _bb_xenomai_folder_

Define folder:

export BB_XENOMAI_FOLDER=_bb_xenomai_folder_

## Build kernel

cd $BB_XENOMAI_FOLDER
git clone https://github.com/oyvindnetland/bb-kernel.git
cd bb-kernel
git checkout am33x-v4.1-xenomai
./build_deb or ./build_kernel

Select GPIO and PWM drivers in menuconfig (under xenomai and drivers)

## Install the Xenomai 3 user space libraries

export PATH=$PATH:$BB_XENOMAI_FOLDER/bb-kernel/dl/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin
export BB_KERNEL=$BB_XENOMAI_FOLDER/bb-kernel/ 
export XENO_INSTALL=$BB_XENOMAI_FOLDER/xenomai-install
cd $BB_XENOMAI_FOLDER
wget https://xenomai.org/downloads/xenomai/stable/latest/xenomai-3.0.3.tar.bz2
tar xf xenomai-3.0.3.tar.bz2
cd xenomai-3.0.3
./configure CFLAGS="-march=armv7-a -mfpu=vfp3" LDFLAGS="-march=armv7-a -mfpu=vfp3" --build=i686-pc-linux-gnu --host=arm-linux-gnueabihf --with-core=cobalt
make DESTDIR=$XENO_INSTALL install

Install files in xenomai-install on Beaglebone

## Make librtbbio

Library for easy use of the GPIO and PWM (and possibly more later) RTDM drivers for Beaglebone Xenomai 3.

cd $BB_XENOMAI_FOLDER
git clone https://github.com/oyvindnetland/librtbbio.git
cd librtbbio
make lib

## Make test program

Library is fully working, but not test program. Only GPIO input (connect two GPIO, and the input read the value of the output) is currently implemented.

cd $BB_XENOMAI_FOLDER
cd librtbbio
make test


