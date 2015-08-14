//
//  LighBaseTableViewController.swift
//  swift-lib
//
//  Created by ligh on 15/5/31.
//  Copyright (c) 2015年 ligh. All rights reserved.
//


import UIKit

class LighBaseTableViewController: LighBaseViewController ,UITableViewDelegate,UITableViewDataSource
{
    //tableview
    @IBOutlet weak var tableview: UITableView?
    
    //data
    var dataArray:[AnyObject]?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        tableview?.delegate = self;
        tableview?.dataSource = self;
        
    }
    
    
    /**
    **
    ** 返回指定NSIndexPath 的cell标示符
    **
    **/
    func cellIdentifierForIndexPath(indexPath:NSIndexPath) -> String
    {
        return "CellIdentifier"
    }
    
    
    /**
    **
    **返回indexPath的celldata
    **/
    func cellDataAtIndexPath(indexPath:NSIndexPath) -> AnyObject
    {
        return dataArray![indexPath.row]
    }
    
    /**
    **
    ** 配置指定的cell
    **
    **/
    func configureCell(cell:UITableViewCell,atIndexPath:NSIndexPath)
    {
        [self .configureCell(cell, withData: self.cellDataAtIndexPath(atIndexPath))]
    }
    
    /**
    **
    ** 根据withData配置指定的cell
    **
    **/
    func configureCell(cell:UITableViewCell,withData:AnyObject)
    {
        
    }
    
    /***
    **
    **获取cell的高度
    **/
    func heightForRowAtIndexPath(tableView:UITableView,atIndexPath:NSIndexPath) -> CGFloat
    {
        
        var cellIdentifier = self.cellIdentifierForIndexPath(atIndexPath)
        
        
        return  tableView.fd_heightForCellWithIdentifier(cellIdentifier, cacheByIndexPath: atIndexPath, configuration: { (cell) -> Void in
            
            self.configureCell(cell as! UITableViewCell, atIndexPath: atIndexPath)
            
        })
        
    }
    
    
    
    //=================UITableViewDelegate UITableViewDataSource==============//
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifierForIndexPath(indexPath), forIndexPath: indexPath) as! UITableViewCell
        
        self.configureCell(cell, atIndexPath: indexPath)
        
        
        return cell;
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray!.count;
    }
    
    
    /**
    *
    此方法默认不实现 如果有固定高度的 应该使用 tableView.rowHeight
    *
    **/
    //    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //
    //    }
    
}
