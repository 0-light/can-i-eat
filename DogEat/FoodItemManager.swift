//
//  FoodItemManager.swift
//  DogEat
//
//  Created by 김영광 on 2024/05/30.
//

import Foundation
import RealmSwift

class FoodItemManager {
    private let realm = try! Realm()

    func fetchFoodItems() -> Results<FoodItem> {
        return realm.objects(FoodItem.self)
    }
    
    func fetchFruitItems() -> Results<FoodItem> {
            return realm.objects(FoodItem.self).filter("type == '과일'")
    }
    
    func fetchDrinkItems() -> Results<FoodItem> {
            return realm.objects(FoodItem.self).filter("type == '음료'")
    }
    
    func fetchExItems() -> Results<FoodItem> {
            return realm.objects(FoodItem.self).filter("type == '기타'")
    }

    func addFoodItem(item: FoodItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    

    func deleteFoodItem(item: FoodItem) {
        try! realm.write {
            realm.delete(item)
        }
    }
    
    //디테일 셀에 표현하기위한 info개수 가져오는 함수
    func getInfoCount(for item: FoodItem) -> Int {
           return item.info.count
       }
    
    func initializeDefaultTasks() {
            let existingFoodItems = fetchFoodItems()
            if existingFoodItems.isEmpty {
                try! realm.write {
                    let defaultFoodItem: [FoodItem] = [
                        // 과일
                        FoodItem(type: "과일", name: "사과", canEat: true, imagePath: "apple.png", info: ["씨는 독성이 있을 수 있어 제거하고 급여"]),
                        FoodItem(type: "과일", name: "바나나", canEat: false, imagePath: "banana.png", info: ["고칼륨으로 신장에 무리를 줄 수 있음"]),
                        FoodItem(type: "과일", name: "딸기", canEat: true, imagePath: "strawberry.png", info: ["적당량 급여"]),
                        FoodItem(type: "과일", name: "수박", canEat: true, imagePath: "watermelon.jpeg", info: ["씨와 껍질은 소화에 안 좋음"]),
                        FoodItem(type: "과일", name: "오렌지", canEat: false, imagePath: "orange.png", info: ["신맛이 강해 위에 부담을 줄 수 있음"]),
                        FoodItem(type: "과일", name: "포도", canEat: false, imagePath: "grape.png", info: ["포도는 신부전 유발 가능"]),
                        FoodItem(type: "과일", name: "체리", canEat: true, imagePath: "cherries.png", info: ["씨는 제거 후 급여", "씨에 독성이 있음"]),
                        FoodItem(type: "과일", name: "키위", canEat: false, imagePath: "kiwi.png", info: ["알레르기 반응을 일으킬 수 있음"]),
                        FoodItem(type: "과일", name: "배", canEat: true, imagePath: "pear.png", info: ["적당량 급여"]),
                        FoodItem(type: "과일", name: "자두", canEat: false, imagePath: "plum.png", info: ["씨에 독성이 있음"]),
                        
                        // 음료
                        FoodItem(type: "음료", name: "우유", canEat: false, imagePath: "milk.png", info: ["락토스 불내증으로 설사를 유발할 수 있음"]),
                        FoodItem(type: "음료", name: "커피", canEat: false, imagePath: "coffee.png", info: ["카페인은 중독성과 심장 문제를 유발할 수 있음"]),
                        FoodItem(type: "음료", name: "차", canEat: true, imagePath: "greentea.png", info: ["카페인이 없는 허브차만 급여"]),
                        FoodItem(type: "음료", name: "오렌지주스", canEat: true, imagePath: "orangejuice.png", info: ["설탕이 없는 주스만 급여"]),
                        FoodItem(type: "음료", name: "탄산음료", canEat: false, imagePath: "cola.png", info: ["탄산과 설탕이 위에 부담"]),
                        FoodItem(type: "음료", name: "에너지 드링크", canEat: false, imagePath: "energydrink.png", info: ["카페인과 타우린이 심장 문제를 유발"]),
                        FoodItem(type: "음료", name: "코코넛 물", canEat: true, imagePath: "coconutdrink.png", info: ["적당량 급여"]),
                        
                        // 기타
                        FoodItem(type: "기타", name: "빵", canEat: true, imagePath: "bread.png", info: ["소량 급여"]),
                        FoodItem(type: "기타", name: "초콜릿", canEat: false, imagePath: "chocolate.png", info: ["테오브로민 성분이 중독성 유발"]),
                        FoodItem(type: "기타", name: "땅콩", canEat: false, imagePath: "peanut.png", info: ["알레르기 반응 유발 가능"]),
                        FoodItem(type: "기타", name: "치즈", canEat: true, imagePath: "cheese.png", info: ["소량 급여"]),
                        FoodItem(type: "기타", name: "버섯", canEat: false, imagePath: "mushroom.png", info: ["독성이 있는 종류가 많음"]),
                        FoodItem(type: "기타", name: "감자", canEat: true, imagePath: "potato.png", info: ["익혀서 급여"]),
                        FoodItem(type: "기타", name: "양파", canEat: false, imagePath: "onion.png", info: ["적혈구 손상 유발"]),
                        FoodItem(type: "기타", name: "옥수수", canEat: true, imagePath: "corn.png", info: ["알갱이만 급여"]),
                        FoodItem(type: "기타", name: "아보카도", canEat: false, imagePath: "avocado.png", info: ["페르신 성분이 독성 유발"]),
                    ]


                    for item in defaultFoodItem {
                        realm.add(item)
                    }
                }
            }
        }
}
