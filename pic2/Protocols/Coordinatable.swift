//
//  Coordinatable.swift
//  pic1
//
//  Created by Alexander Batalov on 9/1/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol Coordinatable: class {
    var finishFlow: Action? { get set }
    func start()
}
