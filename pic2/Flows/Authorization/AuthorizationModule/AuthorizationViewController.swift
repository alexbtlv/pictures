//
//  AuthorizatioViewController.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class AuthorizationViewController: BaseViewController, AuthorizationViewInput, AuthorizationViewOutput {
    
    // MARK: Input
    var viewModel: AuthorizationViewModel?
    
    // MARK: Output
    var onSuccess: Action?
    
    //MARK: Outlets
    @IBOutlet private weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet private weak var passwordTextField: SkyFloatingLabelTextField! {
        didSet {
            passwordTextField.isSecureTextEntry = true
        }
    }
    @IBOutlet private weak var button: UIButton! {
        didSet {
            button.isHidden = true
        }
    }
    @IBOutlet private weak var infoLabel: UILabel! {
        didSet {
            infoLabel.numberOfLines = 0
            infoLabel.lineBreakMode = .byWordWrapping
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    // MARK: Private methods
    private func setupUI() {
        emailTextField.placeholder = viewModel?.emailPlaceholder
        passwordTextField.placeholder = viewModel?.passwordPlaceholder
        infoLabel.text = viewModel?.infoText
        button.setTitle(viewModel?.loginButtonTitle, for: .normal)
    }
    
    private func setupBindings() {
        emailTextField.rx.text.subscribe(onNext: { [weak self] (text) in
            guard let self = self, let text = text else { return }
            self.viewModel?.email.accept(text)
        }).disposed(by: disposeBag)
        
        passwordTextField.rx.text.subscribe(onNext: { [weak self] (text) in
            guard let self = self, let text = text else { return }
            self.viewModel?.password.accept(text)
        }).disposed(by: disposeBag)
        
        viewModel?.isValid.distinctUntilChanged().subscribe(onNext: { [weak self] (isValid) in
            UIView.animate(withDuration: 0.3) {
                self?.button.isEnabled = isValid
                self?.button.isHidden = !isValid
            }
        }).disposed(by: disposeBag)
        
        button.rx.tap.subscribe(onNext: { [weak self] in
            self?.onSuccess?()
        }).disposed(by: disposeBag)
    }
    
}
