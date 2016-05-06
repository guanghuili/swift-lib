//
//  CoreDataController.swift
//  XingNang
//
//  Created by ligh on 16/4/14.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit
import CoreData


/*
 CoreData 数据控制器 必须依赖NSFetchedResultsController
 */
class CoreDataController: ListDataController {

    
    /*fetchedResultsController
     */
    var fetchedResultsController:NSFetchedResultsController
    
    
    
    /*init时传入NSFetchedResultsController
    */
    init(fetchedResultsController:NSFetchedResultsController) {
        
        self.fetchedResultsController = fetchedResultsController
         
    }
    
    
    /*加载数据 默认从NSFetchedResultsController中查询
     */
    func loadData() {
        
        try! self.fetchedResultsController.performFetch()
        
    }
    
    /*init时 根据entityName sortDescriptors sectionName cacheName初始化fetchedResultsController
    */
    convenience init(entityName:String,sortDescriptors:[NSSortDescriptor],sectionName:String? = nil,cacheName:String? = nil) {
     
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        /*查询请求
         */
        let request:NSFetchRequest = NSFetchRequest()
        
        
        /*排序
         */
        request.sortDescriptors = sortDescriptors
        
        
        /*实体描述
         */
        let entifyDescription:NSEntityDescription? = NSEntityDescription.entityForName(entityName, inManagedObjectContext: appDelegate.managedObjectContext)
        request.entity = entifyDescription
        
        /*生成fetchedResultsController
         */
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: appDelegate.managedObjectContext, sectionNameKeyPath: sectionName, cacheName: cacheName)
        
        self.init(fetchedResultsController:fetchedResultsController)
        
    }
    
    /*init时 根据entityName sortDescriptor sectionName cacheName初始化fetchedResultsController
     */
    convenience init(entityName:String,sortDescriptor:NSSortDescriptor,sectionName:String? = nil,cacheName:String? = nil) {
        
        self.init(entityName:entityName,sortDescriptors: [sortDescriptor],sectionName: sectionName,cacheName: cacheName)
    }
 
    
}


/*扩展CoreDataController  默认通过NSFetchedResultsController查询数据
 */
extension CoreDataController {

    /*获取指定index 位置的data
     */
    func dataAtIndex(index:Int) -> AnyObject? {
        
        return self.fetchedResultsController.objectAtIndexPath(NSIndexPath(index: index))
    }
    
    /*获取indexPath的data
     */
    func dataAtIndexPath(indexPath:NSIndexPath) -> AnyObject? {
        
        return self.fetchedResultsController.objectAtIndexPath(indexPath)
    }
    
    /*获取指定section的objects
     */
    func datasAtSection(section: Int) -> DataObjects? {
        return  self.fetchedResultsController.sections?[section].objects
    }

    
    /*获取seciton的title
     */
    func sectionTitleAtSection(section:Int) -> String? {

        return  self.fetchedResultsController.sections?[section].indexTitle
    }
    
    
    /*获取seciton数量
     */
    func numberOfSections() -> Int {
        
        if let count =  self.fetchedResultsController.sections?.count {
            return count
        }
        
        return 0
    }
    
    /*获取seciton下objects的数量
     */
    func numberOfObjectsInSection(section:Int) ->Int {
        
        if let sections = self.fetchedResultsController.sections,let count = sections[section].objects?.count {
                return count
        }
        
        return 0
        
    }
    
    
    func dataObjects() -> DataObjects? {
        
        return self.fetchedResultsController.fetchedObjects
    }
    
    

}

// ================== NSFetchedResultsControllerDelegate imp ==================

/**暂时不实现**/
//extension CoreDataController : NSFetchedResultsControllerDelegate {
//    
//    
//}