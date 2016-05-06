//
//  TableViewPersentController.swift
//  XingNang
//
//  Created by ligh on 16/4/12.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit
import SVProgressHUD
import Aspects

/*为UITableView定制的呈现者
 */
class TableViewPersentController : NSObject, PresentController  {
    
    var dataController: ListDataController?
    
    
    var tableView:UITableView

    
    init(tableView:UITableView) {
        
        self.tableView = tableView
        
        //自动计算cell高度
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
 
        
        //fixed UIKit bug
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
        
        
    }
    

    /**
     indexPath 位置需要显示的Cell
     
     - parameter indexPath: indexPath
     
     - returns: cell Identifier (String)
     */
    func cellIdentifierAtIndexPath(indexPath:NSIndexPath) -> String {
        return "UITableViewCell"
    }
    
    
}


// MARK: - 扩展TableViewPersentController 默认实现 UITableViewDataSource 和 UITableViewDelegate
extension TableViewPersentController : UITableViewDataSource,UITableViewDelegate {
    
//    #if DEBUG
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        
//        if let dc = dataController {
//            
//            return dc.numberOfSections()
//            
//        }
//        
//        return -1
//    }
//    #endif
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        if let dc = self.dataController {
            
            return dc.numberOfObjectsInSection(section)
            
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifierAtIndexPath(indexPath), forIndexPath: indexPath)
        
        
        cell.setData((self.dataController?.dataAtIndexPath(indexPath))!)
        
        return cell
    }
}


///*实现DataControllerDelegate协议
// */
//extension TableViewPersentController : DataControllerDelegate {
//    
//    
//    /*默认loading时显示动画
//     */
//    func onLoading() {
//        /*设置样式
//         */
//        SVProgressHUD.setDefaultStyle(.Dark)
//        SVProgressHUD.show()
//    }
//    
//    
//    /*加载失败的默认处理方法
//     */
//    func onLoadFailed() {
//        SVProgressHUD.dismiss()
//    }
//    
//    /*加载完成的默认处理方法
//     */
//    func onLoadComplted(data: Data?) {
//        SVProgressHUD.dismiss()
//    }
//}
