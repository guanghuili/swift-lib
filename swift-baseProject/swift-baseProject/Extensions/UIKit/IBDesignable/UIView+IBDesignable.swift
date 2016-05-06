//
//  UIView+IBDesignable.swift
//  XingNang
//
//  Created by ligh on 16/4/13.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit

@IBDesignable class UIView_IBDesignable: UIView {

    @IBInspectable var cornerRadius:CGFloat?

    
    func setCornerRadius(cornerRadius:CGFloat)  {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
    }
    
    
    @IBInspectable var Padding: CGFloat = 0
    
//    override func  textRectForBounds(bounds: CGRect) -> CGRect {
//        return CGRectInset(bounds, Padding, Padding)
//    }
//    
//    override func editingRectForBounds(bounds: CGRect) -> CGRect {
//        return textRectForBounds(bounds)
//    }

    

}
