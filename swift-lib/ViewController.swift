//
//  ViewController.swift
//  swift-lib
//
//  Created by ligh on 15/5/30.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ViewController: LighBaseViewController {
    
    
    var bu:UITextField?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
     
        
       self.view.backgroundColor = AppColor.Line_Color.color()

        print("ViewController")
        
//        Alamofire.request(.GET, "http://www.weather.com.cn/data/sk/101010100.html").responseJSON { (request, response, result) -> Void in
//            
//            //Weather.objectFromJSON(NSObject)
//
//            let user = Mapper<WeatherInfo>().map(result.value);
//            print("\(user?.weatherinfo?.city)")
//            
//        }

        
//        Alamofire.request(.GET, HttpURLPath.LoginURLPath.rawValue).responseObject { (response:WeatherInfo?, error:ErrorType?) -> Void in
//            
//            print("=====\(response?.weatherinfo?.city)")
//
//            
//        }
        
        
//        
    
        gcde_delay(2){
            
            print("执行了");
        }
        
        
        
    }

   

}

