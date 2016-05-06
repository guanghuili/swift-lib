//
//  ListDataController.swift
//  XingNang
//
//  Created by ligh on 16/4/12.
//  Copyright © 2016年 ligh. All rights reserved.
//


import UIKit

/* 适用于UITableViewDataSource
 */
protocol ListDataController: DataController {
    
    /**
     获取指定位置的data
     
     - parameter index: 索引
     
     - returns: 在index位置的data
     */
    func dataAtIndex(index:Int) -> AnyObject?
    func dataAtIndexPath(indexPath:NSIndexPath) -> AnyObject?
    func datasAtSection(section:Int) ->DataObjects?
    func dataObjects() ->DataObjects?
    
    func sectionTitleAtSection(section:Int) -> String?
    
    func numberOfSections() -> Int
    func numberOfObjectsInSection(section:Int) ->Int
    
    
    

}



