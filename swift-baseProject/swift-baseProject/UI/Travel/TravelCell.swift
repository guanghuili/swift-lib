//
//  TravelCell.swift
//  XingNang
//
//  Created by ligh on 16/4/13.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit

class TravelCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle =  .None
        
    }

    override func setData(data: AnyObject) {
        let travel:Travel? = data as? Travel
        nameLabel.text = travel?.name
    }
}

extension TravelCell {
    
  
    
}