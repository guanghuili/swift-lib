//
//  UIExtension.swift
//  AirQ
//
//  主要为UIView提供一系列好用的方法 比如直接设置x y width height 而不用使用Frame去设置
//
//
//  Created by ligh on 14-10-16.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//



import Foundation
import UIKit


//对UIView进行扩展
extension UIView
{

    //=================================Frame begin===================================//
    var x:CGFloat
    {
        //获取UIView的目前的x坐标
        get
        {
            return self.frame.origin.x
        }
     
        //设置UIView x坐标
        set(newValue)
        {
            var point:CGPoint = self.frame.origin
            self.frame.origin = CGPointMake(newValue, point.y)
        }
    }
    
    var y:CGFloat
        {
        //获取UIView的目前的y坐标
        get
        {
            return self.frame.origin.y
        }
        
        //设置UIView x坐标
        set(newValue)
        {
            var point:CGPoint = self.frame.origin
            self.frame.origin = CGPointMake(point.x,newValue)
        }
    }
    
    
    var bottom:CGFloat
    {
        //获取UIView的目前的y坐标
        get
        {
            return self.frame.origin.y + self.height
        }
        
        //设置UIView y坐标
        set(newValue)
        {
            self.y = newValue - self.height;
        }
        
    }
    
    var right:CGFloat
    {
        get
        {
            return self.width + self.x
        }
        
        set(newValue)
        {
            self.x = self.right - newValue
        }
    }
    
    
    var origin:CGPoint
    {
    
        get
        {
            return self.frame.origin;
        }
    
        set(newValue)
        {
            self.frame.origin = origin
        }
    }
    
    
    var width:CGFloat
        {
        get
        {
            return self.frame.size.width
        }
        
        set(newValue)
        {
            var size:CGSize = self.frame.size
            self.frame.size = CGSizeMake(newValue,size.height)
        }
    }
    
    var height:CGFloat
        {
        get
        {
            return self.frame.size.height
        }
        
        set(newValue)
        {
            var size:CGSize = self.frame.size
            self.frame.size = CGSizeMake(size.width,newValue)
        }
    }
    
    var size:CGSize
    {
        get
        {
            return self.frame.size
        }
        
        set(newValue)
        {
            self.frame.size = newValue;
        }
    }
    
    
    //=================================Frame end===================================//


    //=================================GestureRecognizer begin(首饰相关的)===================================//
    
    //添加点击事件
    func addTapGestureRecognizer(#target: AnyObject,action: Selector)
    {
        
        var tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //制作圆角
    func makeCornerRadius(cornerRadius:CGFloat,borderColor:UIColor,borderWidth:CGFloat)
    {
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
    }
    
    func makeCornerRadius(cornerRadius:CGFloat,borderColor:UIColor)
    {
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1
    }

    
    class func getClassName() -> String
    {
        
        var selfName:String = NSStringFromClass(self)
        var range:Range<String.Index>? = selfName.rangeOfString(".")
        
        if range != nil
        {
            return selfName.substringFromIndex(range!.endIndex)
        }
        
        return selfName
    }
}