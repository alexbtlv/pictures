//
//  CellInterface.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol CellInterface {
    
    static var id: String { get }
    static var cellNib: UINib { get }
    
}

extension CellInterface {
    
    static var id: String {
        return String(describing: Self.self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
    
}
