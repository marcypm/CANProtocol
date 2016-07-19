NAME=sha256
SRCS=sha256.c

ifeq ($(NO_OPT),)
	NO_OPT=1
endif
ifeq ($(NO_INLINE),)
	NO_INLINE=1
endif

#SHELL= ~/code/sha256/ccode/src
LOCAL_CONFIG = -legup-config=config.tcl
LEVEL = /opt/legup/legup-4.0/examples

include $(LEVEL)/Makefile.common
