//
//  LoaderCoordinator.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

class LoaderCoordinator: BaseCoordinator {
    
    private let factory: LoaderModuleFactory
    private let router: Router
    
    private var loaderModule: (LoadingViewInput & LoadingViewOutput)?
    
    init(with factory: LoaderModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLoaderModule()
    }
    
    private func showLoaderModule() {
        loaderModule = factory.makeLoaderModule()
        router.setRootModule(loaderModule)
    }
}
