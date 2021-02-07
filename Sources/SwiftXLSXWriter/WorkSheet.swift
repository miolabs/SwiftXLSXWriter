//
//  File.swift
//  
//
//  Created by Javier Segura Perez on 31/1/21.
//

import Foundation
import CXLSXWriter

public class WorkSheet
{
    let _worksheet: UnsafeMutablePointer<lxw_worksheet>
        
    init(_ worksheet: UnsafeMutablePointer<lxw_worksheet>) {
        self._worksheet = worksheet
    }
    
    public func write(_ value: Any?, row: UInt32, column: UInt16, format:WorkBookFormat? = nil) {
        if let as_string = value as? String { write(string: as_string, row: row, column: column, format: format) }
        if let as_number = value as? Double { write(number: as_number, row: row, column: column, format: format) }
    }
    
    public func write(string: String, row: UInt32, column: UInt16, format:WorkBookFormat? = nil) {
        let cString = string.cString(using: .utf8)
        worksheet_write_string(_worksheet, row, column, cString, format?.cFormat)
    }
    
    public func write(number: Any?, row: UInt32, column: UInt16, format:WorkBookFormat? = nil) {
        if number == nil { return }
        
        var value:Double? = nil
        
        if number is String { value = Double(number as! String) }
        if number is Double { value = number as? Double }
        
        
        if value != nil {
            worksheet_write_number(_worksheet, row, column, value!, format?.cFormat)
        }
    }
    
    public func setColumn(firstColumn:UInt16, lastColumn:UInt16, width:Double, format:WorkBookFormat?){
        worksheet_set_column(_worksheet, firstColumn, lastColumn, width, format?.cFormat)
    }
    
}
