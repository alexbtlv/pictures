//
//  AuthorizatioViewOutput.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol AuthorizatioViewOutput: BaseView {
    var onSuccess: Action? { get set }
}
