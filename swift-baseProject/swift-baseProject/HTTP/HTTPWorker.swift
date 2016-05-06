//
//  HTTPWorker.swift
//  XingNang
//
//  Created by ligh on 16/5/5.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ObjectMapper
import SVProgressHUD

/*http请求者
 */
class HTTPWorker: NSObject {
    
    /*单例对象 共享HTTPWorker实例
     */
    static let sharedInstance: HTTPWorker = {
        SVProgressHUD.setDefaultStyle(.Dark)
    
        return HTTPWorker()
    
    }()
    
    
    
    /*响应一个Data
     */
    func responseData<T>(router:HTTPRouter,transform:(NSData)->T?,completionHandler:((T?)->Void)?) {
        
        SVProgressHUD.show()
        
        
        Alamofire.request(router).responseData { response in
            
            SVProgressHUD.dismiss()
            
            
            /*if completionHandler = nil   return
             */
            guard let handler = completionHandler else {
                return
            }
     
        
            guard let value = response.result.map(transform) else {
                handler(nil)
                return
            }
            
            handler(value)
            
            
        }
        
    }
    
    /*响应一个JSON
     */
    func responseJSON(router:HTTPRouter,completionHandler:((JSON?)->Void)?) {

        self.responseData(router, transform: { JSON(data:$0) }, completionHandler: completionHandler)
        
    }
    
    func responseJSON<T>(router:HTTPRouter,transform:(JSON)->T?,completionHandler:((T?)->Void)?) {
    
        self.responseData(router, transform: { transform(JSON(data:$0)) }, completionHandler: completionHandler)
      
    }
    
    /*响应一个Object
     */
    func responseObject<T:Mappable>(router:HTTPRouter,completionHandler:(T?)->Void) {
        
        
        self.responseJSON(router) { (json) in
            
            let object = Mapper<T>().map(json?.object)
            completionHandler(object)

        }
        
    }

    
    /*响应一个array
     */
    func responseArray<T:Mappable>(queue: dispatch_queue_t? = nil,router:HTTPRouter, keyPath: String? = nil, completionHandler:([T]?)->Void) {
        
        Alamofire.request(router).responseArray(queue: queue,keyPath:keyPath) { (response: Response<[T], NSError>) in
            
            let object = response.result.value
            completionHandler(object)
            
        }
    
    }
    
    /*响应一个APIResult对象 dataObject属性被转为[String:AnyObject]
     */
    func responseAPIResult(queue: dispatch_queue_t? = nil,router:HTTPRouter, keyPath: String? = nil,completionHandler:(APIResult<[String:AnyObject]>?)->Void) {

        
        self.responseObject(router) { (result:APIResult<[String:AnyObject]>?) in
        
            completionHandler(result)
            
        }
        
    }
    
    /*响应一个APIResult对象 dataObject属性被转为DataObject 类型
     */
    func responseAPIResultObject<DataObject:Mappable>(queue: dispatch_queue_t? = nil,router:HTTPRouter, keyPath: String? = nil,completionHandler:(APIResult<DataObject>?)->Void) {
        
        self.responseObject(router) { (result:APIResult<DataObject>?) in
            
            result?.dataObject = result?.map({ data in
                Mapper<DataObject>().map(data)
            })
            
            completionHandler(result)
            
        }
        
    }

    /*响应一个APIResult对象 dataObject属性被转为[DataObject] 类型
     */
    func responseAPIResultArray<DataObject:Mappable>(queue: dispatch_queue_t? = nil,router:HTTPRouter, keyPath: String? = nil,completionHandler:(APIResult<[DataObject]>?)->Void) {
        
        
        self.responseObject(router) { (result:APIResult<[DataObject]>?) in
            
            
            result?.dataObject = result?.map({ data in
                Mapper<DataObject>().mapArray(data)
            })
            
            completionHandler(result)
            
        }
        
        
    }
    
    
 
    
    
}
