//
//  LoaderCoordinator.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class LoaderCoordinator: BaseCoordinator {
    
    private let factory: LoaderModuleFactory
    private let router: Router
    
    init(with factory: LoaderModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLoaderModule()
        loadSomething()
    }
    
    private func showLoaderModule() {
        let loader = factory.makeLoaderModule()
        router.setRootModule(loader)
    }
    
    private func loadSomething() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.finishFlow?()
        }
    }
}
