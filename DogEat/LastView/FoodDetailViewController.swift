//
//  FoodDetailViewController.swift
//  DogEat
//
//  Created by 김영광 on 2024/06/05.
//


import UIKit

class FoodDetailViewController: UIViewController, UITableViewDataSource{
    
    var foodItem: FoodItem?
    var recivedName: String?
    var info: [String] = [] // 전달받은 info 배열
    
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodInfoTableView: UITableView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodSetup()
        foodInfoTableView.dataSource = self
        
        // Enable automatic dimension for cell height
        foodInfoTableView.estimatedRowHeight = 44.0
        foodInfoTableView.rowHeight = UITableView.automaticDimension
    }
  
    func foodSetup(){
        
      
        if let foodItem = foodItem {
                   fruitName.text = foodItem.name
                   foodImage.image = UIImage(named: foodItem.canEat ? "o.png" : "x.png")
    
               }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = foodInfoTableView.dequeueReusableCell(withIdentifier: "foodInfoCell", for: indexPath) as! FoodDetailTableViewCell
        
        cell.checkImage.image = UIImage(named: "bcircle.png")
        cell.foodInfo.text = info[indexPath.row]
        cell.foodInfo.sizeToFit()
        cell.foodInfo.numberOfLines = 0 
        return cell
    }
}
