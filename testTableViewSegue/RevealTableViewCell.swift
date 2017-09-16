//
//  RevealTableViewCell.swift
//  testTableViewSegue
//
//  Created by Dovran on 14.08.17.
//  Copyright © 2017 Dovran Reyimov. All rights reserved.
//

import UIKit

class RevealTableViewCell: UITableViewCell {

    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var revealImages: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
