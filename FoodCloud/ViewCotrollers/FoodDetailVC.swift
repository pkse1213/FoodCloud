//
//  FoodDetailVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class FoodDetailVC: UIViewController {

    @IBOutlet weak var foodDetailTbV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbV()
    }
    private func setupTbV() {
        self.foodDetailTbV.delegate = self
        self.foodDetailTbV.dataSource = self
    }
}
extension FoodDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodDetailTbV.dequeueReusableCell(withIdentifier: "FoodDetailCell") as! FoodDetailCell
        return cell
    }
    
    
}
