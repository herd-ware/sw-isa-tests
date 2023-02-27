BASE_I_PRE = ${ISA_PREFIX}-base-i-
BASE_I_PATH = ${PRJ_DIR}src/base/i
BASE_I_CFLAGS = -march=rv${XLEN}i
BASE_I_32_TEST = 	lui auipc \
									jal jalr \
									beq bne \
									bge bgeu \
									blt bltu \
									lb lbu \
									lh lhu \
									lw \
									sb sh sw \
									add sub addi \
									slt sltu slti sltiu \
									xor xori \
									or ori \
									and andi \
									sll slli \
									srl srli \
									sra srai \
									app-empty \
									app-loop \
									app-hcf \
									app-br-now \
									app-array

BASE_I_64_TEST = 	${BASE_I_32_TEST} \
									lwu ld \
									sd

${BASE_I_${XLEN}_TEST}:
	${CC} ${CFLAGS} ${BASE_I_CFLAGS} -c ${BASE_I_PATH}/$@.S -o ${PRJ_DIR}obj/${BASE_I_PRE}$@.o
	${LD} -T ${PRJ_DIR}src/platform/${PLATFORM}/script.ld ${PRJ_DIR}obj/start.o ${PRJ_DIR}obj/${PLATFORM}.o ${PRJ_DIR}obj/${BASE_I_PRE}$@.o -o ${PRJ_DIR}elf/${BASE_I_PRE}$@.elf
	${TOOLCHAIN}-objdump -D ${PRJ_DIR}elf/${BASE_I_PRE}$@.elf > ${PRJ_DIR}list/${BASE_I_PRE}$@.list -M numeric
	python3 ${ELF2HEX} --input ${PRJ_DIR}elf/${BASE_I_PRE}$@.elf --output ${PRJ_DIR}hex/${BASE_I_PRE}$@.hex --wide 16 --word 1
	sed -n '1,1024p;1025q' ${PRJ_DIR}hex/${BASE_I_PRE}$@.hex > ${PRJ_DIR}hex/${BASE_I_PRE}$@-rom.hex
	