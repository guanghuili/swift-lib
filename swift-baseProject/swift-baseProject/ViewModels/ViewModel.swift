//
//  ViewModel.swift
//  XingNang
//
//  Created by ligh on 16/4/18.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation

protocol ViewModel {
    
    associatedtype DataModel
    
    var model:DataModel{get set}
    
    init(model:DataModel)
    
    
}
