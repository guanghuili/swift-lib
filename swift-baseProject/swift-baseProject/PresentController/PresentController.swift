//
//  PresentController.swift
//  XingNang
//
//  Created by ligh on 16/4/12.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation

/**
 *  呈现控制器
 */
protocol PresentController {
    
    associatedtype DataControllerType  = protocol<DataController>
    var dataController:DataControllerType {get set}
    
    
}


