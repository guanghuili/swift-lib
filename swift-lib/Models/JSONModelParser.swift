//
//  JSONModelParser.swift
//  swift-lib
//
//  Created by ligh on 15/6/1.
//  Copyright (c) 2015年 ligh. All rights reserved.
//使用方式
//var dict:NSMutableDictionary = ["userName":"a","age":"1","order":["orderID":"aabrfdfsdfsdf"]]
//let user = JSONModelParser.sharedManager.swiftObjWithDict(dict,cls:User.self) as! User;
//println(user.age)
//

import Foundation

@objc protocol JSONModelParserProtocol{
    
    /**
    自定义的类型映射表
    
    :returns: 返回[属性名：自定义对象名称]
    */
    static func JSONKeyByClassMapping()->[String:String]?
}

class JSONModelParser {
    
    /// 创建单例
    static let sharedManager = JSONModelParser()

/// MARK:- 使用字典转模型
    /**
    使用字典转模型
    
    :param: dict 数据字典
    :param: cls  模型的类
    
    :returns: 实例化类的对象
    */
    func swiftObjWithDict(dict:NSDictionary,cls:AnyClass) ->AnyObject?
    {
        
        /// 取出模型类字典
        let dictInfo = GetAllModelInfo(cls)

        /// 实例化对象
        var obj:AnyObject = cls.alloc()
        
        for(k,v) in dictInfo
        {
            
            if let value:AnyObject? = dict[k]
            {
                
                /// 如果是基本数据类型直接kvc
                if v.isEmpty && value !== nil && (value !== NSNull())
                {
                   println(k)
                  obj.setValue(value, forKey: k)
                    
                    
                }else {
                    
            
                    let type = "\(value?.classForCoder)" // $$$$$ 取出某一个对象所属的类
                    
                
                    if type.contains("NSDictionary")
                    {
                        
                     if let subObj:AnyObject? = swiftObjWithDict(value as!NSDictionary, cls: NSClassFromString(v)){
                        
                            obj.setValue(subObj, forKey: k)
                     }
                        
                    } else if type.contains("NSArray")
                    {
                        // value 是数组
                        // 如果是数组如何处理？ 遍历数组，继续处理数组中的字典
                        if let subObj:AnyObject? = swiftObjWithArray(value as!NSArray, cls: NSClassFromString(v)){
                            
                            obj.setValue(subObj, forKey: k)
                        }
                    }
                }
              
            }

        }
        

        return obj
    }
    
   
/// MARK:- 将数组转化成模型数组
    /**
    将数组转化成模型数组
    
    :param: array 数组
    :param: cls   模型类
    
    :returns: 模型数组
    */
    func swiftObjWithArray(array:NSArray,cls:AnyClass) ->AnyObject?{
        
        var result = [AnyObject]()
        
        for value in array{
            let type = "\(value.classForCoder)"   // $$$$$
            
            if type.contains("NSDictionary")
            {
                
                if let subObj:AnyObject = swiftObjWithDict(value as! NSDictionary, cls: cls){
                    result.append(subObj)   // $$$$$
                }
                
            } else if type.contains("NSArray")
            {
                if let subObj:AnyObject = swiftObjWithArray(value as! NSArray, cls: cls){
                    result.append(subObj)
                }
            }
        }
        
        return result
    }

    /// 缓存字典
    var modleCache = [String:[String:String]]() // $$$$$
    
/// MARK:- 获取模型类的所有信息
    /**
    获取模型类的所有信息
    
    :param: cls 模型类
    
    :returns: 完整信息字典
    */
    func GetAllModelInfo(cls:AnyClass)->[String:String]{
        
        /// 先判断是否已经被缓存
        if let cache = modleCache["\(cls)"]{
          //  println("\(cls)类已经被缓存")
            return cache
        }
        
        /// 循环查找父类，但是不会处理NSObject
        var currentcls:AnyClass = cls
        
        /// 定义模型字典
        var dictInfo = [String:String]()
        
        /// 循环遍历直到NSObject
        while let parent:AnyClass = currentcls.superclass(){  // $$$$$
            
            dictInfo.merge(GetModelInfo(currentcls))
            
            currentcls = parent
        }
        
        /// 写入缓存
        modleCache["\(cls)"] = dictInfo
        
        return dictInfo
    }
    
/// MARK:- 获取给定类的信息
    func GetModelInfo(cls:AnyClass) ->[String:String]{
        
        /// 判断是否遵循了协议，一旦遵循协议就是有自定义对象
        var mapping:[String : String]?
        if (cls.respondsToSelector("customeClassMapping")){    // $$$$$
            
            /// 得到属性字典
            mapping = cls.JSONKeyByClassMapping()

        }
        
        /// 必须用UInt32否则不能调用
        var count:UInt32 = 0
        
        let ivars = class_copyIvarList(cls, &count)

        var dictInfo = [String:String]()
        
        for i in 0..<count{
            /// 必须再强转成Int否则不能用来做下标
            let ivar = ivars[Int(i)]
            
            let cname = ivar_getName(ivar)
            let name = String.fromCString(cname)!
            
            /// 去属性字典中取，如果没有就使用后面的变量
            let type = mapping?[name] ?? ""   // $$$$$
         
            
            dictInfo[name] = type
            
        }
        /// 释放
        free(ivars)
        return dictInfo
    }
    
/// MARK:- 加载属性列表
    func loadProperties(cls:AnyClass)
    {
        /// 必须用UInt32否则不能调用
        var count:UInt32 = 0

        let properties = class_copyPropertyList(cls, &count)
        
        println("有 \(count) 个属性")
        
        for i in 0..<count{
            /// 必须再强转成Int否则不能用来做下标
            let property = properties[Int(i)]
            
            let cname = property_getName(property)
            let name = String.fromCString(cname)!
            
            let ctype = property_getAttributes(property)
            let type = String.fromCString(ctype)!
            
            println(name + "--------" + type)
        }
        /// 释放
        free(properties)
        /// 基本数据类型不对，swift数组和字符串不对
    }
    
/// MARK:- 加载成员变量
    func loadIVars(cls:AnyClass)
    {
        
        /// 必须用UInt32否则不能调用
        var count:UInt32 = 0
        
        let ivars = class_copyIvarList(cls, &count)
        
        
        for i in 0..<count{
            /// 必须再强转成Int否则不能用来做下标
            let ivar = ivars[Int(i)]
            
            let cname = ivar_getName(ivar)
            let name = String.fromCString(cname)!
            
            let ctype = ivar_getTypeEncoding(ivar)
            let type = String.fromCString(ctype)!
            
            println(name + "--------" + type)
        }
        /// 释放
        free(ivars)
        /// 能够检测通过
    }
    
}

/// 相当于添加分类，泛型，拼接字典
extension Dictionary
{
    mutating func merge<K,V>(dict:[K:V]){
        for (k,v) in dict{
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}
