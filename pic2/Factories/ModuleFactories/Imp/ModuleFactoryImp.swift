//
//  ModuleFactoryImp.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class ModuleFactoryImp: ModuleFactoryList {
    
    // MARK: - LoaderModuleFactory
    
    func makeLoaderModule() -> LoadingViewInput & LoadingViewOutput {
        return LoadingViewController.controllerFromStoryboard(.main)
    }
    
    // MARK: - AuthModuleFactory
    
    func makeAuthModule() -> AuthorizationViewInput & AuthorizationViewOutput {
        return AuthorizationViewController.controllerFromStoryboard(.auth)
    }
}
