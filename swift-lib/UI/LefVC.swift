//
//  LefVC.swift
//  swift-lib
//
//  Created by ligh on 15/6/3.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import UIKit

class LefVC: LighBaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarTitle("左侧菜单")

    }


    @IBAction func push(sender: AnyObject)
    {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }

}
