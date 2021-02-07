//
//  File.swift
//  
//
//  Created by Javier Segura Perez on 31/1/21.
//

import Foundation
import CXLSXWriter

public enum WorkBookFormatType:UInt8
{
    case string   = 0
    case currency = 1
    case number   = 2
    case integer  = 3
    case float    = 4
    case decimal  = 5
}

public enum WorkBookNumberFormatType:UInt8
{
    case none     = 0
    case currency = 1
    case number   = 2
    case integer  = 3
    case float    = 4
    case decimal  = 5
}

public class WorkBookFormat
{
    let _format:UnsafeMutablePointer<lxw_format>
    internal var cFormat:UnsafeMutablePointer<lxw_format> { get { _format } }
     
    var _formatType:WorkBookFormatType = .string
    public var formatType:WorkBookFormatType { get { return _formatType } }
    
    let _locale:String?
    init(_ format:UnsafeMutablePointer<lxw_format>, locale:String? =  nil, formatType:WorkBookFormatType = .string) {
        _locale = locale
        _formatType = formatType
        _format = format
    }
    
    
    var _isBold:Bool = false
    public var isBold:Bool { get { return _isBold } }
    public func setBold(){
        _isBold = true
        format_set_bold(_format)
    }
    
    var _numberFormatType = WorkBookNumberFormatType.none
    public var numberFormatType:WorkBookNumberFormatType { get { return _numberFormatType } }
    public func setNumberFormatType(type:WorkBookNumberFormatType) {
        if type == .none { return }
        _numberFormatType = type
        
        var format:String = "#,##0.00"
        if type == .integer {
            format = "#,##0"
        }
                
        if type == .currency {
            format = WorkBookFormat.localCurrencySymbolFormat(format: format, locale: _locale)
        }
        
        setNumberFormat(format: format)
    }
    
    public func setNumberFormat(format:String) {
        format_set_num_format(_format, format.cString(using: .utf8))
    }
        
    public func setFontColor(color: WorkBookColor) {
        format_set_font_color(_format, color.rgb)
    }
    
    var _fontSize:Double = 12
    public var fontSize:Double { get { return _fontSize } }
    public func setFontSize(size:Double){
        _fontSize = size
        format_set_font_size(_format, size)
    }

}

extension WorkBookFormat
{
    convenience init(_ format:UnsafeMutablePointer<lxw_format>, bold:Bool = false, locale:String? = nil, formatType:WorkBookFormatType = .string, fontSize:Double?, fontColor: WorkBookColor?) {
        self.init(format, locale: locale, formatType: formatType)
        
        if bold == true { setBold() }
        
        if formatType == .currency || formatType == .decimal || formatType == .float || formatType == .integer {
            setNumberFormatType(type: WorkBookNumberFormatType(rawValue: formatType.rawValue)!)
        }
        
        if fontSize != nil { setFontSize(size: fontSize!) }
        
        if fontColor != nil { setFontColor(color: fontColor!) }
    }
}


extension WorkBookFormat
{
    static func localCurrencySymbolFormat(format:String, locale:String?) -> String {
        if locale == nil { return format }
        
        let split = locale!.components(separatedBy: "_")
        if split.count < 2 { return format }
        let country = split[1]
        
        switch country {
        case "ES", "NL": return format + " €"
        case "US": return "$" + format
        default: return format
        }
    }
}

