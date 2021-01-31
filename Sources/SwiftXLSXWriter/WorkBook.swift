//
//  WorkBook.swift
//  
//
//  Created by Javier Segura Perez on 31/1/21.
//

import Foundation
import CXLSXWriter

public class WorkBook
{
    let filename:String
    
    let _locale:String?
    public var locale:String? { get { return _locale } }
    
    let _workbook:UnsafeMutablePointer<lxw_workbook>

    public init(withFilename filename:String, locale:String? = nil){
        self.filename = filename
        _locale = locale
        _workbook = workbook_new(filename.cString(using: .utf8))
    }
    
    public func close(){
        workbook_close(_workbook)
    }
    
    public func addWorksheet(withName name:String?) -> WorkSheet {
        let ws = workbook_add_worksheet(_workbook, name)
        return WorkSheet(ws!)
    }
    
    public func addFormat(bold:Bool = false, locale:String? = nil, formatType:WorkBookFormatType = .string, fontSize:Double? = nil, fontColor:WorkBookColor? = nil ) -> WorkBookFormat {
        let f = workbook_add_format(_workbook)        
        return WorkBookFormat(f!, bold: bold, locale: locale, formatType: formatType, fontSize: fontSize, fontColor: fontColor)
    }

}
