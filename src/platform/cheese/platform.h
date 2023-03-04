/*
 * File: platform.h
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-03-03 03:36:05 pm
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */


#define IO_PLTF_ADDR_GPIOA_ENO  0x1c004000
#define IO_PLTF_ADDR_GPIOA_REG  0x1c004004
#define IO_PLTF_ADDR_GPIOA_SET  0x1c004008
#define IO_PLTF_ADDR_GPIOA_RST  0x1c00400c
#define IO_PLTF_ADDR_GPIOB_ENO  0x1c004010
#define IO_PLTF_ADDR_GPIOB_REG  0x1c004014
#define IO_PLTF_ADDR_GPIOB_SET  0x1c004018
#define IO_PLTF_ADDR_GPIOB_RST  0x1c00401c

#define GPIOA_BIT_INSTRET 30
#define GPIOA_BIT_END     31