DEPTH		= ../../..
topsrcdir	= ../../..
srcdir		= .
VPATH		= .

MOZ_COMPONENTS_VERSION_SCRIPT_LDFLAGS = 
MODULE		= universalchardet
LIBRARY_NAME	= universalchardet
EXPORT_LIBRARY	= 1
IS_COMPONENT	= 0
MODULE_NAME	= nsUniversalCharDetModule
ifneq ($(OS_ARCH),WINNT)
SHORT_LIBNAME	= ucdet
endif
MOZILLA_INTERNAL_API = 0

REQUIRES	= xpcom \
		  string \
		  uconv \
		  chardet \
		  $(NULL)

PACKAGE_FILE = universalchardet.pkg

CPPSRCS = \
		CharDistribution.cpp \
		JpCntx.cpp \
		LangBulgarianModel.cpp \
		LangCyrillicModel.cpp \
		LangGreekModel.cpp \
		LangHungarianModel.cpp \
		LangHebrewModel.cpp \
		nsHebrewProber.cpp \
		nsCharSetProber.cpp \
		nsBig5Prober.cpp \
		nsEUCJPProber.cpp \
		nsEUCKRProber.cpp \
		nsEUCTWProber.cpp \
		nsEscCharsetProber.cpp \
		nsEscSM.cpp \
		nsGB2312Prober.cpp \
		nsMBCSGroupProber.cpp \
		nsMBCSSM.cpp \
		nsSBCSGroupProber.cpp \
		nsSBCharSetProber.cpp \
		nsSJISProber.cpp \
		nsUTF8Prober.cpp \
		nsLatin1Prober.cpp \
		nsUniversalDetector.cpp \
               $(NULL)

# Not built on win32. Not sure why not
ifneq ($(OS_ARCH),WINNT)
CPPSRCS	+= LangThaiModel.cpp
endif

LT_OBJECTS = $(CPPSRCS:%.cpp=%.lo)
LT_LDFLAGS = -version-info 2:0 -rpath $(libdir) -no-undefined
INCLUDES = -I$(topsrcdir)/dist/include/xpcom -I$(topsrcdir)/dist/include/string -I$(topsrcdir)/dist/include/uconv -I$(topsrcdir)/dist/include/chardet -I$(topsrcdir)/dist/include/universalchardet -I$(topsrcdir)/dist/include -I$(topsrcdir)/dist/include/nspr    -I$(topsrcdir)/dist/sdk/include 
CXXFLAGS =  -g -ggdb -O2 -march=i686 -fshort-wchar -pthread -pipe -frtti -fexceptions
INSTALL = install

prefix ?= /usr/local
libdir ?= $(prefix)/lib
includedir ?= $(prefix)/include
pkgincludedir ?= $(includedir)/universalchardet

all: libuniversalchardet.la
install:
	$(INSTALL) -d $(DESTDIR)$(libdir)
	libtool --mode=install $(INSTALL) libuniversalchardet.la $(DESTDIR)$(libdir)
	$(INSTALL) -d $(DESTDIR)$(pkgincludedir)
	libtool --mode=install $(INSTALL) *.h $(DESTDIR)$(pkgincludedir)

clean:
	$(RM) $(LT_OBJECTS)


libuniversalchardet.la: $(LT_OBJECTS)
	libtool --mode=link g++ $(LT_LDFLAGS) -o $@ $^ -lnspr4

%.lo: %.cpp
	libtool --mode=compile g++ $(CXXFLAGS) $(INCLUDES) -c $<

EXTRA_DSO_LDOPTS += -lnspr4
#EXTRA_DSO_LDOPTS += \
#		$(MOZ_COMPONENT_LIBS) \
#		$(NULL)

#include $(topsrcdir)/config/rules.mk

ifeq ($(OS_ARCH),WINNT)
DEFINES		+= -D__STDC__
endif
