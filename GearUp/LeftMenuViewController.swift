//
//  LeftMenuViewController.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 4/4/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case list
    case help
    case settings
}

protocol LeftMenuProtocol: class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftMenuViewController: UIViewController, LeftMenuProtocol {
    
    var tableView = UITableView()
    var menus = ["Browse", "List", "Help", "Settings"]
    var mainViewController: UIViewController!
    var profileViewController: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.27, blue:0.36, alpha:1.0)
        
        let viewSize:CGSize = self.view.frame.size;
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: viewSize.width-105, height: 110))
        newView.backgroundColor = UIColor(red:0.38, green:0.71, blue:0.89, alpha:1.0)
        let image = UIImage(named: "LorienBandhauer.jpg")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 15, y: 20, width: 60, height: 60)
        imageView.layer.borderWidth = 0.1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        newView.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 21))
        label.center = CGPoint(x: 155, y: 41)
        label.textAlignment = .center
        label.text = "Lorien Bandhauer"
        label.textColor = UIColor.white
        label.font = UIFont(name: "CircularStd-Bold", size: 17)
        newView.addSubview(label)
        
        let edit = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 21))
        edit.center = CGPoint(x: 115, y: 61)
        edit.textAlignment = .center
        edit.text = "edit profile"
        edit.textColor = UIColor.white
        edit.font = UIFont(name: "CircularStd-Book", size: 12)
        newView.addSubview(edit)

        
        var toAdjust:CGFloat!
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        if (UIDevice.current.userInterfaceIdiom == .phone && height == 667.0) {
            toAdjust = 90
        } else if (UIDevice.current.userInterfaceIdiom == .phone && height == 736.0) {
            toAdjust = 129
        }
        
        self.tableView.frame = CGRect(x: -15, y: 110, width: viewSize.width-toAdjust, height: viewSize.height)
        self.tableView.backgroundColor = UIColor(red:0.38, green:0.71, blue:0.89, alpha:1.0)
        self.tableView.separatorColor = UIColor.clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorInset = .zero
        self.tableView.layoutMargins = .zero
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.profileViewController = UINavigationController(rootViewController: profileViewController)
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        self.view.addSubview(self.tableView)
        self.view.addSubview(newView);
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LeftMenuViewController.handleTap(sender:)))
        newView.addGestureRecognizer(gesture)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let rightViewController = storyboard.instantiateViewController(withIdentifier: "RightMenuViewController") as! RightMenuViewController
            let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
            let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
            let slideMenuController = SlideController(mainViewController: nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
            self.slideMenuController()?.changeMainViewController(slideMenuController, close: true)
        case .list:
            self.slideMenuController()?.changeMainViewController(self.profileViewController, close: true)
        case .help: break
        case .settings: break
        }
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.slideMenuController()?.changeMainViewController(self.profileViewController, close: true)
    }
}

extension LeftMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = LeftMenu(rawValue: indexPath.item) {
            switch menu {
            case .main, .list, .help, .settings:
                return BaseTableViewCell.height()
            }
        }
        return 0
    }
}

extension LeftMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menus.count)
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let menu = LeftMenu(rawValue: indexPath.item) {
            switch menu {
            case .main, .list, .help, .settings:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.item) {
            self.changeViewController(menu)
        }
    }
}

extension LeftMenuViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            // future development
        }
    }
}
