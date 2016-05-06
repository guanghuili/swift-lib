//
//  UserCell.swift
//  XingNang
//
//  Created by ligh on 16/4/12.
//  Copyright © 2016年 ligh. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setData(data: AnyObject) {
        label.text = data as? String
        label.sizeToFit()
    }
    
}
