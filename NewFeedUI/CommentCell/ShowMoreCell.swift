//
//  ShowMoreCell.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/23/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class ShowMoreCell: UITableViewCell {

    @IBOutlet weak var showMoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        showMoreLabel.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
