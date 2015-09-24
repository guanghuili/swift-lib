//
//  User.swift
//  swift-lib
//
//  Created by ligh on 15/6/1.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import ObjectMapper

class User:NSObject
{
//   
    var userName:String?
    var order:Order!
    var orders:Array<Order>!
    var age:Int = 0

    

    
}


class WeatherInfo:Mappable {
    
    var weatherinfo:Weather?
    
    required init?(_ map: Map){
        
        
    }
    
    func mapping(map: Map) {
        
        weatherinfo <- map["weatherinfo"]
     
    }
}

class Weather:Mappable
{
    var city_en:String?
    var city:String?
    
    required init?(_ map: Map){
        
    
    }
    
    func mapping(map: Map) {
        

        city_en <- map["city_en"]
        city <- map["city"]
    }
}