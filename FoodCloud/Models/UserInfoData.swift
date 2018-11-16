//
//  UserInfoData.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 17..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation

struct UserInfoData: Codable {
    let message: String
    let data: UserInfo
}

struct UserInfo: Codable {
    let posts: [Post]
    let userID: Int
    let userName: String
    let userProfile: String
    
    enum CodingKeys: String, CodingKey {
        case posts
        case userID = "user_id"
        case userName = "user_name"
        case userProfile = "user_profile"
    }
}

struct Post: Codable {
    let postsID: Int
    let postsTitle, postsInfo: String
    let postsImg: String
    
    enum CodingKeys: String, CodingKey {
        case postsID = "posts_id"
        case postsTitle = "posts_title"
        case postsInfo = "posts_info"
        case postsImg = "posts_img"
    }
}
