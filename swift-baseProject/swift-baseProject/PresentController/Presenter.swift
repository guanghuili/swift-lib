//
//  Presenter.swift
//  XingNang
//
//  Created by ligh on 16/4/18.
//  Copyright © 2016年 ligh. All rights reserved.
//

import Foundation

typealias Fetcher = protocol<DataFetcher>

/*呈现着协议
 */
protocol Presenter {

    associatedtype T
    associatedtype PersentContext  = (T) -> Void
    
    var fetcher:Fetcher{get set}
    
    func process() -> Self
    
    func present(context:PersentContext) -> Self
    
}