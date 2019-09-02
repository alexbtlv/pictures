//
//  AuthCoordinator.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class AuthenticationCoordinator: BaseCoordinator {
    
    private let factory: AuthModuleFactory
    private let router: Router
    
    init(with factory: AuthModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        runAuthModule()
    }
    
    private func runAuthModule() {
        var view = factory.makeAuthModule()
        view.viewModel = AuthorizationViewModel()
        view.onSuccess = { [weak self] in
            print("authorized")
//            self?.finishFlow?()
        }
        router.setRootModule(view)
    }
}
