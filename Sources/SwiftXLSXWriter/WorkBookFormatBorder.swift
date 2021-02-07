//
//  WorkBookFormatBorder.swift
//  
//
//  Created by Javier Segura Perez on 7/2/21.
//

import Foundation
import CXLSXWriter

public enum WorkBookFormatBorderStyle: UInt8
{
    case none
    case thin
    case medium
    case dashed
    case dotted
    case thick
    case double
    case hair
    case mediumDashed
    case dashDot
    case mediumDashDot
    case slantDashDot
}

public class WorkBookFormatBorder
{
    public var style:WorkBookFormatBorderStyle?
    public var color:WorkBookColor?
    
    public var top:WorkBookFormatBorderStyle?
    public var bottom:WorkBookFormatBorderStyle?
    public var left:WorkBookFormatBorderStyle?
    public var right:WorkBookFormatBorderStyle?
    
    public var topColor:WorkBookColor?
    public var bottomColor:WorkBookColor?
    public var leftColor:WorkBookColor?
    public var rightColor:WorkBookColor?

    public init(withStyle style:WorkBookFormatBorderStyle? = nil, color:WorkBookColor? = nil) {
        self.style = style
        self.color = color
    }
    
    public convenience init(top:WorkBookFormatBorderStyle? = nil, bottom:WorkBookFormatBorderStyle? = nil, left:WorkBookFormatBorderStyle? = nil, right:WorkBookFormatBorderStyle? = nil, color:WorkBookColor? = nil){
        self.init(color:color)
        self.top = top
        self.bottom = bottom
        self.left = left
        self.right = right
        self.color = color
    }
    
    public convenience init(top:WorkBookFormatBorderStyle? = nil, topColor:WorkBookColor? = nil, bottom:WorkBookFormatBorderStyle? = nil, bottomColor:WorkBookColor? = nil, left:WorkBookFormatBorderStyle? = nil, leftColor:WorkBookColor? = nil, right:WorkBookFormatBorderStyle? = nil, rightColor:WorkBookColor? = nil){
        self.init()
        
        self.top = top
        self.bottom = bottom
        self.left = left
        self.right = right
        
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.leftColor = leftColor
        self.rightColor = rightColor
    }

}
