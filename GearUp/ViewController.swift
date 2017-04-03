//
//  ViewController.swift
//  GearUp
//
//  Created by Aneel Yelamanchili on 3/24/17.
//  Copyright © 2017 Aneel Yelamanchili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var categories = ["Newly Added", "Outdoors", "Electronics", "Events/Parties"]
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
        return cell
    }


}

