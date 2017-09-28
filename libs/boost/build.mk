# $Id: build.mk,v 1.1 2007/04/16 10:04:34 roman Exp $
# ---------------------------------------------------------------------------

# Package name and version.
PACKAGE ?= pkg$(warning no package name specified!)
# VERSION ?= 0.0$(warning no package version specified!)

# Build behaviour.
DEPMODE ?= 1
SYMBOLS ?= 0
OPTIMIZE ?= 3
MACHINE ?= arch=pentium4m sse sse2
WARNINGS ?= all error
CMDECHO ?= full

export DEPMODE SYMBOLS OPTIMIZE MACHINE WARNINGS CMDECHO

# Common directories.
prefix ?= C:/Dev-Cpp
exec_prefix ?= $(prefix)
bindir ?= $(exec_prefix)/bin
libdir ?= $(exec_prefix)/lib
pkgconfigdir ?= $(libdir)/pkgconfig
slibdir ?= $(libdir)
datadir ?= $(prefix)/share
includedir ?= $(prefix)/include
cxxincludedir = $(includedir)/c++

# Package specific directories.
pkglibdir = $(libdir)$(PACKAGE)
pkgdatadir = $(datadir)/$(PACKAGE)
pkgincludedir = $(includedir)/$(PACKAGE)

# Machine configuration.
#arch ?= $(shell uname -m)
#tune ?= 

# Compiler commandline flags.
CFLAGS :=
CXXFLAGS = $(CFLAGS)
ARFLAGS = rcs

# DO NOT CHANGE ANYTHING BELOW THIS LINE UNLESS REALLY NOW WHAT YOU'RE DOING!
# ---------------------------------------------------------------------------

# Make configuration
# ---------------------------------------------------------------------------

Q-full =
Q-short = @
Q-long = @
C = -c

pad-short = $(tabstop)$(space)

ifeq ($(DEPMODE),1)
postdep = && $(SED) -i 's,^\(.*\)\.o:,\1.o \1.d:,' $*.d
endif

# Default target.
.DEFAULT_GOAL: all

#.SILENT:

# System configuration
# ---------------------------------------------------------------------------

# Host-triplet and architecture specification.
#host ?= $(shell $(CC) -dumpmachine))
host = i686-pc-mingw32
#arch ?= $(shell arch || uname -m || echo '$(host:%-*=%)')

export host arch

arch = $(word 1,$(subst -, ,$(host)))

# Kernel and user-level systems info.
#kernel ?= $(shell uname -s || echo '$(host:*-%-*=%)')
kernel = $(word 2,$(subst -, ,$(host)))

#system ?= $(shell uname -o || echo '$(host:*-%=%)')
system = $(word 3,$(subst -, ,$(host)))

export kernel system

# Shell utilities
LN ?= ln
CP ?= cp
RM ?= rm -f
RM_R ?= $(RM) -r
MKDIR ?= mkdir -p
SED ?= sed
SORT ?= sort
INSTALL ?= install
TAR ?= tar

# Development toolchain.
CC = $(cross)gcc
CXX = $(cross)g++
AR = $(cross)ar
NM = $(cross)nm
RANLIB = $(cross)ranlib
WINDRES = $(cross)windres
DLLTOOL = $(cross)dlltool
DLLWRAP = $(cross)dllwrap

# Default driver for dllwrap
DLLDRIVER = $(CC)



# Defaults for release tarball creation.
DISTDIR = $(PACKAGE)$(if $(VERSION),-$(VERSION))/
DISTPKG = $(outdir)$(PACKAGE)-$(VERSION).tar.gz
DISTLST = $(PACKAGE)-$(VERSION).tar.lst

export DISTDIR

# Specialized forms of programs
LN_S = $(LN) -s
RM_F = $(RM) -f
RM_R = $(RM) -r
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_EXEC = $(INSTALL) -m 755

# Target dependant configuration.
# ---------------------------------------------------------------------------

# Set up things for GNU/Linux based systems.
ifeq ($(system), Linux)
host = i686-pc-linux-gnu
prefix = /usr/audium

ilibext = so
slibext = $(VERSION)
slibprefix = lib

CFLAGS += -fPIC
CPPFLAGS += -DPIC
LDFLAGS += -Wl,-rpath,$(libdir) -static-libgcc

endif

ifeq ($(system), mingw32)

# A win32 system.
host = i686-pc-mingw32
#prefix = /usr/$(host)
#cross = $(host)-
cross = c:/dev-cpp/bin/

slibdir = $(bindir)

binext = .exe
slibext = dll
ilibext = $(slibext).a

#LDFLAGS += -L$(libdir)

endif

slibmask = $(outdir)$(addlibprefix)%.$(slibext)
ilibmask = lib%.$(ilibext)

# Build dependencies.
# ---------------------------------------------------------------------------

# Debugging symbols for gdb
ifeq ($(SYMBOLS),1)
CFLAGS += -g -ggdb
endif

# Dependency tracking into %.d files.
ifeq ($(DEPMODE),1)
CFLAGS += -MMD
endif

# Warning level.
ifneq ($(WARNINGS),)
CFLAGS += $(addprefix -W,$(WARNINGS))
endif

# Optimization?
ifneq ($(OPTIMIZE),)
CFLAGS += -O$(OPTIMIZE)
endif

# Machine flags.
ifneq ($(OPTIMIZE),0)
ifneq ($(MACHINE),)
CFLAGS += $(addprefix -m,$(MACHINE))
endif
endif

# Compilation and link commands
# ---------------------------------------------------------------------------
COMPILE = $(call exec-var,CC$(tabstop)$(space),$(call var-strip,DEFS INCLUDES CPPFLAGS CFLAGS),$(reldir)$@)
LTCOMPILE = $(LIBTOOL) --tag=C --mode=compile $(CC) $(call var-strip,DEFS INCLUDES CPPFLAGS CFLAGS)
CXXCOMPILE = $(call exec-var,CXX$(tabstop)$(space),$(call var-strip,DEFS INCLUDES CPPFLAGS CXXFLAGS),$(reldir)$@)
LTCXXCOMPILE = $(LIBTOOL) --tag=CXX --mode=compile $(CXX) $(call var-strip,DEFS INCLUDES CPPFLAGS CXXFLAGS)
LINK = $(call exec-var,CC$(tabstop)$(space),$(if $(LDFLAGS), $(LDFLAGS)),$(reldir)$@)
CXXLINK = $(call exec-var,CXX$(tabstop)$(space),$(if $(LDFLAGS), $(LDFLAGS)),$(reldir)$@)

# Global build configuration.
# ---------------------------------------------------------------------------
#DEPFILES = $(subst .o,.d,$(OBJECTS))
CLEANFILES ?= $(OBJECTS) $(DEPFILES) $(LIBRARIES) $(PROGRAMS)
#TARGETS = $(LIBRARIES) $(PROGRAMS)

# ===========================================================================
# Functions section.
# ===========================================================================

# Auxilary variables used in several functions.
# ----------------------------------------------------------------------------

# Comma, for use inside function arguments.
comma := ,

# Used for $(space).
empty :=

# A single space character.
space := $(empty) $(empty)

# A tabstop character.
tabstop := $(empty)	$(empty)

# A newline character.
define newline
\


endef

# Functions concerning variables.
# ----------------------------------------------------------------------------

# var-if NAME,NON-EMPTY,EMPTY
# Expands NONEMPTY when $(NAME) not empty, otherwise EMPTY.
var-if = \
	$(if $($1),$2,$3)

# var-ifeq,A,B,EQUAL,NON-EQUAL
# Expands to EQUAL when $(A) == $(B), otherwise to NON-EQUAL.
var-ifeq = \
	$(if $(subst $2,,$1),$4,$3)

# var-ifneq,A,B,NON-EQUAL,EQUAL
# Expands to EQUAL when $(A) == $(B), otherwise to NON-EQUAL.
var-ifneq = \
	$(if $(subst $2,,$1),$3,$4)

# var-default,NAME,DEFAULT
# Expands variable $(NAME) when not empty, otherwise DEFAULT.
var-default = \
	$(if $($1),$($1),$2)

var-strip = $(strip $(foreach name,$1, $(if $(strip $($(name))), $(strip $($(name))) ) ))

# Symbol extraction functions.
# ----------------------------------------------------------------------------

# nm-execute FILE
# Runs binutils nm(1) on FILE, output in posix format. File names will be 
# stripped.
nm-execute = \
	$(filter-out $1%,\
	$(shell $(NM) -P $(1))

# nm-extract OUTPUT,TYPE
# Extracts symbols with the given type character from output of nm-execute.
nm-extract = \
	$(patsubst %:$2,%,\
	$(filter %:$2,\
	$(subst $(space)$2$(space),:$2$(space),$1$(space))))

# nm-symbols FILE,TYPE
# Both of the above combined.
nm-symbols = \
	$(call nm-extract,\
	$(call nm-execute,$1),$2)

# Echoing commands.
# ----------------------------------------------------------------------------

# echo-mode
echo-mode = $(if $(CMDECHO),$(CMDECHO),short)

# echo-short
echo-short = echo '  $1$(space)$(if $3,$3,$@)' &&

# echo-long
echo-long = echo '  $1$(space)$(if $3,$3,$@) $^' &&

# echo-full
echo-full = $(info $(Q-full)help)

echo-q = $(echo-$(echo-mode))

# internally used echo macro
echo-cmd = $(Q-$(echo-mode))$(echo-$(echo-mode))

echo-qcmd = $(echo-$(echo-mode))

# Executing commands.
# ----------------------------------------------------------------------------

# exec-shell NAME,CMDS
exec-q = $(echo-q) $2

# exec-cmd NAME,CMDS
exec-cmd = $(echo-cmd) $2

# exec-var VAR,ARGS
exec-var = $(echo-cmd) $($(strip $1)) $2
exec-qvar = $(echo-qcmd) $($(strip $1)) $2

# Special commands.
# ----------------------------------------------------------------------------

mkdef-script = '0,/^/ { s/^/EXPORTS\n/; P }; /$(PATTERN) [A-Z] [0-9a-f]\{8\}/ s/^_\([_a-z0-9]\+\) .*/\t\1/ip'

mkdef-nm = $(call exec-cmd,MKDEF$(tabstop)$(space),$(NM) --defined-only --format=posix $1 |\
	$(SED) -n $(mkdef-script) >$@,$(reldir)$@)

# Transform stem into library names (import or shared library).
# ----------------------------------------------------------------------------
name-ilib = $(patsubst %,$(ilibmask),$1)
name-slib = $(patsubst %,$(slibmask),$1)

# Expands to both, the import and the shared libraries.
name-libs = $(name-slib) $(name-ilib)

# Filtering and substitution of lists.
# ---------------------------------------------------------------------------
list-objs = $(patsubst %.cpp,%.o,$(patsubst %.c,%.o,$1))

# File masking using wildcards.
# ---------------------------------------------------------------------------
mask-makefiles = *akefile*

# File collection using wildcards.
# ---------------------------------------------------------------------------
mask-sources = *.c *.h *.cpp *.cc *.cxx *.hpp *.hxx *.S *.s *.asm *.inc
mask-auxfiles = *.rc *.r SConstruct
mask-texts = \
	ABOUT* README* COPYING* COPYRIGHT HOWTO* RELEASE*  VERSION INSTALL* NEWS INDEX MANIFEST AUTHORS TODO ChangeLog* \
	ANNOUNCE CHANGES KNOWNBUG LICENSE THANKS Y2KINFO DESIGN NOTES PORTS Licensing* \
	*.txt *.TXT *.doc *.html *.htm FAQ *.3 *.texi *.info* *.tex *.pdf *.rtf *.sty \
  *.manifest
mask-scripts = *.sh *.com *.py *.tcl *.tk *.cmd *.sed *.pl *.applescript
mask-makefiles = *akefile* *.mk *.icc *.mms
mask-nls = *.po *.gmo *.sin *.pot POTFILES.in *.header *.mo
mask-man = *.1 *.2 *.3 *.4 *.5 *.6 *.7 *.8
mask-autoconf = *.m4 autogen.sh configure.in configure.ac config.h.in Makefile.in configure install-sh mkinstalldirs config.h.in *config*.in *.h.in
mask-automake = Makefile.am config.sub config.guess ltmain.sh depcomp missing
mask-libtool = ltmain.sh ltconfig
mask-images = *.png *.jpg *.jpeg *.gif *.tif *.tiff *.bmp *.xpm *.eps *.xbm *.wmf *.pnm *.pcx *.ani
mask-win32 = *.chm *.bat *.obj *.pas *.mak *.vcproj *.dsp *.dsw *.sln *.cs *.csproj *.raw *.gpr *.ico *.vc *.mdp *.rc *.vcp *.vcw *.pro *.cur *.ini
mask-various = *.clp *.build *.pk *.mms *.qpg bndsrc
mask-mac = *.note *.make *.mpw *.mm
mask-borland = *.bpf *.bpr *.pbxproj

mask-default = \
	$(mask-sources) $(mask-textfiles) $(mask-makefiles) $(mask-auxfiles)

mask-everything = $(foreach t,sources auxfiles texts scripts makefiles \
	autoconf automake libtool win32 various,$(mask-$t))

collectfn-recursive = $1 $(foreach auxdir,$(patsubst %/,%,$(AUXDIRS)),$(addprefix $(auxdir)/,$1) )
collectfn-arbitrary = $(call collectfn-recursive,$(if $(mask-$1),$(mask-$1),$1))
collectfn-list = $(foreach list,$1,$(call collectfn-arbitrary,$(list)) )

collect = $(patsubst %/,%,$(sort $(wildcard $(call collectfn-list,$(if $1,$1,default)))))
#collect= $(call collect-recursive,$1)

# Shell utilities.
# ---------------------------------------------------------------------------

# shell-foreach,SHVARNAME,LIST,COMMANDS
shell-foreach = for $1 in $2; do $3; done

# Extraction macros.
# ---------------------------------------------------------------------------

# extract-dirs,PATHS[,STRIP]
extract-dirs = $(patsubst %/,%,$(sort $(dir $(patsubst $2/%,%,$1))))

# extract-files,FILES,DIR[,STRIP]
extract-rfiles = \
	$(addprefix $(if $3,$3/,),\
		$(filter $(patsubst .,,$2)/%,\
			$(filter-out $(addsuffix /,$(filter-out $2,$(call extract-dirs,$1,$3))),\
				$(patsubst $3/%,%,$1)\
			)\
		)\
	)

extract-files = \
	$(addprefix $(if $3,$3/,),\
		$(filter $(patsubst .,,$2)%,\
			$(filter-out $(addsuffix /,$(filter-out $2,$(call extract-dirs,$1,$3))),\
				$(patsubst $3/%,%,$1)\
			)\
		)\
	)

#echo 1: $1, 2: $2, 3: $3 
#$(filter-out %/%,$(filter $(if $3,$3/,)$2%,$(patsubst ./%,%,$1)))

# Installation.
# ---------------------------------------------------------------------------

# install-rdata,FILES,DIR[,STRIP]
install-rdata = \
	$(foreach dir,$(call extract-dirs,$1,$3),\
		$(call exec-var,INSTALL,-d $2/$(patsubst ./%,%,$(dir)))$(newline)\
		$(call exec-var,INSTALL_DATA,$(call extract-rfiles,$1,$(dir),$3) $2/$(dir))$(newline)\
	)
  
# install-rexec,FILES,DIR[,STRIP]
install-rexec = \
	$(foreach dir,$(call extract-dirs,$1,$3),\
		$(call exec-var,INSTALL,-d $2/$(patsubst ./%,%,$(dir)))$(newline)\
		$(call exec-var,INSTALL_EXEC,$(call extract-rfiles,$1,$(dir),$3) $2/$(dir))$(newline)\
	)
  
# install-data,FILES,DIR
install-data = \
	$(call exec-var,INSTALL,-d $2)$(newline)\
	$(call exec-var,INSTALL_DATA,$1 $2)$(newline)

# install-exec,FILES,DIR
install-exec = \
	$(call exec-var,INSTALL,-d $2)$(newline)\
	$(call exec-var,INSTALL_EXEC,$1 $2)$(newline)

# ===========================================================================
# Rules section.
# ===========================================================================

# Default commands when target is undefined. Will execute for every 
# prerequisite.
# ---------------------------------------------------------------------------
.DEFAULT: %
	@echo "  ERROR   no such target '$@'"

# Compilation targets.
# ---------------------------------------------------------------------------

# Preprocess, compile and assemble C source.
%.o: %.c
	$(COMPILE) $(C) -o $@ $< $(postdep)

%$(MT).lo: %.c
	$(LTCOMPILE) $(C) -o $@ $< $(postdep)

# Preprocess, compile but not assemble C source.
%.s: %.c
	$(COMPILE) -S -o $@ $< $(postdep)

# Preprocess, compile and assemble C++ source.

%.o: %.cpp
	$(CXXCOMPILE) $(C) -o $@ $< $(postdep)

%$(MT).lo: %.cpp
	$(LTCXXCOMPILE) $(C) -o $@ $< $(postdep)

%.o: %.cxx
	$(CXXCOMPILE) $(C) -o $@ $< $(postdep)

# Compile ressources using windres.
%.o: %.rc
	$(WINDRES)$(if $(CPPFLAGS), $(CPPFLAGS),) -o $@ $<

# Preprocess, compile but not assemble C++ source.
%.s: %.cpp;
	$(CXXCOMPILE) -S -o $@ $< $(postdep)

# Dependency stub
%.d: 
	@touch $@

# Linking targets.
# ---------------------------------------------------------------------------

# Library search patterns.
.LIBPATTERNS := lib%.$(ilibext) lib%.a
VPATH := $(subst $(space),:,$(addprefix $(topdir),$(subst :,$(space),$(LIBPATH))))
vpath := $(addprefix $(topdir),$(subst :,$(space),$(LIBPATH)))
#VPATH := $(if $(LIBPATH),$(subst $(space),:,$(addprefix $(thisdir),$(subst :,$(space),$(LIBPATH))))):$(topdir):$(topdir)../
#vpath := $(if $(LIBPATH),$(addprefix $(thisdir),$(subst :,$(space),$(LIBPATH)))) $(topdir) $(topdir)../
#$(slibprefix)%.$(slibext)

#fuck:
#	echo $(arch) $(kernel) $(system)

# Wildcard target for shared libraries. $(LDADD)#lib%.def
$(outdir)%.$(slibext) lib%.$(ilibext):
	@echo 'target: $@'
	$(call exec-var,DLLWRAP,$(call var-strip,LDFLAGS)$(if $(DRIVER), --driver-name=$(DRIVER))$(if $(filter %.def,$^ $|), --def=$(filter %.def,$^ $|),$(if $(wildcard lib$(notdir $*).def), --def=lib$(notdir $*).def, --export-all-symbols)) \
		$(if $(filter %.$(ilibext),$@),--output-lib=$@) -o $(outdir)$*.$(slibext) $(filter-out %.def,$^) $(LDADD) $(LIBS),$(if $(outdir),,$(outdir))$*.$(slibext),$@)

%.def:
	$(call mkdef-nm,$^)

#lib%.$(ilibext): $(addlibprefix)$*.$(slibext)

#lib%.dll.a:
#	$(call exec-var,DLLWRAP,\
#	$(if $(DRIVER), --driver-name=$(DRIVER)) --def=lib$*.def --output-lib=$@ -o $(outdir)$*.$(slibext) $^ $(LDADD) $(LIBS),$(if $(outdir),,$(outdir))$*.$(slibext)

# $($(notdir $*)_OBJECTS)
%.a:
	$(call exec-var,AR$(tabstop)$(space),$(ARFLAGS) $@ $(filter %.o,$^),$(reldir)$@)

%$(MT).la:
	$(LIBTOOL) --tag=CXX --mode=link $(CXX) $(LDFLAGS) -o $@ $(filter %.lo,$^) $(LIBADD)

# Generic linking target
%$(binext):
	$(LINK) -o $@ $^ $(LIBS) $(postdep)

# Wildcard target for simple binaries.
%$(binext): #%.cpp
	$(if $(CCLD),$(CCLD),$(LINK)) $(CPPFLAGS) -o $@ $^ $(filter %.a,$|)$(if $(strip $(LDADD)), $(LDADD))$(if $(strip $(LIBS)), $(LIBS)) $(postdep)

#%$(binext): %.c
#	$(LINK) $(CPPFLAGS) $(CFLAGS) -o $@ $*.c $(LDADD) $(LIBS)

#lib%.$(ilibext): %.$(slibext)


# Build targets.
# ---------------------------------------------------------------------------

ifneq ($(TARGETS),)
.PHONY: all
# Builds all $(TARGETS)
#debug:
#	echo vpath = $(vpath)
#	echo VPATH = $(VPATH)
all: $(TARGETS)
endif

.PHONY: audium.mk GNUmakefile

GNUmakefile:;
audium.mk:;

# Cleanup targets.
# ---------------------------------------------------------------------------

.PHONY: clean
clean:
ifneq ($(CLEANFILES),)
# Cleans all $(CLEANFILES) in the build tree.
ifeq ($(Q-$(echo-mode)),)
	$(call exec-var,RM$(pad-short),$(CLEANFILES))
else
	@list='$(CLEANFILES)'; \
	for file in $$list; do \
		test -f "$$file" && \
		{ echo "  RM$(pad-short) $(reldir)$${file#$(outdir)}"; \
			$(RM) "$$file" || exit 1; } \
	done; \
	true  
endif
endif

# ---------------------------------------------------------------------------
# Recursive targets.
# ---------------------------------------------------------------------------
.PHONY: %-recursive



#cd-short = "  MAKE -C$(space)[31;1m$(reldir)[0m"
cd-short = '  MAKE -C$(space)\0033[0;31m$(reldir)\0033[0m'
cd-full = $$cmds

.PHONY: %-recursive
%-recursive:
	@for dir in $(SUBDIRS); do \
    cmds="$(MAKE)$(if $(Q-$(echo-mode)), --no-print-directory -s) -C $$dir reldir='$(reldir)$$dir/' outdir='../$(outdir)' topdir='../$(topdir)' DISTDIR='$(DISTDIR)$$dir/' Q-full='$(space)$(Q-full)' $*"; \
    /bin/echo -e $(cd-$(echo-mode))$(if $(Q-$(echo-mode)),$$dir,); eval $$cmds || exit 1; \
  done

# VPATH='../$(VPATH)$(if $(VPATH),:$(VPATH))
.PHONY: $(addsuffix /%,$(SUBDIRS))
$(addsuffix /%,$(SUBDIRS)):
ifeq ($(Q-$(echo-mode)),)
	$(MAKE) -C $(dir $@) reldir='$(reldir)$(dir $@)' outdir='' DISTDIR='$(DISTDIR)$(dir $@)/' Q-full='$(space)$(Q-full)' $*
else
	@cmd="$(MAKE)$(if $(Q-$(echo-mode)), --no-print-directory -s) -C $(dir $@) reldir='$(reldir)$(dir $@)' outdir='' topdir='../$(topdir)' DISTDIR='$(DISTDIR)$(dir $@)/' Q-full='$(space)$(Q-full)' $*"; \
  $(info $(cd-$(echo-mode)))echo -e $(cd-$(echo-mode))$(patsubst %/$*,%,$@); eval $$cmd || exit 1
endif

# Package management targets.
# ---------------------------------------------------------------------------

ifneq ($(DISTFILES),)
.PHONY: $(DISTDIR) $(DISTPKG) $(SUBDIRS)

distfiles:
	@for file in $(DISTFILES); do \
		echo $$file; \
	done

mkdir-short = '  MKDIR$(pad-short)'
dist-short = '  DIST$(pad-short)'

.PHONY: distdir $(outdir)$(DISTDIR)
distdir: $(outdir)$(DISTDIR) $(if $(SUBDIRS),distdir-recursive)
$(outdir)$(DISTDIR): $(DISTFILES)
	$(call exec-var,RM_R$(pad-short),$(outdir)$(DISTDIR),$(DISTDIR))
ifeq ($(SUBDIRS)$(AUXDIRS),)
	$(call exec-var,MKDIR$(pad-short),$(outdir)$(DISTDIR),$(DISTDIR))
else
ifeq ($(Q-$(echo-mode)),)
	$(call exec-var,MKDIR$(pad-short),$(addprefix $(outdir)$(DISTDIR),. $(AUXDIRS)))
else
	@for dir in . $(AUXDIRS); do \
	  echo $(mkdir-$(echo-mode)) $(DISTDIR)$${dir%/} 1>&2; \
	  $(MKDIR) "$$dir" "$(outdir)$(DISTDIR)$${dir%/}" || exit 1; \
	done
endif
endif
#ifeq ($(Q-$(echo-mode)),)
#	$(call exec-var,CP$(pad-short),$(DISTFILES) $(outdir)$(DISTDIR))
#else
	@for file in $(filter-out $(AUXDIRS),$(DISTFILES)); do \
	  echo $(dist-$(echo-mode)) "$(DISTDIR)$${file#$(outdir)}" 1>&2; \
	  $(CP) "$$file" "$(outdir)$(DISTDIR)$${file#$(outdir)}" || exit 1; \
	done
#endif

#$(DISTLST): $(DISTPKG)
#	$(TAR) -tf $^ $|

cmd-tarlist = $(shell $(TAR) -tf $1)
TARFILES = $(patsubst $(DISTDIR)%,%,$(call cmd-tarlist,$(DISTPKG)))
GETDIRS = $(wildcard $(addsuffix /,$(patsubst %/,%,$(AUXDIRS))))
DISTERR = $(filter-out $(TARFILES),$(strip $(addprefix $(DISTDIR),$(DISTFILES) $(GETDIRS))))
NOTDIST = $(filter-out $(patsubst %/,%,$(wildcard $(DISTFILES) $(GETDIRS))),$(patsubst %/,%,$(wildcard $(call collectfn-recursive,*))))


tarlist:
	@$(call shell-foreach,file,$(TARFILES),echo $$file)

distcmp:
	@echo DISTFILES: $(patsubst %/,%,$(wildcard $(DISTFILES) $(GETDIRS)))
	@echo ALL: $(patsubst %/,%,$(wildcard $(call collectfn-recursive,*)))

distsync:
	@$(call shell-foreach,file,$(NOTDIST),echo $(reldir)$$file)
#	echo $(GETDIRS)
#	echo $(filter-out $(patsubst $(DISTDIR)/%,%,$(TARFILES)),$(GETDIRS))
#	@for file in $(DISTERR); do(echo "! $$file"$$( if test -d "$$file"; then echo '/'; elif test -x "$$file"; then echo '*'; fi ) )done; \
#	for file in $(NOTDIST); do(echo "+ $$file"$$( if test -d "$$file"; then echo '/'; elif test -x "$$file"; then echo '*'; fi ) )done

dirlist:
	@$(call shell-foreach,dir,$(GETDIRS),echo $$dir)
distlist:
	@for file in $(DISTFILES); do \
		test -f "$$file" && echo "$$file" || exit 1; \
	done

ifeq ($(outdir),)
$(DISTPKG): distdir
	set +e; \
	$(call exec-var,TAR$(pad-short),-czf $(DISTPKG) $(DISTDIR)); ret=$?; \
	$(call exec-qvar,RM_R$(pad-short),$(DISTDIR),$(DISTDIR)); exit $ret

.PHONY: dist

dist:
	@set +e; trap "$(call exec-qvar,RM_R$(pad-short),$(DISTDIR),$(DISTDIR))" HUP INT TERM QUIT CHLD; \
	$(MAKE) -s '$(DISTPKG)' && echo '$(DISTPKG) ready' || false
endif

endif

distcheck-child: distdir
	set +e; \
	$(MAKE) -C $(DISTDIR) outdir=../$(outdir) thisdir=../$(thisdir) topdir=../$(topdir) reldir=$(DISTDIR); ret=$?; \
	$(call exec-qvar,RM_R$(pad-short),$(DISTDIR),$(DISTDIR)); exit $ret

distcheck:
	@set +e; trap "$(call exec-qvar,RM_R$(pad-short),$(DISTDIR),$(DISTDIR))" HUP INT TERM QUIT CHLD; \
	$(MAKE) -s distcheck-child && echo '$(DISTDIR) builds fine!' || false

# If we have dependencies, then include them now.
# ---------------------------------------------------------------------------
ifeq ($(DEPMODE),1)
ifneq ($(DEPFILES),)
.PHONY: $(DEPFILES)

-include $(DEPFILES)

$(DEPFILES):;
endif
endif

-L%: ;
-I%: ;
-D%: ;
