#!/bin/sh
#
# a small script to (natively) build an ARM toolchain for Cortex M3
# on FreeBSD 9.0
#

mkdir -p ~/arm-toolchain/native-gcc/src
wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.6/gcc-4.3.6.tar.bz2
mkdir -p ~/arm-toolchain/native-gcc/obj/gcc && mkdir ~/arm-toolchain/native-gcc/target
tar ­xjf gcc-4.3.6.tar.bz2
../../src/gcc-4.3.6/configure \
--enable-languages=c,c++ \
--enable-shared \
--enable-threads=posix \
--disable-decimal-float \
--disable-libffi \
--disable-libgomp \
--disable-libmudflap \
--disable-libssp \
--disable-libstdcxx-pch \
--disable-multilib \
--disable-nls \
--with-gnu-as \
--with-gnu-ld \
--enable-libstdcxx-debug \
--enable-targets=all \
--enable-checking=release \
--prefix=$HOME/arm-toolchain/native-gcc/target \
--prefix=/usr/local --program-prefix=arm-43- \
--with-host-libstdcxx="-static-libgcc -L /usr/local/lib/gcc46/gcc/i386-portbld-freebsd9.0/4.6.4 -lstdc++ -lsupc++ -lm"

gmake
gmake install
