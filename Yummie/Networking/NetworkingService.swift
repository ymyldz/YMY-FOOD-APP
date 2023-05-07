//
//  NetworkingService.swift
//  Yummie
//
//  Created by Yusuf Mert Yıldız on 7.05.2023.
//

import Foundation
    
    /// This function help us to generate a urlRequest
    /// - Paramaters:
    ///     - route : thepath the the resource in the backend
    ///     - method : type of request to be made
    ///     - parameters: whatever extra information you need to pass to the backend
    ///     - Returns: URLRequest
struct NetworkService{
     func createRequest(route: Route,
                               method: Method ,
                               paramaters: [String:Any]? = nil ) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = paramaters {
            switch method {
                 
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
            case .post ,.delete , .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject:paramaters, options: [])
                
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
