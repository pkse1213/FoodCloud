//
//  SellerInfoVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class SellerInfoVC: UIViewController {
    
    @IBOutlet weak var infoTbV: UITableView!
    
    @IBOutlet weak var sellerImgV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    @IBOutlet weak var leftBar: UIView!
    @IBOutlet weak var rightBar: UIView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    var choose = 0 {
        didSet {
            infoTbV.reloadData()
        }
    }
    var userId = 0
    var info: UserInfo? {
        didSet {
            infoTbV.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbV()
        setupView()
        setupNavi()
        initData()
    }
    
    private func initData() {
        UserInfoService.shareInstance.getUserInfoe(id: userId, completion: { (UserInfo) in
            self.info = UserInfo
            self.nameLbl.text = UserInfo.userName
            self.sellerImgV.imageFromUrl(UserInfo.userProfile, defaultImgPath: "")
            
        }) { (err) in
            print("user info 에러")
        }
    }
    
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        navigationItem.titleView = imv
    }
    
    private func setupView() {
        sellerImgV.applyRadius(radius: 40)
        rightBar.isHidden = true
        self.title = "판매자 정보"
    }
    
    private func setupTbV() {
        self.infoTbV.delegate = self
        self.infoTbV.dataSource = self
    }
    
    @IBAction func foodListAction(_ sender: Any) {
        choose = 0
        rightBar.isHidden = true
        leftBar.isHidden = false
        leftBtn.setTitleColor(#colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1), for: .normal)
        rightBtn.setTitleColor(#colorLiteral(red: 0.8469749093, green: 0.8471175432, blue: 0.8469561338, alpha: 1), for: .normal)
    }
    
    @IBAction func reviewAction(_ sender: Any) {
        choose = 1
        rightBar.isHidden = false
        leftBar.isHidden = true
        leftBtn.setTitleColor(#colorLiteral(red: 0.8469749093, green: 0.8471175432, blue: 0.8469561338, alpha: 1), for: .normal)
        rightBtn.setTitleColor(#colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1), for: .normal)
    }
}

extension SellerInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if choose == 0 {
            guard let seller = info else {return 0}
            
            return seller.posts.count
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if choose == 0 {
            let cell = infoTbV.dequeueReusableCell(withIdentifier: "SellerInfoFoodCell") as! SellerInfoFoodCell
            guard let seller = info else {return cell}
            let food = seller.posts[indexPath.row]
            cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
            cell.nameLbl.text = food.postsTitle
            cell.infoLbl.text = food.postsInfo
            return cell
        } else {
            let cell = infoTbV.dequeueReusableCell(withIdentifier: "ReviewCell") as! UITableViewCell
            print("nncn")
            return cell
        }
        
    }
    
}
