//
//  WeatherInfo.swift
//  XingNang
//
//  Created by ligh on 16/5/5.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation
import ObjectMapper

class RecmdContent : Mappable {
    
    var title:String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["Title"]
        
    }
}


class PageResponse: Mappable {
    
    var pageSize:Int?
    var list:[RecmdContent]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        pageSize <- map["pageSize"]
        list <- map["data"]["list"]
    }
    
}

