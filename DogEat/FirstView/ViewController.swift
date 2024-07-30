//
//  ViewController.swift
//  DogEat
//
//  Created by 김영광 on 2024/05/27.
//

import UIKit
import RealmSwift


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fullListButton: UIButton!
    
    var foodItemManager = FoodItemManager()
    var foodItems: Results<FoodItem>?
    var filteredFoodItems: [FoodItem] = []
    var selectedFoodItem: FoodItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터 초기화
        foodItemManager.initializeDefaultTasks()
        
        // Realm에서 데이터 가져오기
        foodItems = foodItemManager.fetchFoodItems()
        

        // 검색 기능
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        // UI 초기화
        ConfigureSearchBar()
        self.navigationItem.title = "먹어도 될까멍"
        
        let backBarButtonItem = UIBarButtonItem(title: "검색하기", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           // 서치 바 초기화
           searchBar.text = ""
           searchBar.resignFirstResponder()  // 키보드 내리기
           // 필터링된 결과 초기화
           filteredFoodItems = []
           tableView.reloadData()
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFoodItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        let foodItem = filteredFoodItems[indexPath.row]
        cell.name.text = foodItem.name
        cell.foodImage.image = UIImage(named: foodItem.imagePath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //그대로 복붙하면 될줄 근데 이러니까 foodItem에 처음만 나오지,,,ㅋㅋ
        //selectedFoodItem = foodItemManager.fetchFoodItems()[indexPath.row]
        
        selectedFoodItem = filteredFoodItems[indexPath.row]
        
        performSegue(withIdentifier: "searchDetail", sender: indexPath)
        
        //print(selectedFoodItem?.name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchDetail" {
            if let detailViewController = segue.destination as? FoodDetailViewController {
                detailViewController.foodItem = selectedFoodItem
                detailViewController.info = Array(selectedFoodItem?.info ?? List<String>()) // List를 Array로 변환하여 전달
            }
        }
    }
    
    

    // MARK: - UISearchBarDelegate Methods

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let foodItems = foodItems else {
            filteredFoodItems = []
            tableView.reloadData()
            return
        }
        
        if searchText.isEmpty {
            filteredFoodItems = []
        } else {
            filteredFoodItems = foodItems.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }

    func ConfigureSearchBar() {
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "음식 이름을 입력하세요"
        
        fullListButton.layer.cornerRadius = 10
    }
    
    
}
