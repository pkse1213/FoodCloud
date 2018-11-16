//
//  GoneFoodFeedVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class GoneFoodFeedVC: UIViewController {
    @IBOutlet weak var FoodFeedTvC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavi()
        
    }
    
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        
        navigationItem.titleView = imv
    }
    private func setupTableView(){
        FoodFeedTvC.delegate = self
        FoodFeedTvC.dataSource = self
    }
}

extension GoneFoodFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FoodFeedTvC.dequeueReusableCell(withIdentifier: "MainFoodFeedCell") as! MainFoodFeedCell
        cell.soldOutView.applyRadius(radius: 10)
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "Food+Person", bundle: nil).instantiateViewController(withIdentifier: "FoodDetailVC") as! FoodDetailVC
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}
