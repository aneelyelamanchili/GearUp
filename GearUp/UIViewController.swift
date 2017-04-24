//
//  UIViewController.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 4/4/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "User")!)
        self.addRightBarButtonWithImage(UIImage(named: "Bars")!)
        //self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red:0.25, green:0.72, blue:0.91, alpha:1.0)
        //self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red:0.25, green:0.72, blue:0.91, alpha:1.0)
        //self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
        //self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
}
