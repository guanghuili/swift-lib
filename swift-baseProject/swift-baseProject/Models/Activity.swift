//
//  Activity.swift
//  swift-baseProject
//
//  Created by ligh on 16/5/6.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation
import ObjectMapper


class Activity : Mappable {
    
    
    var eventName:String?

    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        eventName <- map["eventName"]
        
    }
    
}
