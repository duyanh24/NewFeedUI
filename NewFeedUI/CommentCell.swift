//
//  CommentCell.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/23/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var avatarCommentImage: UIImageView!
    @IBOutlet weak var containerCommentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpUI() {
        avatarCommentImage.layer.cornerRadius = avatarCommentImage.frame.size.height / 2
        avatarCommentImage.clipsToBounds = true
        containerCommentView.dropShadow()
    }
}

extension UIView {

    func dropShadow() {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.gray.cgColor
      layer.shadowOpacity = 0.2
      layer.shadowOffset = .zero
      layer.shadowRadius = 10
      layer.shouldRasterize = true
      layer.rasterizationScale = UIScreen.main.scale
    }
}