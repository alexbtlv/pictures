//
//  AuthorizatioViewController.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class AuthorizatioViewController: BaseViewController, AuthorizatioViewInput, AuthorizatioViewOutput {
    
    // MARK: Input
    var viewModel: AuthorizatioViewModel?
    
    // MARK: Output
    var onSuccess: Action?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
