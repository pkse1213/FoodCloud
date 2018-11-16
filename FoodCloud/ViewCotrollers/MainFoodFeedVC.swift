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
    
    var x = 127.05000538145993
    var y = 37.556525987653195
    var address = "한양대학교 올림픽체육관"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    @IBAction func filterAction(_ sender: UISegmentedControl) {
        
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
       return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Food+Person", bundle: nil).instantiateViewController(withIdentifier: "FoodDetailVC") as! FoodDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
