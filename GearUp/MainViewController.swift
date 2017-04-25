//
//  MainViewController.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 4/4/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var rentButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rentButton.layer.cornerRadius = 10
        rentButton.layer.borderWidth = 1
        rentButton.layer.borderColor = UIColor.clear.cgColor
        rentButton.titleLabel?.font = UIFont(name: "CircularStd-Bold", size: 25)
        
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = 8.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.clipsToBounds = true
        
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        itemTitle.textColor = UIColor(red:0.38, green:0.71, blue:0.89, alpha:1.0)
        cost.textColor = UIColor(red:0.04, green:0.02, blue:0.40, alpha:1.0)
        usernameLabel.textColor = UIColor(red:0.04, green:0.02, blue:0.40, alpha:1.0)
        
        itemTitle.font = UIFont(name: "CircularStd-Bold", size: 28)
        cost.font = UIFont(name: "CircularStd-Bold", size: 17)
        usernameLabel.font = UIFont(name: "CircularStd-Bold", size: 19)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIImageView
{
    func roundCornersForAspectFit(radius: CGFloat)
    {
        if let image = self.image {
            
            //calculate drawingRect
            let boundsScale = self.bounds.size.width / self.bounds.size.height
            let imageScale = image.size.width / image.size.height
            
            var drawingRect : CGRect = self.bounds
            
            if boundsScale > imageScale {
                drawingRect.size.width =  drawingRect.size.height * imageScale
                drawingRect.origin.x = (self.bounds.size.width - drawingRect.size.width) / 2
            }else{
                drawingRect.size.height = drawingRect.size.width / imageScale
                drawingRect.origin.y = (self.bounds.size.height - drawingRect.size.height) / 2
            }
            let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
