BASE_B_PRE = ${ISA_PREFIX}-base-b-
BASE_B_PATH = ${PRJ_DIR}src/base/b
BASE_B_CFLAGS = -march=rv${XLEN}i_zba_zbb_zbc_zbs

BASE_ZBS_32_TEST = bset

BASE_B_32_TEST = 	${BASE_ZBS_32_TEST}

BASE_B_64_TEST = 	${BASE_B_32_TEST}

${BASE_B_${XLEN}_TEST}:
	${CC} ${CFLAGS} ${BASE_B_CFLAGS} -c ${BASE_B_PATH}/$@.S -o ${PRJ_DIR}obj/${BASE_B_PRE}$@.o
	${LD} -T ${PRJ_DIR}src/platform/${PLATFORM}/script.ld ${PRJ_DIR}obj/start.o ${PRJ_DIR}obj/${PLATFORM}.o ${PRJ_DIR}obj/${BASE_B_PRE}$@.o -o ${PRJ_DIR}elf/${BASE_B_PRE}$@.elf
	${TOOLCHAIN}-objdump -D ${PRJ_DIR}elf/${BASE_B_PRE}$@.elf > ${PRJ_DIR}list/${BASE_B_PRE}$@.list -M numeric
	${TOOLCHAIN}-objcopy ${BOOT_SECTIONS} ${PRJ_DIR}elf/${BASE_B_PRE}$@.elf ${PRJ_DIR}elf/${BASE_B_PRE}$@.boot8.elf
	python3 ${ELF2HEX} --input ${PRJ_DIR}elf/${BASE_B_PRE}$@.boot8.elf --output ${PRJ_DIR}hex/${BASE_B_PRE}$@.boot8.hex --offset ${BOOT_OFFSET} --wide 16 --word 1
	