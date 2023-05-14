//
//  NSObject+Extensions.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: self)
    }
}
