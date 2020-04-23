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
    private let wireFrame: Wireframe
    
    init(with factory: MainModuleFactory, router: Router, wireFrame: Wireframe) {
        self.factory = factory
        self.router = router
        self.wireFrame = wireFrame
    }
    
    override func start() {
        showMainModule()
    }
    
    private func showMainModule() {
        let main = factory.makeMainModule()
        main.onErrorLoadingPhotos = { [weak self] message in
            let title = R.string.localizable.photosListNetworkingErrorTitle()
            self?.wireFrame.showAlert(title: title, message: message)
        }
        router.setRootModule(main)
    }
}

