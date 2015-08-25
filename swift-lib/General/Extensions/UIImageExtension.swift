//
//  UIImageExtension.swift
//  Bag
//
//  Created by ligh on 15/8/16.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation
import UIKit


enum ImageStyle : String {
    
    case AddTravelImageStyle = "icon_menu_add"
    case SaveImageStyle = "icon_big_save"
}


extension UIImage {
    
    
    /***
    **
    ** 根据imageStyle 创建UIImage
    **/
    class func imageForStyle(imageStyle:ImageStyle) ->UIImage? {

            return UIImage(named: imageStyle.rawValue)
    }
    
}


extension UIButton {
    

    func setImageStyle(imageStyle:ImageStyle, forState state: UIControlState) -> UIButton {
        
        self.setImage(UIImage.imageForStyle(imageStyle), forState: state)
        
        return self
    }
 
    
    func setImageStyleForNormalState(imageStyle:ImageStyle) -> UIButton {
        
        return self.setImageStyle(imageStyle, forState: UIControlState.Normal)
    }
    
    func setImageStyleForHighlightedState(imageStyle:ImageStyle) -> UIButton {
        
        return self.setImageStyle(imageStyle, forState: UIControlState.Highlighted)
    }
    
    func setImageStyleForDisabledState(imageStyle:ImageStyle) -> UIButton {
        
        return self.setImageStyle(imageStyle, forState: UIControlState.Disabled)
    }
    
    func setImageStyleForSelectedState(imageStyle:ImageStyle) -> UIButton {
        
        return self.setImageStyle(imageStyle, forState: UIControlState.Selected)
    }
    
}

