#!/bin/sh
#wget ftp://ftp.gnu.org/gnu/make/make-4.2.tar.gz
#tar xvzf make-4.2.tar.gz
#cd make-4.2
DEV_PREFIX=/opt
export ANDROID_NDK=${DEV_PREFIX}/ndk
export CROSS_COMPILE=arm-linux-androideabi
export ANDROID_PREFIX=/tmp/chain
export SYSROOT=${ANDROID_NDK}/platforms/android-17/arch-arm
export CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export STRIP=${CROSS_PATH}-strip
export RANLIB=${CROSS_PATH}-ranlib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CFLAGS="\
-DNO_GETTEXT \
-DNO_ICONV \
-DNO_PERL \
-DNO_GECOS_IN_PWENT \
-I${ANDROID_PREFIX}/include \
-I/data/local/tmp/lib/include \
-I${SYSROOT}/usr/include \
-I${DEV_PREFIX}/bionic/libc/include \
-UHAVE_CLOCK_GETTIME \
-UHAVE_GETPWENT \
-UHAVE_GETPWNAM \
-UHAVE_GETPWUID  \
-UHAVE_GETTEXT \
-UHAVE_ICONV \
-UHAVE_ICONV_H \
-UHAVE_LANGINFO_H \
-UHAVE_LIBINTL_H \
-UHAVE_LOCALE_H \
-UHAVE_NL_LANGINFO_CODESET \
"
export CPPFLAGS="${CFLAGS}"
export LDFLAGS="\
-Wl,--no-as-needed \
-ldl \
-L/data/local/tmp/lib \
-L${SYSROOT}/usr/lib \
-L${ANDROID_PREFIX}/lib \
" 
TERMINFO=/data/local/tmp/lib/terminfo
#--exec-prefix=/data/local/tmp \
#--prefix=/data/local/tmp \
export DESTDIR=
export NO_PERL=1
export NO_TCLTK=1
make distclean
autoreconf
ac_cv_fread_reads_directories=no \
ac_cv_header_libintl_h=no \
ac_cv_snprintf_returns_bogus=no \
NO_GECOS_IN_PWENT=1 \
NO_GETTEXT=1 \
NO_ICONV=1 \
NO_PERL_MAKEMAKER=1 \
NO_PERL=1 \
NO_PYTHON=1 \
NO_TCLTK=1 \
DESTDIR= \
./configure \
--bindir=/data/local/tmp/xbin \
--datadir=/data/local/tmp/lib/share \
--datarootdir=/data/local/tmp/lib/share \
--host=${CROSS_COMPILE} \
--includedir=/data/local/tmp/lib/include \
--libdir=/data/local/tmp/lib \
--libexecdir=/data/local/tmp/xbin \
--localstatedir=/data/local/tmp/etc \
--oldincludedir=/data/local/tmp/lib/include \
--localedir=/data/local/tmp/lib/share/locale \
--prefix= \
--sbindir=/data/local/tmp/xbin \
--sharedstatedir=/data/local/tmp/etc \
--sysconfdir=/data/local/tmp/etc \
--mandir=/data/local/tmp/lib/share/man \
 "$@" 
CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" make && make install
#   --bindir=DIR            user executables [EPREFIX/bin]
#   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#   --libexecdir=DIR        program executables [EPREFIX/libexec]
#   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#   --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
#   --libdir=DIR            object code libraries [EPREFIX/lib]
#   --includedir=DIR        C header files [PREFIX/include]
#   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#   --infodir=DIR           info documentation [DATAROOTDIR/info]
#   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#   --mandir=DIR            man documentation [DATAROOTDIR/man]
#   --docdir=DIR            documentation root [DATAROOTDIR/doc/make]
#   --htmldir=DIR           html documentation [DOCDIR]
#   --dvidir=DIR            dvi documentation [DOCDIR]
#   --pdfdir=DIR            pdf documentation [DOCDIR]
#   --psdir=DIR             ps documentation [DOCDIR]
#   --program-prefix=PREFIX            prepend PREFIX to installed program names
#   --program-suffix=SUFFIX            append SUFFIX to installed program names
#   --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
#   --build=BUILD     configure for building on BUILD [guessed]
#   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#   --disable-option-checking  ignore unrecognized --enable/--with options
#   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#   --enable-silent-rules   less verbose build output (undo: "make V=1")
#   --disable-silent-rules  verbose build output (undo: "make V=0")
#   --enable-dependency-tracking
#   --disable-dependency-tracking
#   --disable-nls           do not use Native Language Support
#   --disable-rpath         do not hardcode runtime library paths
#   --disable-largefile     omit support for large files
#   --enable-case-insensitive-file-system
#   --disable-job-server    disallow recursive make communication during -jN
#   --disable-load          disable support for the 'load' operation
#   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
#   --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
#   --without-libiconv-prefix     don't search for libiconv in includedir and libdir
#   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
#   --without-libintl-prefix     don't search for libintl in includedir and libdir
#   --with-guile            Support GNU Guile for embedded scripting
#   --with-customs=DIR      enable remote jobs via Customs--see README.customs
#   --with-dmalloc          use dmalloc, as in http://www.dmalloc.com
#   # If there are subdirs, report their specific --help.
#       $SHELL "$ac_srcdir/configure.gnu" --help=recursive
#       $SHELL "$ac_srcdir/configure" --help=recursive
