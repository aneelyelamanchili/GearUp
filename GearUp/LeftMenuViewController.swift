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
    case profile
}

protocol LeftMenuProtocol: class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftMenuViewController: UIViewController, LeftMenuProtocol {
    
    var tableView = UITableView()
    var menus = ["Main", "Profile"]
    var mainViewController: UIViewController!
    var profileViewController: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.15, green:0.27, blue:0.36, alpha:1.0)
        
        let viewSize:CGSize = self.view.frame.size;
        
        var toAdjust:CGFloat!
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        if (UIDevice.current.userInterfaceIdiom == .phone && height == 667.0) {
            toAdjust = 105
        } else if (UIDevice.current.userInterfaceIdiom == .phone && height == 736.0) {
            toAdjust = 144
        }
        
        self.tableView.frame = CGRect(x: 0, y: 0, width: viewSize.width-toAdjust, height: viewSize.height)
        self.tableView.separatorColor = UIColor.clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.profileViewController = UINavigationController(rootViewController: profileViewController)
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        self.view.addSubview(self.tableView)
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
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .profile:
            self.slideMenuController()?.changeMainViewController(self.profileViewController, close: true)
            
        }
    }
}

extension LeftMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = LeftMenu(rawValue: indexPath.item) {
            switch menu {
            case .main, .profile:
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
            case .main, .profile:
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
