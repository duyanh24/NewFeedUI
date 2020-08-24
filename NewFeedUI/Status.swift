//
//  Post.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/24/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import Foundation

class Status {
    var name: String
    var image: String
    var avatar: String
    var content: String
    var liked: Bool
    
    init(name: String, image: String, avatar: String, content: String, liked: Bool){
        self.name = name
        self.image = image
        self.avatar = avatar
        self.content = content
        self.liked = liked
    }
    
    static func setData() -> [Status] {
        let listStatus = [
            Status(name: "duy anh", image: "", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "Rectangle", content: "Hom nay troi dep qua", liked: false),
            Status(name: "duy anh", image: "Rectangle", avatar: "Rectangle", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "Rectangle", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true),
            Status(name: "duy anh", image: "download", avatar: "download", content: "Hom nay troi dep qua", liked: true)
        ]
        return listStatus
    }
}
