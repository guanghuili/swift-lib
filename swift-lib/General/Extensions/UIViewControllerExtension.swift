//
//  UIViewControllerExtension.swift
//  Bag
//
//  Created by ligh on 15/8/18.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/***
扩展viewcontroller的常用方法
**/
extension UIViewController {
    
    
    class func viewController(storyboardName:String?="Main") -> UIViewController {
    
        var storyboard = UIStoryboard(name: storyboardName!, bundle: nil);
        
       return storyboard.instantiateViewControllerWithIdentifier(self.className()) as! UIViewController
        
    }
    
    
    
    class func className() ->String {
        
        var clazzName:NSString = NSStringFromClass(self) as NSString
        var dotIndex = clazzName.rangeOfString(".").location
        
        if(dotIndex == NSNotFound)
        {
            return NSStringFromClass(self)
        }
        return clazzName.substringFromIndex(dotIndex+1)
        
    }

    

}