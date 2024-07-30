//
//  DrinkViewController.swift
//  DogEat
//
//  Created by 김영광 on 2024/06/20.
//

import UIKit
import RealmSwift

class DrinkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var foodItem: FoodItem?
    var selectedFoodItem: FoodItem?
    var foodItemManager = FoodItemManager()
    @IBOutlet weak var foodTableView: UITableView!
    
    var drinkItems: Results<FoodItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButtonItem()
        setTableView()
        
        // '음료' 타입의 음식만 가져와 drinkItems에 저장
        drinkItems = foodItemManager.fetchDrinkItems()
    }
    
    func setBackButtonItem(){
        self.title = "음료"  // 네비게이션 바의 타이틀 설정
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func setTableView() {
        foodTableView.dataSource = self
        foodTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFoodItem = drinkItems?[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let detailViewController = segue.destination as? FoodDetailViewController {
                detailViewController.foodItem = selectedFoodItem
                detailViewController.info = Array(selectedFoodItem?.info ?? List<String>()) // List를 Array로 변환하여 전달
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodTableViewCell
        if let foodItem = drinkItems?[indexPath.row] {
            cell.foodName.text = foodItem.name
            cell.foodImage.image = UIImage(named: foodItem.imagePath)
            cell.oxImage.image = UIImage(named: foodItem.canEat ? "o.png" : "x.png")
        }
        return cell
    }
}
