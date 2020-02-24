  MACHINE   = WINDOWS
  CFLAGS    = -Wall -O4 -march=i486
  MAKE      = make
  EXT       = .exe
  SYSLIB    =

DEF= CC="$(CC)" CFLAGS="$(CFLAGS)" MACHINE=$(MACHINE) SYSLIB="$(SYSLIB)" \
	TOP=$(shell pwd) EXT=$(EXT)

MAKE_LENS  = $(MAKE) -C Src lens$(EXT) $(DEF) EXEC=lens PKGS=
MAKE_ALENS = $(MAKE) -C Src alens$(EXT) $(DEF) EXEC=alens PKGS="-DADVANCED"
MAKE_LIBLENS  = $(MAKE) -C Src liblens $(DEF) EXEC=lens PKGS=
MAKE_LIBALENS = $(MAKE) -C Src libalens $(DEF) EXEC=alens PKGS="-DADVANCED"
MAKE_CLEAN = $(MAKE) -C Src $(DEF) clean

lens:: dirs
	$(MAKE_LENS)
liblens:: dirs
	$(MAKE_LIBLENS)
alens:: dirs
	$(MAKE_ALENS)
libalens:: dirs
	$(MAKE_LIBALENS)
clean::
	$(MAKE_CLEAN)

all:: dirs
	rm -f lens$(EXT) alens$(EXT)
	$(MAKE_CLEAN)
	$(MAKE_ALENS)
	$(MAKE_CLEAN)
	$(MAKE_LENS)
	$(MAKE_CLEAN)

# This builds the necessary system-dependent subdirectories on unix machines
ifeq ($(MACHINE),WINDOWS)
dirs::
else
dirs:: Obj/$(HOSTTYPE) Bin/$(HOSTTYPE)
Obj/$(HOSTTYPE)::
	if test ! -d Obj/$(HOSTTYPE); \
	then mkdir Obj/$(HOSTTYPE); fi
Bin/$(HOSTTYPE)::
	if test ! -d Bin/$(HOSTTYPE); \
	then mkdir Bin/$(HOSTTYPE); fi
endif
