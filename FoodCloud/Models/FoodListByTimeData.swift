//
//  FoodFeedListData.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 17..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation

struct FoodListByTimeData: Codable {
    let message: String
    let data: [FoodByTime]
}

struct FoodByTime: Codable {
    let postsID: Int
    let postsTitle: String
    let postsImg: String
    let postsTime, postsPlaces, postsInfo, postsExpire: String
    let postsLat: Double
    let postsIsSell, userID: Int
    let postsLon: Double
    let available, userName: String
    let userProfile: String
    
    enum CodingKeys: String, CodingKey {
        case postsID = "posts_id"
        case postsTitle = "posts_title"
        case postsImg = "posts_img"
        case postsTime = "posts_time"
        case postsPlaces = "posts_places"
        case postsInfo = "posts_info"
        case postsExpire = "posts_expire"
        case postsLat = "posts_lat"
        case postsIsSell = "posts_isSell"
        case userID = "user_id"
        case postsLon = "posts_lon"
        case available
        case userName = "user_name"
        case userProfile = "user_profile"
    }
}
