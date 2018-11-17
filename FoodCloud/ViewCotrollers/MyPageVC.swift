//
//  MyPageVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var listTbV: UITableView!
    @IBOutlet weak var profileImgV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var middleBtn: UIButton!
    @IBOutlet weak var middleLbl: UILabel!
    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    
    var userId = 5{
        didSet{
            initData()
        }
    }
    var info: UserInfo? {
        didSet {
            listTbV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        listTbV.delegate = self
        listTbV.dataSource = self
        initData()
    }
    private func initData() {
        UserInfoService.shareInstance.getUserInfoe(id: userId, completion: { (UserInfo) in
            self.info = UserInfo
            
        }) { (err) in
            print("user info 에러")
        }
    }
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        
        navigationItem.titleView = imv
    }
    
    private func setupView() {
        profileImgV.applyRadius(radius: 40)
    }
    
    @IBAction func tapAction(_ sender: UIButton) {
        userId = sender.tag+4
        if sender.tag == 1 {
            leftBtn.setImage(#imageLiteral(resourceName: "foodInActive"), for: .normal)
            middleBtn.setImage(#imageLiteral(resourceName: "foodOutInactive"), for: .normal)
            rightBtn.setImage(#imageLiteral(resourceName: "foodBoomarkInactive"), for: .normal)
            
            leftLbl.textColor = #colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1)
            middleLbl.textColor = #colorLiteral(red: 0.5803330541, green: 0.5804335475, blue: 0.5803198814, alpha: 1)
            rightLbl.textColor = #colorLiteral(red: 0.5803330541, green: 0.5804335475, blue: 0.5803198814, alpha: 1)
        } else if sender.tag == 2 {
            leftBtn.setImage(#imageLiteral(resourceName: "foodInInactive"), for: .normal)
            middleBtn.setImage(#imageLiteral(resourceName: "foodOutActive"), for: .normal)
            rightBtn.setImage(#imageLiteral(resourceName: "foodBoomarkInactive"), for: .normal)
            
            leftLbl.textColor = #colorLiteral(red: 0.5803330541, green: 0.5804335475, blue: 0.5803198814, alpha: 1)
            middleLbl.textColor = #colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1)
            rightLbl.textColor = #colorLiteral(red: 0.5803330541, green: 0.5804335475, blue: 0.5803198814, alpha: 1)
        } else {
            leftBtn.setImage(#imageLiteral(resourceName: "foodInInactive"), for: .normal)
            middleBtn.setImage(#imageLiteral(resourceName: "foodOutInactive"), for: .normal)
            rightBtn.setImage(#imageLiteral(resourceName: "foodBoomarkActive"), for: .normal)
            
            leftLbl.textColor = #colorLiteral(red: 0.5803330541, green: 0.5804335475, blue: 0.5803198814, alpha: 1)
            middleLbl.textColor = #colorLiteral(red: 0.5803330541, green: 0.5804335475, blue: 0.5803198814, alpha: 1)
            rightLbl.textColor = #colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1)
        }
    }
    
   
}

extension MyPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let seller = info else {return 0}
        
        return seller.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = listTbV.dequeueReusableCell(withIdentifier: "SellerInfoFoodCell") as! SellerInfoFoodCell
            guard let seller = info else {return cell}
            let food = seller.posts[indexPath.row]
            cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
            cell.nameLbl.text = food.postsTitle
            cell.infoLbl.text = food.postsInfo
            return cell
        
        
    }
    
}
