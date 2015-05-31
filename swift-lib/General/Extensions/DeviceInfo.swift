//
//  DeviceInfo.swift
//  AirQ
//
//  Created by ligh on 14/10/18.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//

import Foundation
import UIKit

//设备信息
class DeviceInfo
{

    //获取系统版本号
    class func systemVersion() -> Int
    {
        return UIDevice.currentDevice().systemVersion.integerValue()
    }
    
    //判断系统版本是否小于ios7
    class func lessIOS7() -> Bool
    {
        return systemVersion() < 7
    }
}