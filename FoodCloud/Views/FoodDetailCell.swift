//
//  FoodDetailCell.swift
//  FoodCloud
//
//  Created by 박세은 on 2018. 11. 16..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class FoodDetailCell: UITableViewCell {
    
    @IBOutlet weak var photoImgV: UIImageView!
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var expireLbl: UILabel!
    @IBOutlet weak var foodImgV: UIImageView!
    @IBOutlet weak var likeCntLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    var cnt = 4 {
        didSet {
            likeCntLbl.text = "+\(cnt)"
        }
    }
    var like = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImgV.applyRadius(radius: 22)
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
