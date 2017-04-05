//
//  ProfileViewController.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 4/4/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

class ProfileVIewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let logo = UIImage(named: "Logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
//        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
//        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    
}
