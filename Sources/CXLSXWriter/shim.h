//
//  shim.h
//  swift-clibslsxwriter
//
//  Created by Javier Segura Perez on 31/1/21.
//

#ifndef CLIB_SWIFT_XLSXWRITER
#define CLIB_SWIFT_XLSXWRITER

#ifdef __APPLE__
    #include "/usr/local/include/xlsxwriter.h"
#else
    #include "/usr/include/xlsxwriter.h"
#endif

#endif /* shim.h */
