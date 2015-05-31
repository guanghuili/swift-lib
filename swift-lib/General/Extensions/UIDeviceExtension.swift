//
//  UIDeviceExtension.swift
//  ligh
//
//  Created by ligh on 14/10/18.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//

import Foundation


//设备信息
extension UIDevice
{

    //获取系统版本号
    class func systemVersion() -> Int
    {
        return self.currentDevice().systemVersion.integerValue()
    }
    
    //判断系统版本是否小于ios7
    class func lessthanIOS7() -> Bool
    {
        return systemVersion() < 7
    }
}