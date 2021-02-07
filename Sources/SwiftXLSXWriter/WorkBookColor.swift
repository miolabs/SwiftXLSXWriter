//
//  WorkBookColor.swift
//  
//
//  Created by Javier Segura Perez on 31/1/21.
//

import Foundation
import CXLSXWriter

public enum WorkBookRGBColor:UInt32
{
    case black   = 0x1000000
    case blue    = 0x0000FF
    case brown   = 0x800000
    case cyan    = 0x00FFFF
    case gray    = 0x808080
    case green   = 0x008000
    case lime    = 0x00FF00
    case magenta = 0xFF00FF
    case navy    = 0x000080
    case orange  = 0xFF6600
//    case pink    = 0xFF00FF
    case purple  = 0x800080
    case red     = 0xFF0000
    case silver  = 0xC0C0C0
    case white   = 0xFFFFFF
    case yellow  = 0xFFFF00
}


public class WorkBookColor
{
    var _value:UInt32 = 0
    internal var rgb:UInt32 { get { return _value } }
    
    public init(withRed red:UInt8, green:UInt8, blue:UInt8) {
        let rgb:UInt32 = (UInt32(red) << 16 ) + (UInt32(green) << 8) + UInt32(blue)
        _value = rgb
    }

    public init(color: WorkBookRGBColor) {
        _value = color.rawValue
    }
    
    public init(rgb: UInt32) {
        _value = rgb
    }
    
}

extension WorkBookColor
{
    static var black:WorkBookColor { get { return WorkBookColor(color: .black) } }
    static var blue:WorkBookColor { get { return WorkBookColor(color: .blue) } }
    static var brown:WorkBookColor { get { return WorkBookColor(color: .brown) } }
    static var cyan:WorkBookColor { get { return WorkBookColor(color: .cyan) } }
    static var gray:WorkBookColor { get { return WorkBookColor(color: .gray) } }
    static var green:WorkBookColor { get { return WorkBookColor(color: .green) } }
    static var lime:WorkBookColor { get { return WorkBookColor(color: .lime) } }
    static var magenta:WorkBookColor { get { return WorkBookColor(color: .magenta) } }
    static var navy:WorkBookColor { get { return WorkBookColor(color: .navy) } }
    static var orange:WorkBookColor { get { return WorkBookColor(color: .orange) } }
    static var purple:WorkBookColor { get { return WorkBookColor(color: .purple) } }
    static var red:WorkBookColor { get { return WorkBookColor(color: .red) } }
    static var silver:WorkBookColor { get { return WorkBookColor(color: .silver) } }
    static var white:WorkBookColor { get { return WorkBookColor(color: .white) } }
    static var yellow:WorkBookColor { get { return WorkBookColor(color: .yellow) } }
    
}
