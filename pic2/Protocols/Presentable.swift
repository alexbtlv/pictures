//
//  Presentable.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
