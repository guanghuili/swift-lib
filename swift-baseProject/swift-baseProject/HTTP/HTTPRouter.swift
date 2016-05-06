//
//  HTTPRouter.swift
//  XingNang
//
//  Created by ligh on 16/5/5.
//  Copyright © 2016年 ligh. All rights reserved.
//


import Alamofire

typealias Parameters = [String:AnyObject]
typealias Headers = [String:String]

enum HTTPRouter : URLRequestConvertible {
    
    static let baseURLString = ""
    
   
    
    
    /*用户信息
    */
    case UserInfo(Parameters?)
    case ActivityList
    case Test
    
    
    
    /*
     将当前Router转成URLRequest对象
     */
    var URLRequest: NSMutableURLRequest {
        
        
        let result:(method:Alamofire.Method,path:String,parameters:Parameters?,encoding:ParameterEncoding,headers:Headers?) =  {
            
                switch self {
                    case let .UserInfo(parameters):
                        return (.GET,"",parameters,.URL,[:])
                    case .ActivityList:
                    return (.POST,"/",["type":"get_focus","key":"66cc9705d796a0cd97fc85128aa1624625c61cf8f7621503","brandId":"1","cateid":"1","typeid":"1"],.URL,[:])
                case .Test:
                    return (.GET,"/sample_keypath_json",[:],.URL,[:])
                    
                }
           
        }()
        
        let URL = NSURL(string: HTTPRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        mutableURLRequest.HTTPMethod = result.method.rawValue
        mutableURLRequest.allHTTPHeaderFields = result.headers
        
        return result.encoding.encode(mutableURLRequest, parameters: result.parameters).0
    }
    
}
