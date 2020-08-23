//
//  CommentCell.swift
//  NewFeedUI
//
//  Created by Apple on 8/23/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var avatarCommentImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarCommentImage.layer.cornerRadius = avatarCommentImage.frame.size.height / 2
        avatarCommentImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
