BASE_M_PRE = ${ISA_PREFIX}-base-m-
BASE_M_PATH = ${PRJ_DIR}src/base/m
BASE_M_CFLAGS = -march=rv${XLEN}im
BASE_M_32_TEST = 	mul \
									mulh mulhsu mulhu \
									div divu \
									rem remu

BASE_M_64_TEST = 	${BASE_M_32_TEST}

${BASE_M_${XLEN}_TEST}:
	${CC} ${CFLAGS} ${BASE_M_CFLAGS} -c ${BASE_M_PATH}/$@.S -o ${PRJ_DIR}obj/${BASE_M_PRE}$@.o
	${LD} -T ${PRJ_DIR}src/platform/${PLATFORM}/script.ld ${PRJ_DIR}obj/start.o ${PRJ_DIR}obj/${PLATFORM}.o ${PRJ_DIR}obj/${BASE_M_PRE}$@.o -o ${PRJ_DIR}elf/${BASE_M_PRE}$@.elf
	python3 ${ELF2HEX} --input ${PRJ_DIR}elf/${BASE_M_PRE}$@.elf --output ${PRJ_DIR}hex/${BASE_M_PRE}$@.hex --wide 16
	sed -n '1,1024p;1025q' ${PRJ_DIR}hex/${BASE_M_PRE}$@.hex > ${PRJ_DIR}hex/${BASE_M_PRE}$@-rom.hex
	${TOOLCHAIN}-objdump -D ${PRJ_DIR}elf/${BASE_M_PRE}$@.elf > ${PRJ_DIR}list/${BASE_M_PRE}$@.list -M numeric
	