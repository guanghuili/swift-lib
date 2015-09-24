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
    
    
    public static func ImageResponseSerializer()
        -> GenericResponseSerializer<UIImage>
    {
        return GenericResponseSerializer { _, _, data in

            guard let validData = data else {
                let failureReason = "JSON could not be serialized because input data was nil."
                let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: failureReason)
                return .Failure(data, error)
            }
            
            do {
              //  let JSON = try NSJSONSerialization.JSONObjectWithData(validData, options: options)
               
                let imageData =  UIImage(data: validData)
               
                return  .Success(imageData!)

             
            } catch {
                return .Failure(data, error as NSError)
            }
        }
    }
    
    /***
    将响应数据转为UIImage
    如果你请求都是 一个图片数据 可以直接将NSData转为UIImage
    **/
    

    
    func responseImage(completionHandler: (UIImage?, NSError?) -> Void) -> Self
    {
        
       return response(responseSerializer: Request.ImageResponseSerializer()) { (request, response, result) -> Void in
            
            
        }
        
//        return response(responseSerializer: Request.ImageResponseSerializer()) { (request, response, image,error) -> Void in
//            
//                    //  completionHandler(image,error)
//        }
        
//        return response(
//            responseSerializer: Request.ImageResponseSerializer(),
//            completionHandler: completionHandler
//        )
//       
////        return response(queue: nil, responseSerializer: Request.ImageResponseSerializer()) { (request, response, image, error) -> Void in
////    
////            completionHandler(image,error)
////        }

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
    


    
}