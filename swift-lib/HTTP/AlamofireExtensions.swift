//
//  AlamofireExtensions.swift
//  swift-lib
//
//  Created by ligh on 15/6/1.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import Alamofire



extension Request
{
    
    /***
        将响应数据转为UIImage
        如果你请求都是 一个图片数据 可以直接将NSData转为UIImage
    **/
    func responseImage(completionHandler: (UIImage?, NSError?) -> Void) -> Self
    {
       
        let serializer: Serializer = { request, response, data in
            
            if data == nil
            {
                return (nil, nil)
            }
            
            let image = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
            
            return (image, nil)
        }
        
        return response(serializer:serializer, completionHandler: { (request, response, image, error) in
            completionHandler(image as? UIImage, error)
        })
    }
    
    
    
    /**
        如果你只关心相应的json数据 则可以调用此方法  他不会做model解析 只将数据转为json对象
        Array 或者 Dictionary
    **/
    func responseJSONObject(completionHandler: (LighHTTPResult?) -> Void) -> Self
    {
    
        let serializer: Serializer = { (request, response, data) in
            
            let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            
            let (JSON: AnyObject?, serializationError) = JSONSerializer(request, response, data)
            
            if response != nil && JSON != nil
            {
                
                let result:LighHTTPResult? = JSONModelParser.sharedManager.swiftObjWithDict(JSON as! NSDictionary, cls:LighHTTPResult.self) as? LighHTTPResult
                
                result?.dataObj = JSON;
                
                return (result,nil);
                
            } else {
                
                return (nil, serializationError)
            }
        }
        
        return response(serializer: serializer, completionHandler: { (request, response, object, error) in
            completionHandler(object as? LighHTTPResult)
        })
    }

    /****
         响应一个model对象
         比如你请求用户详情接口 该结构返回一个用户信息 则可以使用该方法
         一般返回单个model对象
    
        clazz:知道返回的对象class 相应结束后会生成该clazz实例 返回调用端
    ***/
     func responseObject(clazz:AnyClass,completionHandler: (LighHTTPResult?) -> Void) -> Self
    {
        let serializer: Serializer = { (request, response, data) in
            
            let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            
            let (JSON: AnyObject?, serializationError) = JSONSerializer(request, response, data)
     
            if response != nil && JSON != nil
            {
             
             let result:LighHTTPResult? = JSONModelParser.sharedManager.swiftObjWithDict(JSON as! NSDictionary, cls:LighHTTPResult.self) as? LighHTTPResult
                
                
                let objctDict:NSDictionary = JSON?[LighHTTPResult.DATA_KEY] as! NSDictionary;
                let obj:AnyObject? = JSONModelParser.sharedManager.swiftObjWithDict(objctDict, cls:clazz)
                result?.dataObj = obj;
            
                return (result,nil);
                
            } else {
                
                return (nil, serializationError)
            }
        }
        
        return response(serializer: serializer, completionHandler: { (request, response, object, error) in
            completionHandler(object as? LighHTTPResult)
        })
    }
    

    /****
    响应一个model数组
    一般用户列表请求
    clazz:知道返回的对象class 相应结束后会生成该clazz实例 返回调用端
    ***/
    func responseObjectArray(clazz:AnyClass,completionHandler:(LighHTTPResult?)-> Void) -> Self
    {
        let serializer:Serializer =
        {
            (request,response,data) in
        
            let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            
            
            //JSON = Array/Dictionary
            let (JSON: AnyObject?, serializationError) = JSONSerializer(request, response, data)
            
            if response != nil && JSON != nil
            {
                
                let result:LighHTTPResult? = JSONModelParser.sharedManager.swiftObjWithDict(JSON as! NSDictionary, cls:LighHTTPResult.self) as? LighHTTPResult
                
                
                let objectArrayDict:NSArray = JSON?[LighHTTPResult.DATA_KEY] as! NSArray;
                let objArray:AnyObject? = JSONModelParser.sharedManager.swiftObjWithArray(objectArrayDict, cls: clazz)
               
                result?.dataObj = objArray;
                
                return (result,nil);
                
            } else {
                
                return (nil, serializationError)
            }

        }
        
        return response(serializer: serializer, completionHandler: { (request, response, object, error) in
            completionHandler(object as? LighHTTPResult)
        })
    }
    
    
    
}