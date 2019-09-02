//
//  Dependencies.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

import IQKeyboardManagerSwift
import SVProgressHUD

class Dependencies {
    
    static let sharedDependencies = Dependencies()
    
    let keyboardManager = IQKeyboardManager.shared
//    let provider: MoyaProvider<APIProvider>
    
    private init() {
        keyboardManager.enable = true
//        provider = MoyaProvider<APIProvider>()
        SVProgressHUD.setDefaultMaskType(.clear)
    }
}
