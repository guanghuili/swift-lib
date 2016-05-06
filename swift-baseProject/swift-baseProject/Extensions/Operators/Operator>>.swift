//
//  Operator>>.swift
//  XingNang
//
//  Created by ligh on 16/4/18.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation

typealias Task =  (Any) -> Any


infix operator >>{
    associativity left precedence 160
}


func >>(left:Task, right:Task) -> Task {
    
    return { value in
        
            right( left(value) )
        
         }
    
}