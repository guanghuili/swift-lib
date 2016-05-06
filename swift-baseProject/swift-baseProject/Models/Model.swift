//
//  Model.swift
//  XingNang
//
//  Created by ligh on 16/4/18.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation

protocol Model {
    
    func map<U>(f:Self -> U) -> U
    
}

extension Model {
    
    func map<U>(f:Self -> U) -> U {
        return f(self)
    }
   
}