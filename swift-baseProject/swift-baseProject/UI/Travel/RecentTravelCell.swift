//
//  RecentTravelCell.swift
//  XingNang
//
//  Created by ligh on 16/4/13.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit

/// 最近的行程 即将开始的行程cell
class RecentTravelCell: UITableViewCell {

    
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
