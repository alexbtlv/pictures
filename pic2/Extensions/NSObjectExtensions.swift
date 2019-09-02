//
//  NSObjectExtensions.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

extension NSObject {
    // swiftlint:disable missing_docs
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    // swiftlint:disable missing_docs
    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
    static var nibName: String {
        return String(describing: self)
    }
    
}
