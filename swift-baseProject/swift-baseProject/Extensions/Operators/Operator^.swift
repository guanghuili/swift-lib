//
//  Operator^.swift
//  XingNang
//
//  Created by ligh on 16/4/12.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation


/**
 *  ?: 简化三元运算符 
 *
 *  let contact:String?
 *  let contanct2:String = contact ^ "暂无联系方式"
 *  contanct2 == "暂无联系方式"
 *
 */
infix operator ^{

    associativity none
    precedence 160

}

/**
 对Dictionary添加^运算符比较
 
 - parameter left
 - parameter right
 
 - returns: 如果left==nil 返回right
 */
func ^<Key,Value>(left:[Key:Value]?, right:[Key:Value]) -> [Key:Value] {
    
    if let l = left {
        return l
    }
    
    return right
    
}


/**
 对数组添加^操作符
 
 - parameter left
 - parameter right
 
 - returns:  如果left==nil 返回right
 */
func ^ <Value>(left:[Value]?, right:[Value]) -> [Value] {
    
    if let l = left {
        return l
    }
    
    return right
    
}


/**
 对AnyObject添加^运算符
 
 - parameter left:  input1
 - parameter right: input2
 
 - returns: 如果input1==nil 返回input2
 */
func ^ <T>(left:T?, right:T) -> T {
    
    if let l = left {
        return l
    }
    
    return right
    
}