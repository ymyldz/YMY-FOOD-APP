//
//  Order.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 2.05.2023.
//

import Foundation

struct Order : Decodable {
    let id:String?
    let name: String?
    let dish: Dish?
}
