BASE_A_PRE = ${ISA_PREFIX}-base-a-
BASE_A_PATH = ${PRJ_DIR}src/base/a
BASE_A_CFLAGS = -march=rv${XLEN}ia
BASE_A_32_TEST = 	lr-sc-w \
									amoswap-w \
									amoadd-w \
									amoxor-w \
									amoand-w \
									amoor-w \
									amomin-w amominu-w \
									amomax-w amomaxu-w

BASE_A_64_TEST = 	${BASE_A_32_TEST}

${BASE_A_${XLEN}_TEST}:
	${CC} ${CFLAGS} ${BASE_A_CFLAGS} -c ${BASE_A_PATH}/$@.S -o ${PRJ_DIR}obj/${BASE_A_PRE}$@.o
	${LD} -T ${PRJ_DIR}src/platform/${PLATFORM}/script.ld ${PRJ_DIR}obj/start.o ${PRJ_DIR}obj/${PLATFORM}.o ${PRJ_DIR}obj/${BASE_A_PRE}$@.o -o ${PRJ_DIR}elf/${BASE_A_PRE}$@.elf
	${TOOLCHAIN}-objdump -D ${PRJ_DIR}elf/${BASE_A_PRE}$@.elf > ${PRJ_DIR}list/${BASE_A_PRE}$@.list -M numeric
	${TOOLCHAIN}-objcopy ${BOOT_SECTIONS} ${PRJ_DIR}elf/${BASE_A_PRE}$@.elf ${PRJ_DIR}elf/${BASE_A_PRE}$@.boot8.elf
	python3 ${ELF2HEX} --input ${PRJ_DIR}elf/${BASE_A_PRE}$@.boot8.elf --output ${PRJ_DIR}hex/${BASE_A_PRE}$@.boot8.hex --offset ${BOOT_OFFSET} --wide 16 --word 1