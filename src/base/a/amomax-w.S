/*
 * File: amomax-w.S
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-02-27 08:28:04 am
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */


#include "../../common/macro.h"
#include "macro-a.h"


// ******************************
//            INIT
// ******************************
TEST_INIT(25)

// ******************************
//             BODY
// ******************************
TEST_BODY
  // ------------------------------
  //            ACCESS
  // ------------------------------
  //       testnum, instr_amo,  instr_ld, nnop, rs1,  tbase, rs2, v2,         rd,   vr1,        vr2
  TEST_AMO(0,       amomax.w,   lw,       0,    x5,   data0, x6,  0x00000000, x7,   0x00000000, 0x00000000)

  TEST_AMO(1,       amomax.w,   lw,       0,    x5,   data1, x6,  0xff00ff00, x7,   0x00000000, 0x00000000)
  TEST_AMO(2,       amomax.w,   lw,       0,    x5,   data2, x6,  0x0ff00ff0, x7,   0x00000000, 0x0ff00ff0)
  TEST_AMO(3,       amomax.w,   lw,       0,    x5,   data3, x6,  0x00ff00ff, x7,   0x00000000, 0x00ff00ff)

  TEST_AMO(4,       amomax.w,   lw,       0,    x5,   data0, x6,  0x00000001, x7,   0x00000000, 0x00000001)
  TEST_AMO(5,       amomax.w,   lw,       1,    x5,   data0, x6,  0x80000000, x7,   0x00000001, 0x00000001)
  TEST_AMO(6,       amomax.w,   lw,       2,    x5,   data0, x6,  0x000ff001, x7,   0x00000001, 0x000ff001)

  TEST_AMO(7,       amomax.w,   lw,       4,    x5,   data3, x6,  0x00000100, x7,   0x00ff00ff, 0x00ff00ff)
  TEST_AMO(8,       amomax.w,   lw,       0,    x5,   data2, x6,  0x0fff0000, x7,   0x0ff00ff0, 0x0fff0000)
  TEST_AMO(9,       amomax.w,   lw,       0,    x5,   data3, x6,  0x00ff00ff, x7,   0x00ff00ff, 0x00ff00ff)

  la x5, data0
  li x6, 0x80000000
  sw x0, 0(x5)
  sw x0, 4(x5)
  sw x6, 8(x5)
  sw x6, 12(x5)

  // ------------------------------
  //          SRC = OTHERS
  // ------------------------------
  TEST_AMO(10,      amomax.w,   lw,       0,    x10,  data0, x11, 0x00000001, x12,  0x00000000, 0x00000001)
  TEST_AMO(11,      amomax.w,   lw,       0,    x13,  data0, x15, 0x00000002, x14,  0x00000001, 0x00000002)
  TEST_AMO(12,      amomax.w,   lw,       0,    x16,  data0, x10, 0x8000001f, x7,   0x00000002, 0x00000002)
  TEST_AMO(13,      amomax.w,   lw,       0,    x23,  data1, x24, 0x10000000, x22,  0x00000000, 0x10000000)

  // ------------------------------
  //           S2 = DEST
  // ------------------------------
  TEST_AMO(14,      amomax.w,   lw,       0,    x5,   data0, x6,  0x00000100, x7,   0x00000002, 0x00000100)
  TEST_AMO(15,      amomax.w,   lw,       0,    x5,   data0, x6,  0xf0000000, x7,   0x00000100, 0x00000100)

  // ------------------------------
  //            S2 = 0
  // ------------------------------
  TEST_AMO(16,      amomax.w,   lw,       0,    x5,   data0, x0,  0x7fffffff, x7,   0x00000100, 0x00000100)
  TEST_AMO(17,      amomax.w,   lw,       0,    x5,   data1, x0,  0x00100000, x7,   0x10000000, 0x10000000)

  // ------------------------------
  //            DEST = 0
  // ------------------------------
  TEST_AMO(18,      amomax.w,   lw,       0,    x5,   data0, x6,  0x11000000, x0,   0x00000000, 0x11000000)
  TEST_AMO(19,      amomax.w,   lw,       0,    x5,   data0, x6,  0x0f000000, x0,   0x00000000, 0x11000000)

  // ------------------------------
  //         S2 = DEST = 0
  // ------------------------------
  TEST_AMO(20,      amomax.w,   lw,       0,    x5,   data3, x0,  0xffffffff, x0,   0x00000000, 0x00000000)

  // ------------------------------
  //            BYPASS
  // ------------------------------
  //           testnum, instr_amo,  instr_ld, nnop, rs1,  tbase, rs2, v2,         rd,   vr1,        vr2
  TEST_AMO_BYP(21,      amomax.w,   lw,       1,    x5,   data2, x6,  0xffffffff, x7,   0x80000000, 0xffffffff)
  TEST_AMO_BYP(22,      amomax.w,   lw,       2,    x5,   data2, x6,  0x00000000, x7,   0xffffffff, 0x00000000)
  TEST_AMO_BYP(23,      amomax.w,   lw,       4,    x5,   data2, x6,  0x00000100, x7,   0x00000000, 0x00000100)
  TEST_AMO_BYP(24,      amomax.w,   lw,       8,    x5,   data2, x6,  0x00000101, x7,   0x00000100, 0x00000101)
  
// ******************************
//             END
// ******************************
TEST_RESTORE
TEST_END

// ******************************
//             DATA
// ******************************
TEST_RODATA

TEST_DATA
data0:  .word 0x00000000
data1:  .word 0x00000000
data2:  .word 0x00000000
data3:  .word 0x00000000
