//
//  GeneralTableViewCell.swift
//  testTableViewSegue
//
//  Created by Dovran on 14.08.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class GeneralTableViewCell: UITableViewCell {

    
    @IBOutlet weak var generalImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
