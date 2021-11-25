//
//  post.swift
//  SW-9Tears-iOS
//
//  Created by 김부성 on 2021/11/25.
//

import Foundation

// Posts
struct Posts: ModelType {
    let post: [Post]
}

// MARK: - Post
struct Post: Codable {
    let id: Int
    let title, nickname: String
    let createdAt: Date
    let commentCount, likeCount, dislikeCount, stickerCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, nickname
        case createdAt = "created_at"
        case commentCount = "comment_count"
        case likeCount = "like_count"
        case dislikeCount = "dislike_count"
        case stickerCount = "sticker_count"
    }
}
