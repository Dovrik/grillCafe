//
//  TableViewCell.swift
//  Melbourne Cafe
//
//  Created by Dovran on 30.07.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var generalImage: UIImageView!
    @IBOutlet weak var generalLabel: UILabel!
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var visualEffectVibrationView: UIVisualEffectView!
    
    
//    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
