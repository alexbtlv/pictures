//
//  ApplicationCoordinator.swift
//  pic1
//
//  Created by Alexander Batalov on 9/1/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

private enum LaunchInstructor {
    case main
    case auth
    
    static func configure(isAuthorized: Bool = false ) -> LaunchInstructor {
        if isAuthorized { return .main }
        return .auth
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    private var instructor: LaunchInstructor {
        if let isAuthorized = UserDefaults.standard.value(forKey: Constants.authorizedKey) as? Bool {
            return LaunchInstructor.configure(isAuthorized: isAuthorized)
        }
        return LaunchInstructor.configure(isAuthorized: false)
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runLoadingFlow()
    }
    
    private func runLoadingFlow() {
        let coordinator = coordinatorFactory.makeLoaderCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.runInstructor()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runInstructor() {
        switch instructor {
        case .auth: runAuthFlow()
        case .main: runMainFlow()
        }
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
        let coordinator = coordinatorFactory.makeMainCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
