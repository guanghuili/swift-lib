//
//  StringExtension.swift
//  swift-lib
//
//  Created by ligh on 14/10/18.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//

import Foundation

//String扩展
extension String
{
    
    //将String 转为NSString类型
    func asNSString() -> NSString
    {
   
        return self as NSString
    }
    
    //将String 转为Int32类型
    func intValue() -> Int?
    {
        return self.toInt();
    }
    
    //将String 转为Double类型
    func doubleValue() -> Double
    {
        return self.asNSString().doubleValue
    }
    
    //将String 转为Float类型
    func floatValue() -> Float
    {
        return self.asNSString().floatValue
    }

    //将String 转为Int类型
    func integerValue() -> Int
    {
        return self.asNSString().integerValue
    }
    
    //将String 转为Int64类型
    func longLongValue() -> Int64
    {
        return self.asNSString().longLongValue
    }
    
    //将String 转为Bool类型
    func boolValue() -> Bool
    {
        return self.asNSString().boolValue
    }
    
    
    //搜索字符最后出现的位置
    func lastRangeOfString(aString string:String) -> Range<String.Index>?
    {
        var range:Range<String.Index>? = self.rangeOfString(string, options: NSStringCompareOptions.BackwardsSearch, range: nil, locale: NSLocale.currentLocale())

        return range
    }
    
    //判断是否包含某一个字符串
    func containsOfString(aString string:String) -> Bool
    {
        var range:Range<String.Index>? = self.rangeOfString(string)
        return range != nil
    }

    /**
        获取字符串字符长度
    **/
    func length()->Int
    {
        return count(self);
    }

    
    //分割字符
    func split(s:String)->[String]
    {
        if s.isEmpty{
            var x=[String]()
            for y in self{
                x.append(String(y))
            }
            return x
        }
        return self.componentsSeparatedByString(s)
    }
    
    //去掉左右空格
    func trim()->String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    //是否包含字符串
    func contains(s:String)->Bool
    {

        let range:NSRange = (self as NSString).rangeOfString(s, options: NSStringCompareOptions.CaseInsensitiveSearch)

        return range.location != NSNotFound;
    }
    
    
    func isEqualToString(string aString:String) ->Bool {
        
        var selfString:NSString = self.asNSString()
        return selfString.isEqual(aString)
    }

    /***
     通过下标的方式 获取指定范围的字符
      let string:String = "ABCDEGG"
       string[0...5] //ABCDE
       string[1...5] //BCDE 5是结束位置 不是个数 如果是要截取多少个可以  string[startIndex...startIndex+4] //截取五个
    **/
    subscript (r: Range<Int>) -> String {
        get {

 
            let startIndex = advance(self.startIndex, r.startIndex)
            let endIndex = advance(startIndex, r.endIndex - r.startIndex)
            
            //return s.substringWithRange(Range(start: startIndex, end: endIndex)); 与下面的效果一样 下面是使用下标的方式获取
            
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
    

    /**
        截取字符串
        startIndex：开始位置
        count：截取的个数
    **/
    func subString(startIndex:Int,count:Int) -> String
    {
        
        if(startIndex>=self.length())
        {
            return "";
        }
        
        
        let maxCount = (self.length() - startIndex);
        let endIndex = count > maxCount ? maxCount : count;

        
        let advanceStartIndex = advance(0, startIndex)
        let advanceEndIndex = advance(advanceStartIndex,endIndex);
        
        return self[Range(start: advanceStartIndex, end: advanceEndIndex)]
    }
    
    
    //重复字符串
    func repeat(times: Int) -> String
    {
        var result = ""
        for i in 0...times {
            result += self
        }
        return result
    }
    
    //反转
    func reverse()-> String
    {
        var s=self.split("").reverse()
        var x=""
        for y in s{
            x+=y
        }
        return x
    }
    
    
}