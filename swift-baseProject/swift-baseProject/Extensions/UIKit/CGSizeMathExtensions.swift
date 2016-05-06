//
//  CGSize+Math.swift
//  XingNang
//
//  Created by ligh on 16/4/21.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit

func *(l: CGSize,r: CGFloat)-> CGSize {
    
    return CGSize(width: r*l.width, height: r*l.height)
}


func /( l : CGSize, r: CGSize) -> CGSize {
    
    return CGSize(width:l.width/r.width,height: l.height/r.height)
}


func*(l: CGSize,r: CGSize)-> CGSize{
    return CGSize(width: l.width*r.width, height: l.height*r.height)
}

func -( l : CGSize, r: CGSize) -> CGSize {
    return CGSize(width:l.width-r.width,height: l.height-r.height)
}


func -( l : CGPoint, r: CGPoint) -> CGPoint { return CGPoint(x: l.x - r.x, y: l.y - r.y)
}


extension CGSize {
    var point: CGPoint {
        return CGPoint(x: self.width, y: self.height) }
}
