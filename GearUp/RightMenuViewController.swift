//
//  LeftMenuViewController.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 4/4/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

enum RightMenu: Int {
    case outdoors = 0
    case electronics
    case events
}

protocol RightMenuProtocol: class {
    func changeViewController(_ menu: RightMenu)
}

class RightMenuViewController: UIViewController, RightMenuProtocol {
    
    var tableView = UITableView()
    var menus = ["Outdoors", "Electronics", "Events"]
    var mainViewController: UIViewController!
    var profileViewController: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func changeViewController(_ menu: RightMenu) {
        switch menu {
        case .outdoors:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let rightViewController = storyboard.instantiateViewController(withIdentifier: "RightMenuViewController") as! RightMenuViewController
            let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
            let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
            let slideMenuController = SlideController(mainViewController: nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
            self.slideMenuController()?.changeMainViewController(slideMenuController, close: true)
        case .electronics:
            self.slideMenuController()?.changeMainViewController(self.profileViewController, close: true)
        case .events:
            break
            
        }
    }
}

extension RightMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = RightMenu(rawValue: indexPath.item) {
            switch menu {
            case .outdoors, .electronics, .events:
                return BaseTableViewCell.height()
            }
        }
        return 0
    }
}

extension RightMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menus.count)
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let menu = RightMenu(rawValue: indexPath.item) {
            switch menu {
            case .outdoors, .electronics, .events:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = RightMenu(rawValue: indexPath.item) {
            self.changeViewController(menu)
        }
    }
}

extension RightMenuViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            // future development
        }
    }
}

public extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
}
