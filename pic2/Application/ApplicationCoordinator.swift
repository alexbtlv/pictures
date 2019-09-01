//
//  ApplicationCoordinator.swift
//  pic1
//
//  Created by Alexander Batalov on 9/1/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

private enum LaunchInstructor {
    case main, auth
    
    static func configure(isAuthorized: Bool = false ) -> LaunchInstructor {
        switch (isAuthorized) {
        case false: return .auth
        case true: return .main
        }
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let tokenAccessable: TokenAccessable
    private let router: Router
    
    private var instructor: LaunchInstructor {
        //        return LaunchInstructor.configure(isAuthorized: self.tokenAccessable.token != nil)
        return LaunchInstructor.configure(isAuthorized: true)
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, tokenAccessable: TokenAccessable) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.tokenAccessable = tokenAccessable
    }
    
    override func start() {
        runLoadingFlow()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeMenuCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
