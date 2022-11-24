//
//  DrawerTransitionManager.swift
//  HamburgerModule
//
//  Created by Shivaditya Kumar on 2022-11-24.
//

import UIKit

class DrawerTransitionManager: NSObject, UIViewControllerTransitioningDelegate {

    let slideAnimation = DrawerSlideAnimation()
    var presentationType : PresentationType = .right
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let drawerPresentationController = DrawerPresentationController(presentedViewController: presented, presenting: presenting, presentationType: self.presentationType)
        return drawerPresentationController
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideAnimation.isPresenting = true
        slideAnimation.presentationType = self.presentationType
        return slideAnimation
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideAnimation.isPresenting = false
        return slideAnimation
    }
}
