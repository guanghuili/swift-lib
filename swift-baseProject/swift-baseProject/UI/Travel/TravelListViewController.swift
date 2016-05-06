//
//  TravelListViewController.swift
//  XingNang
//
//  Created by ligh on 16/4/13.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class TravelListViewController: UITableViewController {
    
    var travelPersentController:TravelPersentController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        travelPersentController = TravelPersentController(tableView: self.tableView)
        
        
        
    }

}
