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
      

                
        LighHttpRequestManager.requestObject(self.contentView, method: .GET, url: "http://m.weather.com.cn/data/101110101.html", parameters: nil, clazz: Weather.self) { (httpResult) -> Void in

                    
                    let result:LighHTTPResult = httpResult! as LighHTTPResult;
                    let weather:Weather = result.dataObj! as! Weather;
                    
                    
                    println(weather.city)
        }
                
        
   
        
    
    
    }
    

    @IBAction func show(sender: AnyObject) {
       
        
        // With hash

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }


}

