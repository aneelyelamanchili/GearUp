//
//  BaseTableViewCell.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 4/4/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

open class BaseTableViewCell : UITableViewCell {
    class var identifier: String { return String.className(self) }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    open override func awakeFromNib() {
    }
    
    open func setup() {
        print("hello setup")
    }
    
    open class func height() -> CGFloat {
        return 70
    }
    
    open func setData(_ data: Any?) {
        //self.backgroundColor = UIColor(red:0.96, green:0.98, blue:0.93, alpha:1.00)
        //self.backgroundColor = UIColor(red:0.25, green:0.72, blue:0.91, alpha:1.0)
        self.backgroundColor = UIColor(red:0.38, green:0.71, blue:0.89, alpha:1.0)
        self.textLabel?.textColor = UIColor.white
        self.textLabel?.font = UIFont(name: "CircularStd-Bold", size: 17)
        //self.textLabel?.textColor = UIColor(red:0.68, green:0.68, blue:0.68, alpha:1.00)
        if let menuText = data as? String {
            self.textLabel?.text = menuText
        }
        
        if(data as? String == "Browse") {
            let image : UIImage = UIImage(named: "Browse")!
            self.imageView?.image = image
        } else if(data as? String == "List") {
            let image : UIImage = UIImage(named: "List")!
            self.imageView?.image = image
        } else if(data as? String == "Help") {
            let image : UIImage = UIImage(named: "Help")!
            self.imageView?.image = image
        } else if(data as? String == "Settings") {
            let image : UIImage = UIImage(named: "Settings")!
            self.imageView?.image = image
        } else if(data as? String == "Outdoors") {
            let image : UIImage = UIImage(named: "Outdoors")!
            self.imageView?.image = image
        } else if(data as? String == "Electronics") {
            let image : UIImage = UIImage(named: "Electronics")!
            self.imageView?.image = image
        } else if(data as? String == "Events") {
            let image : UIImage = UIImage(named: "Events")!
            self.imageView?.image = image
        }


    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    // ignore the default handling
    override open func setSelected(_ selected: Bool, animated: Bool) {
    }
    
}

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.characters.count
    }
}
