ifndef OPENSWANSRCDIR
$(error You Must set OPENSWANSRCDIR)
endif

include ${OPENSWANSRCDIR}/Makefile.inc

export TOPDIR

CONFIG_SHELL=/bin/sh 
export CONFIG_SHELL

CONFIG_MODULES=true

KLIPS_TOP=${OPENSWANSRCDIR}/linux
VPATH+=${KLIPSSRC}

# include file with .h-style macros that would otherwise be created by
# config. Must occur before other includes.
ifneq ($(strip $(MODULE_DEF_INCLUDE)),)
EXTRA_CFLAGS += -include ${MODULE_DEF_INCLUDE}
endif

EXTRA_CFLAGS += $(KLIPSCOMPILE)
EXTRA_CFLAGS += -Wall -DIPCOMP_PREFIX
#EXTRA_CFLAGS += -Werror
#EXTRA_CFLAGS += -Wconversion 
#EXTRA_CFLAGS += -Wmissing-prototypes 
# 'override CFLAGS' should really be 'EXTRA_CFLAGS'

KERNEL_CFLAGS= $(shell $(MAKE) -C $(TOPDIR) --no-print-directory -s -f Makefile ARCH=$(ARCH) MAKEFLAGS= script SCRIPT='@echo $$(CFLAGS)'   )

MODULE_CFLAGS= $(shell $(MAKE) -C $(TOPDIR) --no-print-directory -s -f Makefile ARCH=$(ARCH) MAKEFLAGS= script SCRIPT='@echo $$(MODFLAGS)'  )

EXTRA_CFLAGS += ${KERNEL_CFLAGS}

EXTRA_CFLAGS += -I${KLIPS_TOP}/include

EXTRA_CFLAGS += -I${TOPDIR}/include 
EXTRA_CFLAGS += -I${LIBZLIBSRCDIR}

version.c:	${KLIPSSRC}/version.in.c ${OPENSWANSRCDIR}/Makefile.ver
	sed '/"/s/xxx/$(IPSECVERSION)/' $< >$@

include ${KLIPSSRC}/Makefile.fs2_4

