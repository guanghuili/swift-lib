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
        
        if let tempSortDescriptorMap = sortDescriptorMap
        {
            for (key,value) in tempSortDescriptorMap {
                
                sortDescriptorArray.append(NSSortDescriptor(key: key, ascending: value))
            }
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
    
    
    /**
        提取一个对象
    **/
    class func fetchObject(predicate:NSPredicate? = nil,sortDescriptorMap:[String:Bool]? = nil) ->AnyObject? {
        
        
        var request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName(self.className(), inManagedObjectContext: self.managedObjectContext())
        request.fetchLimit = 1 //设置只提取一个对象
        
        var sortDescriptorArray:[NSSortDescriptor] = []
        
        if let tempSortDescriptorMap = sortDescriptorMap
        {
            for (key,value) in tempSortDescriptorMap {
                
                sortDescriptorArray.append(NSSortDescriptor(key: key, ascending: value))
            }
        }
        
        request.sortDescriptors = sortDescriptorArray
        
        return self.managedObjectContext().executeFetchRequest(request, error: nil)?.last

    }
    
    
    class func fetchObject(predicateFormat:String,args: CVarArgType...) ->AnyObject? {
        
            var predicate = NSPredicate(format: predicateFormat, arguments: getVaList(args))
            return self.fetchObject(predicate: predicate)
    }
    
    
    /***
    **创建一个NSFetchedResultsController sortDescriptorMap 是必须要指定的
    */
    class func fetchedResultsController(predicate:NSPredicate? = nil,sortDescriptorMap:[String:Bool],delegate:NSFetchedResultsControllerDelegate? = nil) -> NSFetchedResultsController {
    
    
        var request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName(self.className(), inManagedObjectContext: self.managedObjectContext())
    
        var sortDescriptorArray:[NSSortDescriptor] = []
    
        for (key,value) in sortDescriptorMap {
        
            sortDescriptorArray.append(NSSortDescriptor(key: key, ascending: value))
        }
    
        request.sortDescriptors = sortDescriptorArray
    
    
       var fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext(), sectionNameKeyPath: nil, cacheName: self.className())
        fetchedResultsController.delegate = delegate
    
        return fetchedResultsController;
    }
    

    
    
    /**
    *
    * 生成当前对象 不持久化化到数据库
    *
    **/
    class func newObject() -> AnyObject?
    {
        NSLog("%@",self.className())
      return  NSEntityDescription.insertNewObjectForEntityForName(self.className(), inManagedObjectContext: self.managedObjectContext())
    }
    

    /**
    *
    * 生成当前对象 并持久化化到数据库
    *
    **/
    class func insertObject() -> AnyObject? {
        
        var newObject: AnyObject? = self.newObject()
        
        self.managedObjectContext().save(nil);
        
        return newObject
    }
    

     func save() {
        
    
        CoreDataManager.sharedCoreDataManager().managedObjectContext!.save(nil)
     }
    
    /**
    *
    * NSManagedObjectContext上下文
    *
    **/
    class func managedObjectContext() ->NSManagedObjectContext {
        
       return CoreDataManager.sharedCoreDataManager().managedObjectContext!;
    }
    
    
    class func className() ->String {
    
        var clazzName:NSString = NSStringFromClass(self) as NSString
        var dotIndex = clazzName.rangeOfString(".").location
        
        if(dotIndex == NSNotFound)
        {
            return NSStringFromClass(self)
        }
        
        NSLog("%d %@",dotIndex,clazzName)
        return clazzName.substringFromIndex(dotIndex)
        
    }
    
}