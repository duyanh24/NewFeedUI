//
//  StatusCellWithoutImage.swift
//  NewFeedUI
//
//  Created by AnhLD on 8/25/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import UIKit

class StatusCellWithoutImage: UITableViewCell {

    @IBOutlet weak var avatarStatusImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var bottomStackViewContraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var numberOfReactLabel: UILabel!
    
    @IBOutlet weak var funReactImage: UIImageView!
    @IBOutlet weak var sadReactImage: UIImageView!
    @IBOutlet weak var angryReactImage: UIImageView!
    
    var liked = false
    
    @IBAction func likeButtonClick(_ sender: Any) {
        if liked == true {
            liked = false
            likeButton.backgroundColor = UIColor.white
            likeButton.setTitleColor(UIColor.gray, for: .normal)
            likeButton.setImage(UIImage(named: "dislike"), for: .normal)
        } else {
            liked = true
            likeButton.backgroundColor = UIColor(red: 66/255.0, green: 103/255.0, blue: 178/255.0, alpha: 1.0)
            likeButton.setTitleColor(UIColor.white, for: .normal)
            likeButton.setImage(UIImage(named: "like contour"), for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        
        avatarStatusImageView.layer.cornerRadius = avatarStatusImageView.frame.size.height / 2
        avatarStatusImageView.clipsToBounds = true
       
        likeButton.layer.cornerRadius = likeButton.frame.size.height / 2
        commentButton.layer.cornerRadius = commentButton.frame.size.height / 2
        shareButton.layer.cornerRadius = shareButton.frame.size.height / 2
        
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.dropShadow()
        
        funReactImage.dropShadow()
        sadReactImage.dropShadow()
        angryReactImage.dropShadow()
    }
    
    func setUpData(status: Status) {
        nameLabel.text = status.name
        avatarStatusImageView.image = UIImage(named: status.avatar)
        statusLabel.text = status.content
        numberOfReactLabel.text = String(status.numberOfLike) + " - " + String(status.numberOfComment) + " Comment - " + String(status.numberOfShare) + " Share"
        
        if status.liked {
            liked = true
            likeButton.backgroundColor = UIColor(red: 66/255.0, green: 103/255.0, blue: 178/255.0, alpha: 1.0)
            likeButton.setTitleColor(UIColor.white, for: .normal)
            likeButton.setImage(UIImage(named: "like contour"), for: .normal)
        } else {
            likeButton.backgroundColor = UIColor.white
            likeButton.setTitleColor(UIColor.gray, for: .normal)
            likeButton.setImage(UIImage(named: "dislike"), for: .normal)
        }
    }
}
