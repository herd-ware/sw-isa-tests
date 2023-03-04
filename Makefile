XLEN = 32
ELF2HEX = ${HERD_TOOLS}/elf2hex.py
PLATFORM = cheese

MAKE_PATH := ${abspath ${lastword ${MAKEFILE_LIST}}}
PRJ_DIR := ${dir ${MAKE_PATH}}
NAME = isa-tests
CC = ${TOOLCHAIN}-gcc
LD = ${TOOLCHAIN}-ld
CFLAGS = -O1 -nostdlib -nostartfiles -fstrict-volatile-bitfields
CFLAGS += -Woverflow 
CFLAGS += -DXLEN=${XLEN} 
ISA_PREFIX := ${ISA}${XLEN}
ROM_SECTIONS = --only-section .rodata* --only-section .text*
ROM_OFFSET=0x00000000

export PRJ_DIR XLEN CC CFLAGS LD ELF2HEX PLATFORM ISA_PREFIX ROM_SECTIONS ROM_OFFSET
include src/base/i/Makefile
include src/base/m/Makefile
include src/base/a/Makefile
include src/base/b/Makefile


all: start
	@${MAKE} -C src/base/i ${BASE_I_${XLEN}_TEST}
	@${MAKE} -C src/base/m ${BASE_M_${XLEN}_TEST}
	@${MAKE} -C src/base/a ${BASE_A_${XLEN}_TEST}
	@${MAKE} -C src/base/b ${BASE_B_${XLEN}_TEST}

build-dir:
	mkdir -p obj
	mkdir -p elf
	mkdir -p hex
	mkdir -p list

start: build-dir
	${CC} ${CFLAGS} -c src/${ISA}/start.S -o obj/start.o
	${CC} ${CFLAGS} -c src/platform/${PLATFORM}/platform.S -o obj/${PLATFORM}.o

clean:
	rm -rf obj
	rm -rf elf
	rm -rf hex
	rm -rf list

