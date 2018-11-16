//
//  UserInfoService.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 17..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct UserInfoService: APIService, RequestService{
    
    static let shareInstance = UserInfoService()
    let URL = url("/users")
    typealias NetworkData = UserInfoData
    
    func getListByDistance(id: Int, completion: @escaping (UserInfo) -> Void, error: @escaping (Int) -> Void) {
        let userURL = URL + "/\(id)"
        
        gettable(userURL, body: nil, header: nil) { res in
            switch res {
            case .success(let UserInfoData ):
                let data = UserInfoData.data
                completion(data)
            case .successWithNil(_):
                break
            case .error(let errCode):
                error(errCode)
            }
        }
    }
    
}
