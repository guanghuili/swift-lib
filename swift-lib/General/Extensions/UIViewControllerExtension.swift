//
//  UIViewControllerExtension.swift
//  Bag
//
//  Created by ligh on 15/8/18.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

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

// MARK: - Runtime
// MARK: - 对viewController做运行时扩展
extension UIViewController {
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = Selector("viewWillAppear:")
            let swizzledSelector = Selector("nsh_viewWillAppear:")
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
    
    // MARK: - Method Swizzling

    func nsh_viewWillAppear(animated: Bool) {
        self.nsh_viewWillAppear(animated)
      //  IQKeyboardManager.sharedManager().enable = true;
       
    }
}

