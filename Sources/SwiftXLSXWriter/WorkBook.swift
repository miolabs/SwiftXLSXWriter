//
//  WorkBook.swift
//  
//
//  Created by Javier Segura Perez on 31/1/21.
//

import CXLSXWriter
import Foundation

public class WorkBook
{
    let filename:String
    
    let workbook:UnsafeMutablePointer<lxw_workbook>
    
    init(withFilename filename:String){
        self.filename = filename
        workbook = workbook_new(filename.cString(using: .utf8))
    }
}
