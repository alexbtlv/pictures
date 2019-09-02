//
//  AuthorizatioViewOutput.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol AuthorizationViewOutput: BaseView {
    var onSuccess: Action? { get set }
}
