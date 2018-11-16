//
//  FoodFeedListService.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 17..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct FoodByTimeService: APIService, RequestService{
    
    static let shareInstance = FoodByTimeService()
    let URL = url("/posts")
    typealias NetworkData = FoodListByTimeData
    
    func getListByTime(completion: @escaping ([FoodByTime]) -> Void, error: @escaping (Int) -> Void) {
        let timeURL = URL + "/0"
        gettable(timeURL, body: nil, header: nil) { res in
            switch res {
            case .success(let FoodFeedListData):
                let data = FoodFeedListData.data
                completion(data)
            case .successWithNil(_):
                break
            case .error(let errCode):
                error(errCode)
            }
        }
    }
    
    
}
