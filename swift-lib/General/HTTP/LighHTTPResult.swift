//
//  HTTPResult.swift
//  swift-lib
//
//  Created by ligh on 15/6/2.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation


/***
    http
**/
class LighHTTPResult : NSObject
{
    
    var result:String?//接口状态 非http状态
    var msg:String?//消息
    //var data:NSDictionary?//服务器返回的字典数据
    var data:AnyObject?//解析后的model对象
    
    
    func isSuccess() -> Bool
    {
        guard let _ = result else {
            
            return false
        }

         return Int(result!) == 1;
    }
    
    
    
}