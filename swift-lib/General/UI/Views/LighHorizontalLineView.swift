//
//  LighLineView.swift
//  Bag
//
//  Created by ligh on 15/8/16.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

/**
水平线 自动调整高度
**/
class LighHorizontalLineView: UIView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.height = 0.5
        self.backgroundColor = UIColor(hexString: "#F1F6F8")
    }

}
