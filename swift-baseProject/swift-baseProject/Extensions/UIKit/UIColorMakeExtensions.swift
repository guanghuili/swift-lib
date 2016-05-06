//
//  UIColor-Extensions.swift
//  XingNang
//
//  Created by ligh on 16/4/11.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func rgba(r: CGFloat, g:CGFloat , b:CGFloat , a: CGFloat = 1) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
}