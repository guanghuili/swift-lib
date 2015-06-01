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
        super.viewDidLoad()
     
        var dict:NSMutableDictionary = ["userName":"a","age":"1","order":["orderID":"aabrfdfsdfsdf"]]
        
        let user = JSONModelParser.sharedManager.swiftObjWithDict(dict,cls:User.self) as! User;
       
        println(user.age)

    }
    

    @IBAction func show(sender: AnyObject) {
       
        
        // With hash

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }


}

