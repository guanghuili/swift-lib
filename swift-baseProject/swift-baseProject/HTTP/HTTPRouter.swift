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
typealias RouterConfingInfo = (method:Alamofire.Method,path:String,parameters:Parameters?,encoding:ParameterEncoding,headers:Headers?)

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
        
        let configInfo:RouterConfingInfo = self.generateConfigInfo
        
        let URL = NSURL(string: HTTPRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(configInfo.path))
        mutableURLRequest.HTTPMethod = configInfo.method.rawValue
        mutableURLRequest.allHTTPHeaderFields = configInfo.headers
        
        return configInfo.encoding.encode(mutableURLRequest, parameters: configInfo.parameters).0
    }
    
    
    /*生成当前Router的请求配置信息
     */
    var generateConfigInfo: RouterConfingInfo {
        
        switch self {
            
            case let .UserInfo(parameters):
                return (.GET,"",parameters,.URL,[:])
            
            case .ActivityList:
                return (.POST,"/",["type":"get_focus","key":"66cc9705d796a0cd97fc85128aa1624625c61cf8f7621503","brandId":"1","cateid":"1","typeid":"1"],.URL,[:])
            
            case .Test:
                return (.GET,"/sample_keypath_json",[:],.URL,[:])
            
        }
   
        
    }
    
    
}
