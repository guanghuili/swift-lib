//
//  AlamofireExtensions.swift
//  swift-lib
//
//  Created by ligh on 15/6/1.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import Alamofire


public typealias Serializer = (NSURLRequest, NSHTTPURLResponse?, NSData?) -> (AnyObject?, NSError?)

extension Request
{
    
    /***
    将响应数据转为UIImage
    如果你请求都是 一个图片数据 可以直接将NSData转为UIImage
    **/
    
    public static func ImageResponseSerializer() -> GenericResponseSerializer<UIImage> {
        return GenericResponseSerializer { request, response, data in
            if data == nil || data?.length == 0 {
                return (nil, nil)
            }
            
            var serializationError: NSError?
            
            return (UIImage(data: data!), serializationError)
        }
    }
    
    func responseImage(completionHandler: (UIImage?, NSError?) -> Void) -> Self
    {
       
        return response(queue: nil, responseSerializer: Request.ImageResponseSerializer()) { (request, response, image, error) -> Void in
    
            completionHandler(image,error)
        }

    }

    
    /**
        如果你只关心相应的json数据 则可以调用此方法  他不会做model解析 只将数据转为json对象
        Array 或者 Dictionary
    **/
    func responseJSON(completionHandler: (AnyObject?, NSError?) -> Void) -> Self
    {

       return responseJSON(options: .AllowFragments) { (request, response, json, error) -> Void in
        
               completionHandler(json,error)
        }

    }
    

    

    /****
         响应一个model对象
         比如你请求用户详情接口 该结构返回一个用户信息 则可以使用该方法
         一般返回单个model对象
    
        clazz:知道返回的对象class 相应结束后会生成该clazz实例 返回调用端
    ***/
    
    func responseObject(clazz:AnyClass,completionHandler: (AnyObject?,NSError?) -> Void) -> Self
    {
        
       return responseJSON { (json, error) -> Void in
        
            let dic = (json as! NSDictionary)
             let responseObject = JSONModelParser.sharedManager.swiftObjWithDict(dic, cls: clazz)
            
            completionHandler(responseObject,error)
            
        }

    }
    

    /****
    响应一个model数组
    一般用户列表请求
    clazz:知道返回的对象class 相应结束后会生成该clazz实例 返回调用端
    ***/
    func responseObjectArray(clazz:AnyClass,completionHandler:([AnyObject]?,NSError?) -> Void) -> Self
    {
     
        return responseJSON { (json, error) -> Void in
            
            let array = (json as! NSArray)
            let responseObjectArray: AnyObject? = JSONModelParser.sharedManager.swiftObjWithArray(array, cls: clazz)
            
            completionHandler(responseObjectArray as? Array,error)
            
        }
    }
    
    /**
    *
    *返回一个LighHTTPResult 数据为dataClazz
    *
    */
    func responseResultObject(dataClazz:AnyClass,completionHandler: (LighHTTPResult?) -> Void) -> Self
    {
        
        return responseJSON(options: .AllowFragments) { (request, response, json, error) -> Void in
            
        
            if let jsonDic = (json as? NSDictionary) {
                
               let result = JSONModelParser.sharedManager.swiftObjWithDict(jsonDic, cls: LighHTTPResult.self) as! LighHTTPResult
                //["data"] as! NSDictionary
                result.data = JSONModelParser.sharedManager.swiftObjWithDict(jsonDic , cls: dataClazz)
                
                completionHandler(result)
             
                return
            }
            
            
            completionHandler(nil)
        }

    }
    
    /**
    *
    *返回一个LighHTTPResult 数据为dataClazz array
    *
    */
    func responseResultObjectArray(dataClazz:AnyClass,completionHandler: (LighHTTPResult?) -> Void) -> Self
    {
        
        return responseJSON(options: .AllowFragments) { (request, response, json, error) -> Void in
            
            
            if let jsonDic = (json as? NSDictionary) {
                
                let result = JSONModelParser.sharedManager.swiftObjWithDict(jsonDic, cls: LighHTTPResult.self) as! LighHTTPResult
                
                result.data = JSONModelParser.sharedManager.swiftObjWithArray(jsonDic["data"] as! NSArray, cls: dataClazz)
                
                completionHandler(result)
                
                return
            }
            
            
            completionHandler(nil)
        }
        
    }

    
}