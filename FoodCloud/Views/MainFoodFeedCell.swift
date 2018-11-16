//
//  MainFoodFeedCell.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MainFoodFeedCell: UITableViewCell {
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var sellerImgV: UIImageView!
    @IBOutlet weak var foodImgV: UIImageView!
    @IBOutlet weak var SellernameLbl: UILabel!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var likeCntLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var soldOutView: UIView!
    
    var like = false
    var cnt = 4 {
        didSet {
            likeCntLbl.text = "+\(cnt)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        squareView.applyRadius(radius: 10)
        sellerImgV.applyRadius(radius: 15)
        foodImgV.applyRadius(radius: 15)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeAction(_ sender: UIButton) {
        if like {
            sender.setImage(#imageLiteral(resourceName: "icLikeInactive32"), for: .normal)
            cnt = cnt-1
        } else {
            sender.setImage(#imageLiteral(resourceName: "icLikeActive32"), for: .normal)
            cnt = cnt+1
        }
        like = !like
    }
    
}
