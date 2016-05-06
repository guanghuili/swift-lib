//
//  HTTPResult.swift
//  XingNang
//
//  Created by ligh on 16/5/5.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Alamofire
import ObjectMapper

/*api返回的状态码
 */
enum APIStatus : Int {
    
    case Success = 200 //200状态 表示成功
    case Failure = 300 //300状态 表示失败
    
    
     /// Returns `true` if the result is a failure, `false` otherwise.
     var isSuccess: Bool {
        switch self {
        case .Success:
            return true
        default:
            return false
        }
    }
     var isFailure: Bool {
        return !self.isSuccess
    }

   
}


/*api resut 需要根据服务器返回的字段定义
 */
class APIResult <T> : Mappable {
    
    /*api返回的数据
     */
    var data:AnyObject?
    
    var dataObject:T?
    
    /*api访问状态
     */
    var status:APIStatus? = .Failure
    
    /*api返回的消息描述
     */
    var msg:String?
    
    
    //=== *** confirm Mappable protocol ****==============//
    
    required init?(_ map: Map){
        
    }
    
   func mapping(map: Map) {
        
        dataObject <-  map["data"]
        data <- map["data"]
    
        status <- map["result"]
        msg <- map["msg"]
    }
    
    
}


/*分页数据model
 */
class APIPage <T:Mappable> : Mappable {
    
    var list:[T]?
    
    //=== *** confirm Mappable protocol ****==============//
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        list <- map["list"]
    }

    
}


extension APIResult {
    
    func map<Value>(transform:(AnyObject)->Value?) -> Value? {
            return transform(self.data!)
    }
}

extension Result {
    
    func map<T>(transform:(Value)->T?) -> T? {
        
                switch self {
                case let .Success(value):
                    print("======\(value)")
                    return transform(value)
                default:
                    return nil
                }
    }
}