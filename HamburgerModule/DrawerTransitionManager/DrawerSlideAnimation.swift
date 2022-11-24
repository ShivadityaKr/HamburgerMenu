//
//  UIDrawerSlideAnimationNavigation.swift
//  HamburgerModule
//
//  Created by Shivaditya Kumar on 2022-11-24.
//

import UIKit

class DrawerSlideAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    var presentationType: PresentationType = .right
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let key: UITransitionContextViewControllerKey = isPresenting ? .to : .from
        guard let presentedController = transitionContext.viewController(forKey: key) else {
            return
        }
        let containerView = transitionContext.containerView
        let presentedFrame = transitionContext.finalFrame(for: presentedController)
        var dismissedFrame: CGRect
        switch self.presentationType {
        case .left:
            dismissedFrame = presentedFrame.offsetBy(dx: -presentedFrame.width, dy: 0)
        case .right:
            dismissedFrame = presentedFrame.offsetBy(dx: presentedFrame.width, dy: 0)
        }
        if isPresenting {
            containerView.addSubview(presentedController.view)
        }
        let duration = transitionDuration(using: transitionContext)
        let wasCancelled = transitionContext.transitionWasCancelled
        let fromFrame = isPresenting ? dismissedFrame : presentedFrame
        let toFrame = isPresenting ? presentedFrame : dismissedFrame
        presentedController.view.frame = fromFrame
        UIView.animate(withDuration: duration) {
            presentedController.view.frame = toFrame
        } completion: { (_) in
            transitionContext.completeTransition(!wasCancelled)
        }
    }
}
enum PresentationType {
    case left
    case right
}
