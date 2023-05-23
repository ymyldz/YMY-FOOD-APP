//
//  Route.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 7.05.2023.
//

import Foundation

enum Route {
    
    static let baseUrl = "https://yummie.glitch.me/"
     
    case temp
    
    var description : String {
        switch self {
        case .temp: return "/dishes/cat1"
        }
    }
}
