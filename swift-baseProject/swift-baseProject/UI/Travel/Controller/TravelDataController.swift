//
//  TravelDataController.swift
//  XingNang
//
//  Created by ligh on 16/4/13.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit
import CoreData

/// 行程数据控制器
class TravelDataController: CoreDataController {
    
//    override init() {
//        super.init()
//        self.objects = ["","",""]
//    }
    
    func insertTestData()  {
    
    
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
       let mangeedObject = NSEntityDescription.insertNewObjectForEntityForName("Travel", inManagedObjectContext: appDelegate.managedObjectContext)
        
        mangeedObject.setValue("杭州买房子杭州买房子杭州买房子杭州买房子杭州买房子杭州买房子杭州买房子", forKey: "name")
        
        try! appDelegate.managedObjectContext.save()
        
    }


}
