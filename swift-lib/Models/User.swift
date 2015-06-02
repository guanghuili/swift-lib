//
//  User.swift
//  swift-lib
//
//  Created by ligh on 15/6/1.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

class User:NSObject,JSONModelParserProtocol
{
//   
    var userName:String?
    var order:Order!
    var orders:Array<Order>!
    var age:Int = 0

    
   static func JSONKeyByClassMapping() -> [String:String]?
   {
        return ["order":"\(Order.self)","orders":"\(Order.self)"]
   }
    
}


class Weather:NSObject
{
    var city_en:String?
    var city:String?
}