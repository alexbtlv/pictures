//
//  MainCoordinator.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class MainCoordinator: BaseCoordinator {
    
    private let factory: MainModuleFactory
    private let router: Router
    
    init(with factory: MainModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showMainModule()
    }
    
    private func showMainModule() {
        var view = factory.makeMainModule()
        view.viewModel = MainViewModel()
        router.setRootModule(view)
    }
}

