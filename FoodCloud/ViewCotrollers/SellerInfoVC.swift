//
//  SellerInfoVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class SellerInfoVC: UIViewController {
    @IBOutlet weak var leftBar: UIView!
    @IBOutlet weak var rightBar: UIView!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var infoTbV: UITableView!
    @IBOutlet weak var sellerImgV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbV()
        setupView()
    }
    private func setupView() {
        tabView.applyRadius(radius: 10)
        infoTbV.applyRadius(radius: 10)
        rightBar.isHidden = true
        
    }
    private func setupTbV() {
        self.infoTbV.delegate = self
        self.infoTbV.dataSource = self
    }
    
    @IBAction func foodListAction(_ sender: Any) {
        rightBar.isHidden = true
        leftBar.isHidden = false
    }
    
    @IBAction func reviewAction(_ sender: Any) {
        rightBar.isHidden = false
        leftBar.isHidden = true
        
    }
    
}

extension SellerInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTbV.dequeueReusableCell(withIdentifier: "SellerInfoFoodCell") as! SellerInfoFoodCell
        cell.sqaureView.applyBorder(width: 1, color: UIColor.rgb(red: 151, green: 151, blue: 151))
        
        return cell
    }
    
    
}
