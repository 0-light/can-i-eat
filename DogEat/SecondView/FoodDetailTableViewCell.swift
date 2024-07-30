//
//  FoodDetailTableViewCell.swift
//  DogEat
//
//  Created by 김영광 on 2024/06/05.
//

import UIKit

class FoodDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var foodInfo: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Ensure label can have multiple lines
            foodInfo.numberOfLines = 0
            foodInfo.lineBreakMode = .byWordWrapping
            
            // Update layout to ensure proper height calculation
            foodInfo.translatesAutoresizingMaskIntoConstraints = false
        checkImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
                checkImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            contentView.layoutIfNeeded()
        }
}
