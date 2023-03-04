/*
 * File: platform.S
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-03-03 04:08:49 pm
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */
 

#include "platform.h"


.section .text
.globl _end_trigger
_end_trigger:
  // Enable outputs
  li x20, IO_PLTF_ADDR_GPIOA_ENO
  li x21, IO_PLTF_ADDR_GPIOB_ENO
  li x22, 0xffffffff
  sw x22, 0(x20)
  sw x22, 0(x21)

  // Write instret
  rdinstret x11
  sw x11, 4(x21)
  // Set trigger instret
  li x11, (1 << GPIOA_BIT_INSTRET)
  sw x11, 4(x20)

  // Write tmask
  sw x10, 4(x21)
  // Set trigger end
  li x11, (1 << GPIOA_BIT_END)
  sw x11, 4(x20)

  nop
  nop
  nop
  ret

.globl send_tmask