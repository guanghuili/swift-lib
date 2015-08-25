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
    
        var request = self.fetchRequest(predicate: predicate, sortDescriptorMap: sortDescriptorMap)
        
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
        
        
        var request = self.fetchRequest(predicate: predicate, sortDescriptorMap: sortDescriptorMap)
        request.fetchLimit = 1 //设置只提取一个对象
        
        return self.managedObjectContext().executeFetchRequest(request, error: nil)?.last

    }
    
    
    class func fetchObject(predicateFormat:String,args: CVarArgType...) ->AnyObject? {
        
            var predicate = NSPredicate(format: predicateFormat, arguments: getVaList(args))
            return self.fetchObject(predicate: predicate)
    }
    
    /**
        MAX
    **/
    class func fetchObject(#maxKey:String) -> AnyObject? {
        
       return  self.fetchObject(predicate: NSPredicate(format: maxKey+"==max("+maxKey+")"), sortDescriptorMap: [maxKey:false])
    }
    
    /**
        MIN
    **/
    class func fetchObject(#minKey:String) -> AnyObject? {
        
        return  self.fetchObject(predicate: NSPredicate(format: minKey+"==min("+minKey+")"), sortDescriptorMap: [minKey:false])
    }
    
    
    /***
    **创建一个NSFetchedResultsController sortDescriptorMap 是必须要指定的
    */
    class func fetchedResultsController(predicate:NSPredicate? = nil,sortDescriptorMap:[String:Bool]?=nil,delegate:NSFetchedResultsControllerDelegate? = nil) -> NSFetchedResultsController {
    
    
       var request = self.fetchRequest(predicate: predicate, sortDescriptorMap: sortDescriptorMap)
        
       var fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext(), sectionNameKeyPath: nil, cacheName: self.className())
        fetchedResultsController.delegate = delegate
        
        //这个必须调用
        fetchedResultsController.performFetch(nil)
    
        return fetchedResultsController;
    }
    

    
    
    /**
    *
    * 生成当前对象 不持久化化到数据库
    *
    **/
    class func newObject() -> AnyObject?
    {
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
    

    /**
        保存managedObjectContext中 为持久化的对象
    **/
     func save() {
    
        CoreDataManager.sharedCoreDataManager().managedObjectContext!.save(nil)
     }
    
    
    
    /**
    根据 predicate 和 sortDescriptorMap创建 fetchRequest
    **/
    class func fetchRequest(predicate:NSPredicate? = nil,sortDescriptorMap:[String:Bool]? = nil) -> NSFetchRequest {
        
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
        
        
        return request
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
        return clazzName.substringFromIndex(dotIndex)
        
    }
    
}