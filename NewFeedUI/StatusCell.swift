//
//  StatusCell.swift
//  NewFeedUI
//
//  Created by tuanna on 8/21/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {


    @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarStatusImageView: UIImageView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp() {
        avatarStatusImageView.layer.cornerRadius = avatarStatusImageView.frame.size.height / 2
        avatarStatusImageView.clipsToBounds = true
        
        likeButton.layer.cornerRadius = likeButton.frame.size.height / 2
        commentButton.layer.cornerRadius = commentButton.frame.size.height / 2
        shareButton.layer.cornerRadius = shareButton.frame.size.height / 2
    
        //heightImageConstraint.constant = 500
        
        if let image = UIImage(named: "download") {
            let ratio = image.size.width / image.size.height
            let newHeight = containerView.frame.width / ratio
            heightImageConstraint.constant = newHeight
        }
    }
}
