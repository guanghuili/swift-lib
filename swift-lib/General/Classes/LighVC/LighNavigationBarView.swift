//
//  NavigationBarView.swift
//  AirQ
//
//  Created by ligh on 14-10-16.
//  Copyright (c) 2014年 Sprint. All rights reserved.
//

import Foundation
import UIKit

//导航栏
class LighNavigationBarView: UIView
{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    
    func setTitle(title:String)
    {
        titleLabel.text = title;
    }
    
    
    
}