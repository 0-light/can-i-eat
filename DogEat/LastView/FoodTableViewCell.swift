//
//  FoodTableViewCell.swift
//  DogEat
//
//  Created by 김영광 on 2024/05/28.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var oxImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
