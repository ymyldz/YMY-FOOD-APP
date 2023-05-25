//
//  DishCategory.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 1.05.2023.
//

import Foundation

struct DishCategory: Decodable {
    let id,name,image : String?
    
    enum CodingKeys: String ,CodingKey {
        case id
        case name = "title"
        case image
    }
}
