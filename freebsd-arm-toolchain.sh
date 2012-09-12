#!/bin/sh
#
# a small script to (natively) build an ARM toolchain for Cortex M3 on FreeBSD
#
#    Copyright (C) 2012  tpltnt
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# create directories
mkdir -p ~/arm-toolchain/native-gcc/src
mkdir -p ~/arm-toolchain/native-gcc/obj/gcc
mkdir -p ~/arm-toolchain/native-gcc/target
# get gcc source, unpack it, configure & compile bootstrap-gcc
cd ~/arm-toolchain/native-gcc/src
wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.6/gcc-4.3.6.tar.bz2
tar ­xjf gcc-4.3.6.tar.bz2
cd ../obj/gcc
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
