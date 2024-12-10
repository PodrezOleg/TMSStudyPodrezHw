//
//  FadeInAnimationViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class FadeInAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
     
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        toView.alpha = 0
        
        containerView.addSubview(toView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.alpha = 1
        }) { completed in
            transitionContext.completeTransition(completed)
        }
    }
}
