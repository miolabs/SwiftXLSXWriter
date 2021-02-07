//
//  WorkBookFormatAlign.swift
//  
//
//  Created by Javier Segura Perez on 7/2/21.
//

import Foundation
import CXLSXWriter

public enum WorkBookFormatAlignHorizontal:UInt8
{
    case none                   = 0
    case left                   = 1
    case center                 = 2
    case right                  = 3
    case fill                   = 4
    case justify                = 5
    case centerAcross           = 6
    case distributed            = 7
}

public enum WorkBookFormatAlignVertical:UInt8
{
    case verticalTop            = 8
    case verticalBottom         = 9
    case verticalCenter         = 10
    case verticalJustify        = 11
    case verticalDistributed    = 12
}

public class WorkBookFormatAlign
{
    public let horizontal:WorkBookFormatAlignHorizontal
    public let vertical:WorkBookFormatAlignVertical?
    
    public init(withHorizontalAlign horizontalAlign:WorkBookFormatAlignHorizontal, verticalAlign:WorkBookFormatAlignVertical?){
        horizontal = horizontalAlign
        vertical = verticalAlign
    }
}
