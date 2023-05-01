//
//  Dish.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 1.05.2023.
//

import Foundation

struct Dish {
    let id,name,image,decription : String?
    let calories : Int?
    
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
