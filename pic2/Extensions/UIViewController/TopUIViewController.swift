//
//  TopUIViewController.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

protocol TopUIViewController {
    func topUIViewController() -> UIViewController?
}

extension UIWindow : TopUIViewController {
    func topUIViewController() -> UIViewController? {
        if let rootViewController = self.rootViewController {
            return self.recursiveTopUIViewController(from: rootViewController)
        }
        
        return nil
    }
    
    private func recursiveTopUIViewController(from: UIViewController?) -> UIViewController? {
        if let topVC = from?.topUIViewController() { return recursiveTopUIViewController(from: topVC) ?? from }
        return from
    }
}

extension UIViewController : TopUIViewController {
    @objc open func topUIViewController() -> UIViewController? {
        return self.presentedViewController
    }
}

extension UINavigationController {
    override open func topUIViewController() -> UIViewController? {
        return self.visibleViewController
    }
}

extension UITabBarController {
    override open func topUIViewController() -> UIViewController? {
        return self.selectedViewController ?? presentedViewController
    }
}

