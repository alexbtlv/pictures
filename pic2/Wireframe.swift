//
//  Wireframe.swift
//  pic2
//
//  Created by Alexander Batalov on 11/17/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol Wireframe {
    func showAlert(title: String?, message: String?)
}

class DefaultWireframe: Wireframe {
    
    static let shared = DefaultWireframe()
    
    static func rootViewController() -> UIViewController {
        // cheating, I know
        var controller = UIApplication.shared.keyWindow!.rootViewController!
        while let presented = controller.presentedViewController {
            if presented is UIAlertController { break }
            controller = presented
        }
        return controller
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: R.string.localizable.okWord(), style: .default, handler: nil)
        alert.addAction(okAction)
        DefaultWireframe.rootViewController().present(alert, animated: true, completion: nil)
    }
}
