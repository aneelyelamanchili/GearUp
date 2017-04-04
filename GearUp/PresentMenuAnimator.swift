//
//  PresentMenuAnimator.swift
//  GearUp
//
//  Created by Jordan Coppert on 4/3/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

class PresentMenuAnimator : NSObject {
}

extension PresentMenuAnimator : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let containerView = transitionContext.containerView()
            else {
                return
        }
        // more code goes here
    }
}
