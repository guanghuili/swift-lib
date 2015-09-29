//
//  GCDExtension.swift
//  swift-lib
//
//  Created by ligh on 15/9/29.
//  Copyright © 2015年 ligh. All rights reserved.
//

import Foundation

//执行的任务别名
typealias Task = (cancel:Bool) -> Void


/**
  延迟 time 秒执行

- parameter time: 延迟的时间（秒）
- parameter task: 执行的任务回调

- returns: 返回当前任务 可以取消该任务
*/
func gcde_delay(time:NSTimeInterval,task:()->()) -> Task? {
    

    func dispatch_later(block:()->())  {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time*Double(NSEC_PER_SEC))), dispatch_get_main_queue(), block)
        
    }
    
    //具体要执行的任务
    var closure:dispatch_block_t? = task
    //执行的任务
    var result: Task?
    
    //此闭包调用具体要执行的任务
    let delayedClosure:Task = {
        
        cancel  in
        if let internalClosure = closure {
            
            if(cancel == false) {
                dispatch_async(dispatch_get_main_queue(), internalClosure)
                closure = nil
            }
        }
        
        closure = nil
        
    }
    
    //返回的result
    result = delayedClosure
    
    //开始执行任务
    dispatch_later {
        
        if let delayedClosure = result {
            
            delayedClosure(cancel: false);

        }
    }
    
    //返回结果 可以调用取消
    return result
    
}