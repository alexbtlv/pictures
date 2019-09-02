//
//  BaseViewController.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    // Utility `DisposeBag` used by the subclasses.
    
    let disposeBag = DisposeBag()
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTapBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        print("\(self.nameOfClass) deinit")
    }
    
    // MARK: - Public methods
    
    // MARK: - Gestures
    
    func handleTapBackground() {
        let tapBackground = UITapGestureRecognizer()
        tapBackground.cancelsTouchesInView = false
        tapBackground.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.view.endEditing(true)
            })
            .disposed(by: disposeBag)
        view.addGestureRecognizer(tapBackground)
    }
}

