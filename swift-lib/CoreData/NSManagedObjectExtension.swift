//
//  NSManagedObjectExtensions.swift
//  swift-lib
//
//  Created by ligh on 15/8/13.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    

    /**
    * 
    根据 NSPredicate 和 sortDescriptorMap[key,ascending] 查询实体
    *
    **/
    class func executeQuery(predicate:NSPredicate? = nil,sortDescriptorMap:[String:Bool]? = nil) -> [AnyObject]?{
    
        var request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName(self.className(), inManagedObjectContext: self.managedObjectContext())

        var sortDescriptorArray:[NSSortDescriptor] = []
        
        for (key,value) in sortDescriptorMap! {

            sortDescriptorArray.append(NSSortDescriptor(key: key, ascending: value))
        }
        
        request.sortDescriptors = sortDescriptorArray
        
        
       return self.managedObjectContext().executeFetchRequest(request, error: nil)
        
        
    }
    
    /**
    *
    根据 predicateFormat查询实体
    *
    **/
    class func executeQuery(predicateFormat:String,args: CVarArgType...)  -> [AnyObject]? {
        
        var predicate = NSPredicate(format: predicateFormat, arguments: getVaList(args))
        return self.executeQuery(predicate: predicate)
        
    }
    
    
    class func managedObjectContext() ->NSManagedObjectContext {
        
       return CoreDataManager.sharedCoreDataManager().managedObjectContext!;
    }
    
    
    class func className() ->String {
    
        return NSStringFromClass(self)
    }
    
}