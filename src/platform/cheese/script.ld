/*
 * File: script.ld
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-03-04 11:34:22 am
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */


MEMORY
{
  ROM      (rx)  : ORIGIN = 0x00000000, LENGTH = 0x00040000
  RAM      (rwx) : ORIGIN = 0x08000000, LENGTH = 0x00040000
}

STACK_SIZE  = 0x0800;
BOOT_PC     = 0x1000;

SECTIONS
{
  .rodata 0x00000000 : { 
    *(.rodata) 
  } > ROM

  .text BOOT_PC : {
    KEEP(*start.o(.text*));  
    *(.text)
  } > ROM
  
  .data : { 
    *(.data) 
  } > RAM
  
  .stack (NOLOAD):
  {
    . = ALIGN(8);
    . = . + STACK_SIZE;
    . = ALIGN(8);
    _stack = . ;
  } > RAM
}
