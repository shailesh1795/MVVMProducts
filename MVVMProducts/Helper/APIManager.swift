//
//  APIManager.swift
//  MVVMProducts
//
//  Created by Mac on 16/04/24.
//

import UIKit
enum DataError: Error {
    case invalidResponse
    case invalidData
    case invalidURL
    case network(Error?)
}
typealias Handler = (Result<[Product], DataError>) -> Void
final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
