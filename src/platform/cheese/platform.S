/*
 * File: platform.S
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-02-27 08:26:32 am
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */


.section .text
.globl _end_trigger
_end_trigger:
  addi x31, x0, 1
  nop
  nop
  nop
  addi x31, x0, 0
  ret