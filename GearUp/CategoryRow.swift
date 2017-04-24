//
//  CategoryRow.swift
//  GearUp
//
//  Created by Jordan Coppert on 4/3/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

class CategoryRow : UITableViewCell {
    @IBOutlet weak var seeAll: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
     var sectionName:String?
}

extension CategoryRow : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(sectionName == "Newly Added") {
            return 9
        }
        else if(sectionName == "Outdoors") {
            return 3
        } else if(sectionName == "Electronics") {
            return 3
        } else if(sectionName == "Events") {
            return 3
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listingCell", for: indexPath) as! ListingCell
        
        if(sectionName == "Newly Added") {
            cell.configureNew(index: indexPath.row)
        }
        else if(sectionName == "Outdoors") {
            cell.configureOutdoors(index: indexPath.row)
        } else if(sectionName == "Electronics") {
            cell.configureElectronics(index: indexPath.row)
        } else if(sectionName == "Events") {
            cell.configureEvents(index: indexPath.row)
        }
        seeAll.tintColor = UIColor(red:0.04, green:0.02, blue:0.40, alpha:1.0)
        seeAll.titleLabel?.font = UIFont(name: "CircularStd-Book", size: 17)
        return cell
    }
    
}

extension CategoryRow : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 2
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
