//
//  UIColorExtension.swift
//  AirQ
//
//  UIColor 扩展
//
//
//  Created by ligh on 14-10-16.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//

import Foundation
import UIKit


extension UIColor
{

    //构建颜色根据
    class func ColorMake(#red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor
    {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    //构建颜色
    class func ColorMake(#red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor
    {
        return ColorMake(red: red, green: green, blue: blue, alpha: 1)
    }

}

