//
//  ViewControllerNavigationBar.swift
//  XingNang
//
//  Created by ligh on 16/4/11.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit



// MARK: - 扩展ViewControllers
extension UIViewController {
 
    
}


// MARK: - 自定义UINavigationBar
extension UINavigationBar {
    
    public override func awakeFromNib() {
        super.awakeFromNib();
        
        //设置背景颜色
        self.barTintColor = UIColor.rgba(59.0, g: 104.0, b: 156.0)
        
        self.setTitleColor(UIColor.whiteColor())
        self.setTitleFont(UIFont.systemFontOfSize(22))
    
        
    }
    
    
    /**
     设置导航栏标题字体颜色
     
     - parameter color: 颜色UIColor
     */
    public func setTitleColor(color:UIColor) {

        var titleTextAttributes:[String:AnyObject]  = self.titleTextAttributes ^ [:]
        titleTextAttributes[NSForegroundColorAttributeName] = UIColor.whiteColor()
        self.titleTextAttributes = titleTextAttributes
    }
    
    /**
     设置导航栏标题字体大小
     
     - parameter font: 字体UIFont
     */
    public func setTitleFont(font:UIFont) {
        
        var titleTextAttributes:[String:AnyObject]? = self.titleTextAttributes ^ [:]
        titleTextAttributes?[NSFontAttributeName] = font
        self.titleTextAttributes = titleTextAttributes
        
    }
    
}





// MARK: - 扩展 UIBarButtonItem
extension UIBarButtonItem {
    
    /**
     - parameter customView: 自定义的view
     - parameter target:     target
     - parameter action:     action
     
     - returns: UIBarButtonItem
     */
    public convenience init(customView: UIView, target: AnyObject?, action: Selector) {
        self.init(customView:customView)
        customView.addGestureRecognizer(UITapGestureRecognizer(target: target, action:action))
    }
    
    public convenience init(customViewOfImage: UIImage, target: AnyObject?, action: Selector) {
    
        //自定义view
        let btn = UIButton(frame: CGRectMake(0, 0, customViewOfImage.size.width, customViewOfImage.size.height))
        btn.setImage(customViewOfImage, forState: .Normal)
        
        self.init(customView:btn,target: target,action: action)
    
    }
}
