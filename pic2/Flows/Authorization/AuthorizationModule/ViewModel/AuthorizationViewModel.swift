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
    let isValid: Observable<Bool>
    
    init() {
        isValid = Observable.combineLatest(email.asObservable(), password.asObservable()).map({ (email, pass) in
            email.isValidEmail() && pass.count >= 6
        })
    }
}
