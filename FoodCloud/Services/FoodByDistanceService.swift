//
//  FoodByDistanceService.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 17..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct FoodByDistanceService: APIService, RequestService{
    
    static let shareInstance = FoodByDistanceService()
    let URL = url("/posts")
    typealias NetworkData = FoodListByDistanceData
    
    func getListByDistance(lat: Double, lon: Double, completion: @escaping ([FoodByDis]) -> Void, error: @escaping (Int) -> Void) {
        let disURL = URL + "/1?lat=\(lat)5&lon=\(lon)"
        
        gettable(disURL, body: nil, header: nil) { res in
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
