//
//  FoodItem.swift
//  DogEat
//
//  Created by 김영광 on 2024/05/30.
//

import Foundation
import RealmSwift

class FoodItem: Object {
    @objc dynamic var type = ""
    @objc dynamic var name = ""
    @objc dynamic var canEat: Bool = false
    @objc dynamic var imagePath: String = "" // 이미지 파일 경로 저장
    
    let info = List<String>()
    
    convenience init(type: String, name: String, canEat: Bool, imagePath: String, info: [String]) {
        self.init()
        self.type = type
        self.name = name
        self.canEat = canEat
        self.imagePath = imagePath
        self.info.append(objectsIn: info)
    }
}




