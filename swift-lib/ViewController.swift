//
//  ViewController.swift
//  swift-lib
//
//  Created by ligh on 15/5/30.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit


class ViewController: LighBaseViewController {


    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        LighHttpRequestManager.requestJSON(self.view, url: "http://api.map.baidu.com/telematics/v3/weather?location=%E5%8C%97%E4%BA%AC&output=json&ak=BvuFycR82UEUtLshZSG1uNGw&mcode=xxxxxxxx") { (json) -> Void in
            
            NSLog("%@",json as! NSDictionary)
        }
    }
 

}

