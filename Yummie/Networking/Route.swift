//
//  Route.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 7.05.2023.
//

import Foundation

enum Route {
    
    static let baseUrl = "https://yummie.glitch.me/"
     
    case fetchAllCategories
    case placeOrder(String)
    
    var description : String {
        switch self {
        case .fetchAllCategories : return "/dish-categories"
        case .placeOrder(let dishId): return "/orders/\(dishId)"
        }
    }
}
