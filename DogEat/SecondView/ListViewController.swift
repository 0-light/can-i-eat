//
//  ListViewController.swift
//  DogEat
//
//  Created by 김영광 on 2024/05/28.
//



import UIKit
import RealmSwift

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var foodItem: FoodItem?
    var selectedFoodItem: FoodItem?
    var foodItemManager = FoodItemManager()
    @IBOutlet weak var foodTableView: UITableView!
    
    var fruitItems: Results<FoodItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButtonItem()
        
        setTableView()
        
        // '과일' 타입의 음식만 가져와 fruitItems에 저장
        fruitItems = foodItemManager.fetchFruitItems()
    }
    
    func setBackButtonItem(){
        self.navigationItem.title = "과일" 
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func setTableView() {
        foodTableView.dataSource = self
        foodTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedFoodItem = fruitItems?[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // prepare(for:sender:) 메서드 정의
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let detailViewController = segue.destination as? FoodDetailViewController {
                detailViewController.foodItem = selectedFoodItem
                detailViewController.info = Array(selectedFoodItem?.info ?? List<String>()) // List를 Array로 변환하여 전달
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodTableViewCell
        let items = foodItemManager.fetchFoodItems()
        let foodItem = items[indexPath.row]
        
        //foodItem = fruitItems?[indexPath.row]
        
        // 해당 foodItem의 이름을 셀에 설정
        cell.foodName.text = foodItem.name
        cell.foodImage.image = UIImage(named: foodItem.imagePath)
        cell.oxImage.image = UIImage(named: foodItem.canEat ? "o.png" : "x.png")
        return cell
    }
}




