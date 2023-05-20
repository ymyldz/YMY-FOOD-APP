//
//  AppError.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 20.05.2023.
//

import Foundation

enum Apperror : LocalizedError {
case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Bruhhh!!! I have no idea what go on"
        case .invalidUrl:
            return "HEYYY!!!! Give me a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
