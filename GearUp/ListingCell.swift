//
//  ListingCell.swift
//  GearUp
//
//  Created by Jordan Coppert on 4/3/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

class ListingCell : UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    func configureNew(index: Int) {
        var img : UIImage? = nil
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        
        if(index == 0) {
            img = UIImage(named: "Cell-imagesArtboard 1@3x.png")!
        } else if(index == 1) {
            img = UIImage(named: "Cell-imagesArtboard 2@3x.png")!
        } else if(index == 2) {
            img = UIImage(named: "Cell-imagesArtboard 3@3x.png")!
        } else if(index == 3) {
            img = UIImage(named: "Cell-imagesArtboard 11@3x.png")!
        } else if(index == 4) {
            img = UIImage(named: "Cell-imagesArtboard 17@3x.png")!
        } else if(index == 5) {
            img = UIImage(named: "Cell-imagesArtboard 12@3x.png")!
        } else if(index == 6) {
            img = UIImage(named: "Cell-imagesArtboard 7@3x.png")!
        } else if(index == 7) {
            img = UIImage(named: "Cell-imagesArtboard 6@3x.png")!
        } else if(index == 8) {
            img = UIImage(named: "Cell-imagesArtboard 16@3x.png")!
        }
        
        imageView.image = img

    }
    
    func configureElectronics(index: Int) {
//        name.textColor = UIColor(red:0.04, green:0.02, blue:0.40, alpha:1.0)
//        name.font = UIFont(name: "CircularStd-Bold", size: 17)
//        let url = URL(string: "https://s-media-cache-ak0.pinimg.com/736x/91/76/be/9176bedb96b6eb2e9cfb330e89411a40.jpg");
//        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        var img : UIImage? = nil
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        
        if(index == 0) {
            img = UIImage(named: "Cell-imagesArtboard 1@3x.png")!
        } else if(index == 1) {
            img = UIImage(named: "Cell-imagesArtboard 2@3x.png")!
        } else if(index == 2) {
            img = UIImage(named: "Cell-imagesArtboard 3@3x.png")!
        }

        imageView.image = img
    }
    
    func configureOutdoors(index: Int) {
//        name.textColor = UIColor(red:0.04, green:0.02, blue:0.40, alpha:1.0)
//        name.font = UIFont(name: "CircularStd-Bold", size: 17)
        var img : UIImage? = nil
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        
        if(index == 0) {
            img = UIImage(named: "Cell-imagesArtboard 11@3x.png")!
        } else if(index == 1) {
            img = UIImage(named: "Cell-imagesArtboard 16@3x.png")!
        } else if(index == 2) {
            img = UIImage(named: "Cell-imagesArtboard 12@3x.png")!
        }
        
        imageView.image = img
    }

    func configureEvents(index: Int) {
//        name.textColor = UIColor(red:0.04, green:0.02, blue:0.40, alpha:1.0)
//        name.font = UIFont(name: "CircularStd-Bold", size: 17)
        var img : UIImage? = nil
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        
        if(index == 0) {
            img = UIImage(named: "Cell-imagesArtboard 6@3x.png")!
        } else if(index == 1) {
            img = UIImage(named: "Cell-imagesArtboard 7@3x.png")!
        } else if(index == 2) {
            img = UIImage(named: "Cell-imagesArtboard 17@3x.png")!
        }
        
        imageView.image = img
    }    

    
}
