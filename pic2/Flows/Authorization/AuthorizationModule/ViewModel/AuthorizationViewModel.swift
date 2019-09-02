//
//  AuthorizatioViewModel.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class AuthorizationViewModel {
    
    // MARK: Private properties
    private let disposeBag = DisposeBag()
    
    // MARK: Public properties
    let emailPlaceholder = R.string.localizable.emailWord()
    let passwordPlaceholder = R.string.localizable.passwordWord()
    let infoText = R.string.localizable.authTip()
    let loginButtonTitle = R.string.localizable.loginWord()
    let email = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    let isValid = BehaviorRelay(value: false)
    
    init() {
        email.subscribe(onNext: { [weak self] _ in
            self?.validateData()
        }).disposed(by: disposeBag)
        
        password.subscribe(onNext: { [weak self] _ in
            self?.validateData()
        }).disposed(by: disposeBag)
    }
    
    private func validateData() {
        isValid.accept(
            email.value.isValidEmail() && password.value.count >= 6
        )
    }
}
