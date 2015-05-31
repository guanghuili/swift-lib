//
//  LighAlertView.swift
//  swift-lib
// 警告框view
//  Created by ligh on 15/5/30.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation

//
//
//
//
//
enum LightAlertViewStyle
{
    case Success
    case Error
    case Warning
    case Notice
    
}



class LighAlertView: NSObject
{

 
    class func showLighAlertView(title:String,msg:String,style:LightAlertViewStyle,buttonTitles:Array<String>,buttonClick:(Int)->Void)
    {
        let alert = SCLAlertView();

        for(var i = 0;i<buttonTitles.count;i++)
        {
            alert.addButton(buttonTitles[i], actionBlock: { (buttonIndex) -> Void in
                alert.hideView();
                buttonClick(buttonIndex);
            })
        }

        var sclAlertViewStyle = SCLAlertViewStyle.Success;
        var duration = -1.0;
        if(style == LightAlertViewStyle.Error)
        {
            sclAlertViewStyle = SCLAlertViewStyle.Error;
            
        }else if(style == LightAlertViewStyle.Warning)
        {
            sclAlertViewStyle = SCLAlertViewStyle.Warning;
            
        }else if(style == LightAlertViewStyle.Notice)
        {
            sclAlertViewStyle = SCLAlertViewStyle.Notice;
            duration = kDefaultAnimationDuration;
        }
        
        alert.showTitle(nil, title: title, subTitle: msg, style:sclAlertViewStyle, closeButtonTitle: nil, duration:duration);
    }
    
    class func showLighAlertView(title:String,msg:String,style:LightAlertViewStyle,doneButtonTitle:String,buttonClick:(Int)->Void)
    {
        showLighAlertView(title, msg: msg, style: style, buttonTitles: [doneButtonTitle], buttonClick:buttonClick);
    }
    
    
    class func showLighAlertView(title:String,msg:String,buttonClick:(Int)->Void)
    {
        showLighAlertView(title, msg: msg, style: LightAlertViewStyle.Success, buttonTitles: ["取消","完成"], buttonClick: buttonClick);
    }
    
    
}