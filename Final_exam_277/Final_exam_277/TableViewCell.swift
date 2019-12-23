//
//  TableViewCell.swift
//  Final_exam_277
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fireLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //titleLabel.adjustsFontSizeToFitWidth = true
        //titleLabel.baselineAdjustment = .alignCenters
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
