//
//  MyPageVC.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var profileImgV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var middleBtn: UIButton!
    @IBOutlet weak var middleLbl: UILabel!
    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupView() {
        profileImgV.applyRadius(radius: 40)
    }
    
    @IBAction func tapAction(_ sender: UIButton) {
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
