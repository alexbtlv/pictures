//
//  CoordinatorFactory.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//


protocol CoordinatorFactory {
    func makeLoaderCoordinator(router: Router) -> Coordinatable
    func makeAuthCoordinator(router: Router) -> Coordinatable
//    func makeMainCoordinator(router: Router) -> Coordinatable
}
