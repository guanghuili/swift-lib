//
//  TravelPersentController.swift
//  XingNang
//
//  Created by ligh on 16/4/13.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit
import CoreData


/// 行程数据呈现
class TravelPersentController: TableViewPersentController {

    
    
    override init(tableView: UITableView) {
        super.init(tableView: tableView)
        self.tableView.separatorStyle = .None
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        let travelControler = TravelDataController(entityName: "Travel", sortDescriptor: NSSortDescriptor(key: "name", ascending: true),sectionName:"name")

        self.dataController = travelControler
        
        travelControler.loadData()
     
        
        
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataController!.numberOfSections()
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return  self.dataController?.sectionTitleAtSection(section)
    }
    
    override func cellIdentifierAtIndexPath(indexPath: NSIndexPath) -> String {
        return  indexPath.row == 0 ? "RecentTravelCell" : "TravelCell"
    }
    
}



