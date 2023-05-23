//
//  ApiResponse.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 23.05.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
