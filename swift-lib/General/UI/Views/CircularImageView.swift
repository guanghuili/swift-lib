//
//  CircularImageView.swift
//  Bag
//
//  Created by ligh on 15/8/16.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/***
**
圆角UIImageView
**
**/
class CircularImageView: UIImageView {


   required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.width/2.0;
    }
    
   
}
