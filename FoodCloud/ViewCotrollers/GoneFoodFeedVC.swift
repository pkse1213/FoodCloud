//
//  GoneFoodFeedVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class GoneFoodFeedVC: UIViewController {
    @IBOutlet weak var foodFeedTvC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavi()
        dataByTime()
    }
    var foodByTimeList = [FoodByTime]() {
        didSet {
            foodFeedTvC.reloadData()
        }
    }
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        
        navigationItem.titleView = imv
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
}

extension GoneFoodFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodByTimeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodFeedTvC.dequeueReusableCell(withIdentifier: "MainFoodFeedCell") as! MainFoodFeedCell
        cell.soldOutView.applyRadius(radius: 10)
        let food = foodByTimeList[indexPath.row]
        cell.addressLbl.text = food.postsPlaces
        cell.dateLabel.text = "유통기한: " + food.postsExpire
        cell.foodNameLbl.text = food.postsTitle
        cell.SellernameLbl.text = food.userName
        cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
        cell.sellerImgV.imageFromUrl(food.userProfile, defaultImgPath: "")
        cell.distanceLbl.isHidden = true
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "Food+Person", bundle: nil).instantiateViewController(withIdentifier: "FoodDetailVC") as! FoodDetailVC
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}
