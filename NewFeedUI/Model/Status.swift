//
//  Post.swift
//  NewFeedUI
//
//  Created by Le Duy Anh on 8/24/20.
//  Copyright © 2020 Le Duy Anh. All rights reserved.
//

import Foundation

var listAvatar = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6"]
var listImg = ["img1", "img2", "img3", "img4", "img5", "", "", "", "", ""]
var listName: [String] = ["Bùi Kim Quyên", "Võ An Phước Thiện", "Phạm Nguyễn Trân", "Dương Hoài Phương",
                "Phan Vinh Bính", "Võ Minh Thư", "Phan Huỳnh Dung", "Nguyễn Vân Anh", "Nguyễn Thế Vinh", "Nguyen Thi Bích"]
var listContent = ["Nam iaculis mi ac tellus viverra, ac semper nunc euismod. Nam eget lacinia augue. Duis tempus eros vitae tortor gravida",
                "Duis tempus eros vitae tortor gravida, rhoncus tincidunt sapien",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus hendrerit orci condimentum turpis.",
                "consectetur adipiscing elit. Phasellus hendrerit",
                "ac semper nunc euismod. Nam eget lacinia augue. Duis tempus eros vitae",
                "consectetur adipiscing elit. Phasellus hendrerit orci",
                "dolor sit amet, consectetur adipiscing elit. Phasellus hendrerit",
                "Nam eget lacinia augue. Duis tempus eros vitae tortor gra"]
var listBool = [true, false]

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
        let emptyStatus = getStatus()
        
        let listStatusEmpty = [Status](repeating: emptyStatus, count: 20);
        
        let listStatus = listStatusEmpty.map { status -> Status in
            return getStatus()
        }
        return listStatus
    }
    
    private static func getStatus() -> Status {
        return Status(name: listName[Int.random(in: 0...listName.count - 1)],
                    image: listImg[Int.random(in: 0...listImg.count - 1)],
                    avatar: listAvatar[Int.random(in: 0...listAvatar.count - 1)],
                    content: listContent[Int.random(in: 0...listContent.count - 1)],
                    liked: listBool[Int.random(in: 0...listBool.count - 1)],
                    numberOfLike: Int.random(in: 1...10),
                    numberOfComment: Int.random(in: 1...10),
                    numberOfShare: Int.random(in: 1...10),
                    comments: getListComment())
    }
    
    private static func getListComment() -> [Comment] {
        let emptyComment = getComment()
        let arrEmptyComment = [Comment](repeating: emptyComment, count: 20);
        let listComment = arrEmptyComment.map { comment -> Comment in
            return getComment()
        }
        return listComment
    }
    
    private static func getComment() -> Comment {
        return Comment(avatar: listAvatar[Int.random(in: 0...listAvatar.count - 1)],
                       name: listName[Int.random(in: 0...listName.count - 1)],
                       content: listContent[Int.random(in: 0...listContent.count - 1)])
    }
}

class Comment {
    var avatar: String
    var name: String
    var content: String
    
    init(avatar: String, name: String, content: String) {
        self.avatar = avatar
        self.name = name
        self.content = content
    }
}
