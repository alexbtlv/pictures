//
//  BaseCoordinator.swift
//  pic1
//
//  Created by Alexander Batalov on 9/1/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

class BaseCoordinator: Coordinatable {
    
    var childCoordinators: [Coordinatable] = []
    
    // MARK: - Coordinatable
    
    var finishFlow: Action?
    func start() {}
    
    /// Utility `DisposeBag` used by the subclasses.
    let disposeBag = DisposeBag()
    
    // add only unique object
    func addDependency(_ coordinator: Coordinatable) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    // MARK: - Life Cycle
    
    deinit {
        print("BaseCoordinator deinit")
    }
}
