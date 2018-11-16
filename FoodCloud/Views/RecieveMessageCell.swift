//
//  RecieveMessageCell.swift
//  Woong-iOS
//
//  Created by 박세은 on 2018. 7. 4..
//  Copyright © 2018년 Leess. All rights reserved.
//

import UIKit

class RecieveMessageCell: UITableViewCell {
 
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageTextView: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageTextView.sizeToFit()
        messageView.layer.masksToBounds = true
        messageView.layer.cornerRadius = 10
        messageView.applyBorder(width: 1, color: #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1))
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 18
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
