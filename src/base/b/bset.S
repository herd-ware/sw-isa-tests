/*
 * File: bset.S
 * Created Date: 2023-02-26 09:08:32 pm
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2023-02-27 08:32:46 am
 * Modified By: Mathieu Escouteloup
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2023 HerdWare
 * -----
 * Description: 
 */


#include "../../common/macro.h"


// ******************************
//            INIT
// ******************************
TEST_INIT(0)

// ******************************
//             BODY
// ******************************
TEST_BODY
  li x10, 0
  li x11, 4
  bset x12, x10, x11  
  
// ******************************
//             END
// ******************************
TEST_RESTORE
TEST_END

// ******************************
//             DATA
// ******************************
