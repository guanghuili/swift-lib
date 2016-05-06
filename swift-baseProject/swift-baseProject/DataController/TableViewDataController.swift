
//
//  TableViewDataController.swift
//  XingNang
//
//  Created by ligh on 16/4/14.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit


typealias Sections = [SectionInfo]
typealias DataObjects = [AnyObject]

/*主要是给UITableView使用
 */
class TableViewDataController: ListDataController {


    /*如果sections!=nil优先显示该sections   否则显示objects 该情况下section的数量为0
     */
    var sections:Sections?
    
    var objects:DataObjects?

  
    
}



/*分区信息
 */
struct SectionInfo  {
    
    
    /*获取该SectionInfo下objects数量
     */
    var numberOfObjects:Int {
        
        if let objectsCount = objects?.count {
            return objectsCount
        }
        
        return 0
    }
    
    /*获取该SectionInfo下objects
     */
    var objects:DataObjects?
    
    
    
    
    /*获取该SectionInfo的标题
     */
    var title:String?
    
}



/*扩展CoreDataController  默认通过sections objects查询数据
 */
extension TableViewDataController {
    
    
    /*获取指定index 位置的data
     */
    func dataAtIndex(index:Int) -> AnyObject? {
        
        if let objs =  self.objects {
            return objs[index]
        }
        return nil
    }
    
    /*获取indexPath的data
     */
    func dataAtIndexPath(indexPath:NSIndexPath) -> AnyObject? {
        
        if let secs = self.sections {
            return secs[indexPath.section].objects?[indexPath.row]
        }
        
        return self.dataAtIndex(indexPath.row)
    }
    
    
    /*获取指定section的objects
     */
    func datasAtSection(section: Int) -> DataObjects? {
        
        if let secs =  self.sections {
            return secs[section].objects
        }
        
        return nil
        
    }
    
    
    /*获取所有objects
     */
    func dataObjects() -> DataObjects? {
        
        if let secs =  self.sections {
            
            /*将所有分区的数据 放入一个数组
             */
            let flatObjects = (secs.flatMap {
                
                            $0.objects
                
                        }).flatMap {
                           
                            $0
                        }
            
            return flatObjects
        }
        
        return objects
    }
    

    
    /*获取seciton的title
     */
    func sectionTitleAtSection(section:Int) -> String? {
        
        if let secs = self.sections {
            return secs[section].title
        }
        
        return nil
    }
    
    
    /*获取seciton数量
     */
    func numberOfSections() -> Int {
        
        if let secs =  self.sections {
            return secs.count
        }
        
        return -1
    }
    
    
    /*获取seciton下objects的数量
     */
    func numberOfObjectsInSection(section:Int) ->Int {
        
        if let secs = self.sections ,let count  = secs[section].objects?.count {
            return count
        }
        
        if let objsCount = self.objects?.count {
            return objsCount
        }
        
        return 0
        
    }
    
    
  

}


// ================== PROTOCOLS ==================
