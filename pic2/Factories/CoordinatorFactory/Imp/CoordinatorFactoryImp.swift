//
//  CoordinatorFactoryImp.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeLoaderCoordinator(router: Router) -> Coordinatable {
        return LoaderCoordinator(with: ModuleFactoryImp(), router: router)
    }
    
    func makeAuthCoordinator(router: Router) -> Coordinatable {
        return AuthenticationCoordinator(with: ModuleFactoryImp(), router: router)
    }
    
    func makeMainCoordinator(router: Router) -> Coordinatable {
        return MainCoordinator(with: ModuleFactoryImp(), router: router)
    }
    
    // MARK: - Private methods
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return CustomNavigationController.controllerFromStoryboard(.main)
        }
    }
    
}
