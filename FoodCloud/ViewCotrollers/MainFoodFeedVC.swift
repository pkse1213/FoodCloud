//
//  MainFoodFeedVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MainFoodFeedVC: UIViewController {
    @IBOutlet weak var foodFeedTvC: UITableView!
    
    var y = 127.05000
    var x = 37.5565
    var address = "한양대학교 올림픽체육관"
    var choose = 0
    var foodByDisList = [FoodByDis]() {
        didSet {
            foodFeedTvC.reloadData()
        }
    }
    var foodByTimeList = [FoodByTime]() {
        didSet {
            foodFeedTvC.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavi()
        dataByTime()
    }
    
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        navigationItem.titleView = imv
    }
    
    @IBAction func filterAction(_ sender: UISegmentedControl) {
        choose = sender.selectedSegmentIndex
        if sender.selectedSegmentIndex == 0 {
            dataByTime()
        } else  {
            dataByDistance()
        }
    }
    @IBAction func messageAction(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Message", bundle: nil).instantiateViewController(withIdentifier: "MessageListVC") as! MessageListVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupTableView(){
        foodFeedTvC.delegate = self
        foodFeedTvC.dataSource = self
    }
    
    private func dataByTime() {
        FoodByTimeService.shareInstance.getListByTime(completion: { (foods) in
            self.foodByTimeList = foods
        }) { (err) in
             print("최신순 실패")
        }
    }
    private func dataByDistance() {
        FoodByDistanceService.shareInstance.getListByDistance(lat: x, lon: y, completion: { (foods) in
             self.foodByDisList = foods
        }) { (err) in
            print("거리순 실패")
        }
    }
}

extension MainFoodFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if choose == 0{
            return foodByTimeList.count
        } else {
            return foodByDisList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodFeedTvC.dequeueReusableCell(withIdentifier: "MainFoodFeedCell") as! MainFoodFeedCell
        /*
         "posts_id": 158,
         "posts_title": "빠나나 빠나나",
         "posts_img": "https://s3.ap-northeast-2.amazonaws.com/cjimage2/posts/2018.11.16/img_food2.jpg",
         "posts_places": "서울특별시 성동구 왕십리로 289",
         "posts_info": "코스트코에서 너무 많이 샀는데 못 먹을 것 같아요. ",
         "posts_expire": "2018.11.23",
         "posts_lat": 37.560215,
         "posts_isSell": 0,
         "user_id": 3,
         "posts_lon": 127.03608,
         "user_name": "관섭",
         "user_profile": "https://s3.ap-northeast-2.amazonaws.com/cjimage2/posts/users/user2.png",
         "distance": 0,
         "distanceUnit": "m"
 */
        
        if choose == 0{
            
            let food = foodByTimeList[indexPath.row]
            cell.addressLbl.text = food.postsPlaces
            cell.dateLabel.text = "유통기한: " + food.postsExpire
            cell.foodNameLbl.text = food.postsTitle
            cell.SellernameLbl.text = food.userName
            cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
            cell.sellerImgV.imageFromUrl(food.userProfile, defaultImgPath: "")
            cell.distanceLbl.isHidden = true
        } else {
            let food = foodByDisList[indexPath.row]
            cell.addressLbl.text = food.postsPlaces
            cell.dateLabel.text = "유통기한: " + food.postsExpire
            cell.foodNameLbl.text = food.postsTitle
            cell.SellernameLbl.text = food.userName
            cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
            cell.sellerImgV.imageFromUrl(food.userProfile, defaultImgPath: "")
            cell.distanceLbl.text = "\(food.distance)km"
            cell.distanceLbl.isHidden = false
        }
        
       return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Food+Person", bundle: nil).instantiateViewController(withIdentifier: "FoodDetailVC") as! FoodDetailVC
        if choose == 0{
            vc.timeFood = foodByTimeList[indexPath.row]
        } else {
            vc.disFood = foodByDisList[indexPath.row]
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
