//
//  FoodDetailVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class FoodDetailVC: UIViewController {

    var disFood: FoodByDis?
    var timeFood: FoodByTime?
    
    @IBOutlet weak var foodDetailTbV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " "
        setupTbV()
        setNoti()
        setupNavi()
    }
   
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        navigationItem.titleView = imv
    }
    
    private func setupTbV() {
        self.foodDetailTbV.delegate = self
        self.foodDetailTbV.dataSource = self
    }
    
    private func setNoti() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(setAddress(noti:)), name: NSNotification.Name("backAction") , object: nil)
    }
    
    @objc func setAddress(noti:Notification) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func outAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Message", bundle: nil).instantiateViewController(withIdentifier: "MessageVC") as! MessageVC
       self.present(vc, animated: true)
    }
    @IBAction func sellerAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Food+Person", bundle: nil).instantiateViewController(withIdentifier: "SellerInfoVC") as! SellerInfoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension FoodDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodDetailTbV.dequeueReusableCell(withIdentifier: "FoodDetailCell") as! FoodDetailCell
        if let food = disFood {
            cell.nameLbl.text = food.userName
            cell.imageBtn.imageView?.imageFromUrl(food.userProfile, defaultImgPath: "")
            cell.foodNameLbl.text = food.postsTitle
            cell.expireLbl.text = "유통기한: " + food.postsExpire
            cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
            cell.timeLbl.text = "일요일 오후 4시"
            cell.infoLbl.text = food.postsInfo
        } else if let food = timeFood {
            cell.nameLbl.text = food.userName
            cell.imageBtn.imageView?.imageFromUrl(food.userProfile, defaultImgPath: "")
            cell.foodNameLbl.text = food.postsTitle
            cell.expireLbl.text = "유통기한: " + food.postsExpire
            cell.foodImgV.imageFromUrl(food.postsImg, defaultImgPath: "")
            cell.timeLbl.text = "일요일 오후 4시"
            cell.infoLbl.text = food.postsInfo
        }
        return cell
    }
    
    
}
