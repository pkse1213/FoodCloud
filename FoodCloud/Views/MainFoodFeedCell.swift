//
//  MainFoodFeedCell.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MainFoodFeedCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var sellerImgV: UIImageView!
    @IBOutlet weak var foodImgV: UIImageView!
    @IBOutlet weak var SellernameLbl: UILabel!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodInfoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeAction(_ sender: Any) {
    }
    
}
