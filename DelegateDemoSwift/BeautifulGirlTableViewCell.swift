//
//  BeautifulGirlTableViewCell.swift
//  DelegateDemoSwift
//
//  Created by ying on 16/3/16.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class BeautifulGirlTableViewCell: UITableViewCell {

    @IBOutlet weak var girlImage: UIImageView!
    
    @IBOutlet weak var girlNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
