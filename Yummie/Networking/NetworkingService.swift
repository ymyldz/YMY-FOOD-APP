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
    
    static let shared = NetworkService()
    private init (){}
    
    func myFirstRequest(){
        request(route: .temp, method: .get, type: String.self, completion: { _ in})
    }
    private func request<T: Codable>(route:Route,
                                     method: Method ,
                                     paramaters: [String: Any]? = nil , type:T.Type ,
                                     completion: (Result<T,Error>) -> Void) {
        guard let request = createRequest(route: route, method: method,paramaters: paramaters) else {
            completion(.failure(Apperror.unknownError))
            return}
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result : Result<Data,Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\n\(responseString)")
            }else if let error = error {
                result = .failure(error)
                print("Ther error is : \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                // TODO decode our result and send back to user
            }
        }.resume()
    }
    
     private func createRequest(route: Route,
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
