//
//  EventVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class EventVC: UIViewController {

    @IBOutlet weak var leftBar: UIView!
    @IBOutlet weak var eventBtn: UIButton!
    @IBOutlet weak var rightBar: UIView!
    @IBOutlet weak var rankBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavi()
    }
    
    private func setupNavi() {
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgLogo"))
        
        navigationItem.titleView = imv
    }
    private func setupView() {
        rightBar.isHidden = true
    }
    
    @IBAction func eventAction(_ sender: UIButton) {
        eventBtn.setTitleColor(#colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1), for: .normal)
        rankBtn.setTitleColor(#colorLiteral(red: 0.7842356563, green: 0.7843683958, blue: 0.7842181921, alpha: 1), for: .normal)
        rightBar.isHidden = true
        leftBar.isHidden = false
    }
    
    @IBAction func rankAction(_ sender: UIButton) {
        rankBtn.setTitleColor(#colorLiteral(red: 1, green: 0.4916750789, blue: 0, alpha: 1), for: .normal)
        eventBtn.setTitleColor(#colorLiteral(red: 0.7842356563, green: 0.7843683958, blue: 0.7842181921, alpha: 1), for: .normal)
        rightBar.isHidden = false
        leftBar.isHidden = true
        
    }
    
}
