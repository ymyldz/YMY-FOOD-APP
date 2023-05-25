//
//  AllDishes.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 25.05.2023.
//

import Foundation

struct AllDishes : Decodable {
    let categories : [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
