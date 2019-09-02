//
//  Router.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol Router: Presentable {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: Action?)
    
    func popModule()
    func popModule(animated: Bool)
    func popModule(to module: Presentable?)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: Action?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}
