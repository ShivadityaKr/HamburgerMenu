//
//  AppDelegate.swift
//  HamburgerModule
//
//  Created by Shivaditya Kumar on 2022-11-24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    class func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

