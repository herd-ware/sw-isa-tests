/*
 * File: macro-rr.h
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-02-27 08:27:24 am
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */


## ******************************
##          RR INSTR
## ******************************
#define TEST_RR_S12(testnum, instr, nnop1, nnop2, rs1, v1, rs2, v2, rd, vr) \
t##testnum##_start: \
  li rs1, DATA_XLEN(v1); \
  INSERT_NOPS_##nnop1; \
  li rs2, DATA_XLEN(v2); \
  INSERT_NOPS_##nnop2; \
  instr rd, rs1, rs2; \
  TMASK_UP(testnum, rd, vr);

#define TEST_RR_S21(testnum, instr, nnop1, nnop2, rs1, v1, rs2, v2, rd, vr) \
t##testnum##_start: \
  li rs2, DATA_XLEN(v2); \
  INSERT_NOPS_##nnop2; \
  li rs1, DATA_XLEN(v1); \
  INSERT_NOPS_##nnop1; \
  instr rd, rs1, rs2; \
  TMASK_UP(testnum, rd, vr);

#define TEST_RR_BYP(testnum, instr, nnop, rs1, v1, rs2, v2, rd, vr) \
t##testnum##_start: \
  li rs1, DATA_XLEN(v1); \
  li rs2, DATA_XLEN(v2); \
  instr rd, rs1, rs2; \
  INSERT_NOPS_##nnop; \
  mv GPR_W0, rd; \
  TMASK_UP(testnum, GPR_W0, vr);  
  