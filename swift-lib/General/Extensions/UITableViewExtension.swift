//
//  UITableViewExtension.swift
//  Bag
//
//  Created by ligh on 15/8/19.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/*
** 扩展UITableView
**/
extension UITableView {
    
    
    //查找该view所在的cell indexpath
    func indexPathForView(view:UIView) -> NSIndexPath? {
        
        if let cell = cellForView(view){
            
            return self.indexPathForCell(cell)
        }
        
        return nil
        
    }
    
    
    //查找该view所在的cell
    func cellForView(view:UIView) -> UITableViewCell? {
        
        var v:UIView? = view
    
        while (( (v?.isKindOfClass(UITableViewCell)) ) == false)
        {
            v = v?.superview
        }
        
        
        return (v as? UITableViewCell)

    }
        
    
    
}
