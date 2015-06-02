//
//  UIi.swift
//  swift-lib

//  Created by ligh on 15/6/2.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation

/**
    为UIImageView添加扩展 支持下载图片功能
    并且提示下载进度
**/
extension UIImageView
{

    
    func setImagePath(path:String)
    {
        
        self.viewWithTag(99999)?.removeFromSuperview()
        
        //显示下载进度
        var  hudView:GradientProgressView = GradientProgressView(frame: CGRectMake(0,0, self.width, 2.5))
        hudView.tag = 99999
        self.addSubview(hudView);
        hudView.y = (0 > self.y) ? abs(self.y) : 0;
        hudView.startAnimating();

        
        sd_setImageWithURL(NSURL(string: path), placeholderImage: nil, options: SDWebImageOptions.RetryFailed, progress:
            { (receivedSize, expectedSize) -> Void in
            
                
                hudView.progress = CGFloat( Float(receivedSize)/Float(expectedSize) )
 
                
            }, completed: {(image, error, cacheType, nsurl) -> Void in
        
        
                hudView.stopAnimating();
                hudView.removeFromSuperview()
                
            })

        
    }
}