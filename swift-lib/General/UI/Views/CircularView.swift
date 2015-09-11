//
//  Circular.swift
//  Bag
//
//  Created by ligh on 15/8/22.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/**
圆形view
**/
class CircularView : UIView {

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.width/2.0;
    }
    
}