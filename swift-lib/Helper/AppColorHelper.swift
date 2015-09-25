//
//  AppColorHelper.swift
//  swift-lib
// app  基于配置文件的color管理
//  Created by ligh on 15/9/25.
//  Copyright © 2015年 ligh. All rights reserved.
//

import Foundation

/**
app  基于配置文件的color管理

如果xcode安装了SuggestedColors插件 xib 和 storyboard中可以直接显示这些自定义色值
自定义色值文件配置见SuggestedColors.plist


AppColor会读取 SuggestedColors.plist 配置文件
SuggestedColors.plist是插件SuggestedColors的配置 请不要更改名称
SuggestedColors插件可以在xib storyboard中显示自定义的颜色

**/
enum AppColor:String {
    
    case VC_BG_Color   = "vc_bg_color"
    case Line_Color    = "line_color"
    case Enable_Color  = "enable_color"
    case Disable_Color = "disable_color"
    
    
    func color() ->UIColor? {
     
        
        if let filePath = NSBundle.mainBundle().pathForResource("SuggestedColors.plist", ofType:nil ) {
            
            if let hextColor = (NSDictionary(contentsOfFile: filePath)?.objectForKey("colors") as? NSDictionary)?.objectForKey(self.rawValue) as? String{
                
                   return UIColor(hexString: hextColor)
            }

        }
                
        return nil;
    }
    
}