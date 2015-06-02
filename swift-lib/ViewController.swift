//
//  ViewController.swift
//  swift-lib
//
//  Created by ligh on 15/5/30.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: LighBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      

        let imgaeView:UIImageView =  UIImageView(frame: self.contentView.frame);
//        
//        imgaeView.sd_setImageWithURL(NSURL(string: "http://b.hiphotos.baidu.com/image/pic/item/30adcbef76094b365d14aceca1cc7cd98d109d29.jpg"))
        self.contentView.addSubview(imgaeView);
        

        imgaeView.setImagePath("http://img3.fengniao.com/travel/2_960/1623.jpg")
    
    
    }
    

    @IBAction func show(sender: AnyObject) {
       
        
        // With hash

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }


}

