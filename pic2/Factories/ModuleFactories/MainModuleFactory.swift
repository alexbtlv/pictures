//
//  MainModuleFactory.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol MainModuleFactory {
    func makeMainModule() -> MainViewInput & MainViewOutput
}
