//
//  MainFoodFeedVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MainFoodFeedVC: UIViewController {
    @IBOutlet weak var FoodFeedTvC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView(){
        FoodFeedTvC.delegate = self
        FoodFeedTvC.dataSource = self
    }
}

extension MainFoodFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FoodFeedTvC.dequeueReusableCell(withIdentifier: "MainFoodFeedCell") as! MainFoodFeedCell
        
        cell.shadowView.applyShadow(radius: 10, color: .black, offset: CGSize(width: 0, height: 0), opacity: 0.3)
        cell.squareView.applyRadius(radius: 10)
        cell.sellerImgV.applyRadius(radius: 30)
        cell.sellerImgV.applyBorder(width: 3.0, color: .white)
        return cell
    }
    
    
}
