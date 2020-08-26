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
    var numberOfLike: Int
    var numberOfComment: Int
    var numberOfShare: Int
    var comments: [Comment]
    
    init(name: String, image: String, avatar: String, content: String, liked: Bool, numberOfLike: Int, numberOfComment: Int, numberOfShare: Int, comments: [Comment]) {
        self.name = name
        self.image = image
        self.avatar = avatar
        self.content = content
        self.liked = liked
        self.numberOfLike = numberOfLike
        self.numberOfComment = numberOfComment
        self.numberOfShare = numberOfShare
        self.comments = comments
    }
    
    static func setData() -> [Status] {
        return Array(1...20).map { number -> Status in
            return getStatus()
        }
    }
    
    private static func getStatus() -> Status {
        return Status(name: FakeData.listName.randomElement() ?? "",
                      image: FakeData.listImg.randomElement() ?? "",
                      avatar: FakeData.listAvatar.randomElement() ?? "",
                      content: FakeData.listContent.randomElement() ?? "",
                      liked: FakeData.listBool.randomElement() ?? true,
                      numberOfLike: Int.random(in: 1...10),
                      numberOfComment: Int.random(in: 1...10),
                      numberOfShare: Int.random(in: 1...10),
                      comments: getListComment())
    }
    
    private static func getListComment() -> [Comment] {
        return Array(1...20).map { _ -> Comment in
            return getComment()
        }
    }
    
    private static func getComment() -> Comment {
        return Comment(avatar: FakeData.listAvatar.randomElement() ?? "",
                       name: FakeData.listName.randomElement() ?? "",
                       content: FakeData.listContent.randomElement() ?? "")
    }
}
