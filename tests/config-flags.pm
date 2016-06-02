# This is a -*-perl-*- script
#
# Set variables that were defined by configure, in case we need them
# during the tests.

%CONFIG_FLAGS = (
    AM_LDFLAGS   => '-Wl,--export-dynamic',
    AR           => '/tmp/chain/bin/arm-linux-androideabi-ar',
    CC           => '/tmp/chain/bin/arm-linux-androideabi-gcc',
    CFLAGS       => '-DNO_GETTEXT -DNO_ICONV -DNO_PERL -DNO_GECOS_IN_PWENT -I/tmp/chain/include -I/data/local/tmp/lib/include -I/opt/ndk/platforms/android-17/arch-arm/usr/include -I/opt/bionic/libc/include -UHAVE_CLOCK_GETTIME -UHAVE_GETPWENT -UHAVE_GETPWNAM -UHAVE_GETPWUID  -UHAVE_GETTEXT -UHAVE_ICONV -UHAVE_ICONV_H -UHAVE_LANGINFO_H -UHAVE_LIBINTL_H -UHAVE_LOCALE_H -UHAVE_NL_LANGINFO_CODESET ',
    CPP          => '/tmp/chain/bin/arm-linux-androideabi-cpp',
    CPPFLAGS     => '-DNO_GETTEXT -DNO_ICONV -DNO_PERL -DNO_GECOS_IN_PWENT -I/tmp/chain/include -I/data/local/tmp/lib/include -I/opt/ndk/platforms/android-17/arch-arm/usr/include -I/opt/bionic/libc/include -UHAVE_CLOCK_GETTIME -UHAVE_GETPWENT -UHAVE_GETPWNAM -UHAVE_GETPWUID  -UHAVE_GETTEXT -UHAVE_ICONV -UHAVE_ICONV_H -UHAVE_LANGINFO_H -UHAVE_LIBINTL_H -UHAVE_LOCALE_H -UHAVE_NL_LANGINFO_CODESET ',
    GUILE_CFLAGS => '',
    GUILE_LIBS   => '',
    LDFLAGS      => '-Wl,--no-as-needed -ldl -L/data/local/tmp/lib -L/opt/ndk/platforms/android-17/arch-arm/usr/lib -L/tmp/chain/lib ',
    LIBS         => ''
);

1;
