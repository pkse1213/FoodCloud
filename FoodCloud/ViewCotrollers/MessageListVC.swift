//
//  MessageListVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 17..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MessageListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        navigationItem.titleView = imv
    }
    

}
