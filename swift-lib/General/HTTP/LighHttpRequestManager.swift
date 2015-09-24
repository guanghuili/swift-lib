//
//  LighHttpRequest.swift
//  swift-lib
//
//  Created by ligh on 15/6/2.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import Alamofire



enum LighHttpRequestMethod : String
{
    case OPTIONS = "OPTIONS"
    case GET     = "GET"
    case HEAD    = "HEAD"
    case POST    = "POST"
    case PUT     = "PUT"
    case PATCH   = "PATCH"
    case DELETE  = "DELETE"
    case TRACE   = "TRACE"
    case CONNECT = "CONNECT"
}



func reuqst()
{

}

//请求信息管理者
class LighHttpRequestManager
{
    //最大请求数量
    static let MAX_REQUEST_COUNT = 3
    
    //存储正在发送的请求String:url
    static var urlByRequestMapping:Dictionary<String,Alamofire.Request> = Dictionary(minimumCapacity: 3);
    
    

    class private func showIndicatorView(view:UIView)
    {
        hideIndicatorView(view)
        let indicatorView:LighIndicatorView? = LighIndicatorView.viewFromXIB() as? LighIndicatorView;
        indicatorView?.tag = 99999
        indicatorView?.showInView(view);
        view.bringSubviewToFront(indicatorView!)
    }
    
    class private func hideIndicatorView(view:UIView)
    {
       let indicatorView = view.viewWithTag(99999);
        indicatorView?.removeFromSuperview()
    }
    
    
    /**
        将lighMethod转为Alamofire Method 主要是考虑以后换用其他框架 
    **/
    class func AlamofireMethodByLighHttpRequest(method:LighHttpRequestMethod = .POST) -> Alamofire.Method
    {
        switch method
        {
        case .POST:
            return Alamofire.Method.POST
        case .GET:
            return Alamofire.Method.GET
        case .DELETE:
            return Alamofire.Method.DELETE
        case .CONNECT:
            return Alamofire.Method.CONNECT
        case .HEAD:
            return Alamofire.Method.HEAD
        case .OPTIONS:
            return Alamofire.Method.OPTIONS
        case .PATCH:
            return Alamofire.Method.PATCH
        case .PUT:
            return Alamofire.Method.PUT
        default:
            return Alamofire.Method.POST
        }
    }
    
    
    /***
        根据请求url判断是否有相同请求 如果又相同请求则取消上次请求 
        如果没有 则查看目前请求数 加上本次请求是否大于 最大请求数 如果为真 则随机删除一个请求
    **/
    class func discardRequestByCacheWithUrl(url:String)
    {
        let request:Request? = urlByRequestMapping[url]

        
        if request != nil
        {
            request?.cancel()
            urlByRequestMapping.removeValueForKey(url)
            print("url地址相同 cancel=\(url)")
            
        }else
        {
           if( urlByRequestMapping.count >= MAX_REQUEST_COUNT )
           {
//
//                let firstUrl = urlByRequestMapping.keys.array[0]
//            
//                  if let request:Request? = urlByRequestMapping[firstUrl]
//                  {
//                    request?.cancel()
//                    urlByRequestMapping.removeValueForKey(firstUrl)
//                    print("cancel=\(firstUrl)")
//                 }
            }
        }
        
        print("正在发送的数量\(urlByRequestMapping.count)")
    }
    
    
    
    class func createRequest(method:Alamofire.Method? = .GET, URLString: URLStringConvertible, parameters: [String : AnyObject]? = nil, encoding: ParameterEncoding) -> Request {
        
        return Alamofire.request(method!, URLString, parameters: parameters, encoding: encoding)
    }
    
    ///请求一个json
    class func requestJSON(indicatorViewInView:UIView,method:Alamofire.Method? = .POST,url:String,parameters:[String : AnyObject]? = nil,completionHandler:(AnyObject?) -> Void)
    {

        showIndicatorView(indicatorViewInView)
        discardRequestByCacheWithUrl(url)
        
        let request = self.createRequest(method, URLString: url, parameters: parameters, encoding: ParameterEncoding.URL).responseJSON { (json, error) -> Void in
            
            completionHandler(json);
            
            self.hideIndicatorView(indicatorViewInView);
            self.discardRequestByCacheWithUrl(url)
        }
 
           
        urlByRequestMapping[url] = request

    }
    
    
    class func request(indicatorViewInView:UIView,method:LighHttpRequestMethod? = .POST,url:String,parameters:[String : AnyObject]? = nil,clazz:AnyClass, completionHandler:(LighHTTPResult?) -> Void){
    
        showIndicatorView(indicatorViewInView)
        discardRequestByCacheWithUrl(url)

  
         let request = self.createRequest(AlamofireMethodByLighHttpRequest(method!), URLString: url, parameters: parameters, encoding: ParameterEncoding.URL).responseJSON { (json, error) -> Void in
            
            if let jsonDic = (json as? NSDictionary) {
                
                let result = JSONModelParser.sharedManager.swiftObjWithDict(jsonDic, cls: LighHTTPResult.self) as! LighHTTPResult
                
                let dataDic = jsonDic  //jsondic["data"]
              
                if (dataDic.isKindOfClass(NSArray)) {
                    
                    result.data = JSONModelParser.sharedManager.swiftObjWithArray(dataDic as! NSArray , cls: clazz)
                    
                } else {
                    
                     result.data = JSONModelParser.sharedManager.swiftObjWithDict(dataDic , cls: clazz)
                }
          
                completionHandler(result)
                
                return
            }

        }
        
         urlByRequestMapping[url] = request
        
    }
    
//    //请求一个对象
//   class  func requestResultObject(indicatorViewInView:UIView,method:LighHttpRequestMethod? = .POST,url:String,parameters:[String : AnyObject]? = nil,clazz:AnyClass, completionHandler:(LighHTTPResult?) -> Void)
//    {
//        showIndicatorView(indicatorViewInView)
//        discardRequestByCacheWithUrl(url)
//        
//         let request = self.createRequest(method: AlamofireMethodByLighHttpRequest(method: method!), URLString: url, parameters: parameters, encoding: ParameterEncoding.URL).responseResultObject(clazz, completionHandler: { (result) -> Void in
//            
//            completionHandler(result);
//            
//            self.hideIndicatorView(indicatorViewInView);
//            self.discardRequestByCacheWithUrl(url)
//            
//         })
//        urlByRequestMapping[url] = request
//    }
//    
//    
//    //请求一个对象集合
//   class  func requestResultObjectArray(indicatorViewInView:UIView,method:LighHttpRequestMethod? = .POST,url:String,parameters:[String : AnyObject]? = nil,clazz:AnyClass, completionHandler:(LighHTTPResult?) -> Void)
//    {
//        showIndicatorView(indicatorViewInView)
//        discardRequestByCacheWithUrl(url)
//        
//        
//        let request = self.createRequest(method: AlamofireMethodByLighHttpRequest(method: method!), URLString: url, parameters: parameters, encoding: ParameterEncoding.URL).responseResultObjectArray(clazz, completionHandler: { (result) -> Void in
//            
//
//            completionHandler(result)
//        
//            self.hideIndicatorView(indicatorViewInView);
//            self.discardRequestByCacheWithUrl(url)
//        
//
//        })
//        
//                urlByRequestMapping[url] = request
//    }
}