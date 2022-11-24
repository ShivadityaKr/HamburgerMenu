//
//  UINavigation.swift
//  HamburgerModule
//
//  Created by Shivaditya Kumar on 2022-11-24.
//

import Foundation
import UIKit

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: .main)
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
        let x = String(describing: viewController.self)
        let vc = self.instantiateViewController(withIdentifier: x) as? T
        vc?.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static func makeNavigationControllerAsRootVC( _ viewController: UIViewController) {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.setNavigationBarHidden(true, animated: false)
        navigation.modalPresentationStyle = .fullScreen
        AppDelegate.shared().window?.rootViewController = navigation
        AppDelegate.shared().window?.makeKeyAndVisible()
        
    }
}
extension UINavigationController {
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
}
