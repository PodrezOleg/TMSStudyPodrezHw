//
//  OpenFoodService.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.
//

import Foundation

class OpenFoodService {
    private let baseURL = "https://world.openfoodfacts.org/api/v1/search"
    
    func fetchProduct(by name: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?search_terms=\(name)&fields=product_name,nutriments,nutriscore_grade") else {
            print("Invalid URL")
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        print("Request URL: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let openFoodResponse = try JSONDecoder().decode(OpenFood.self, from: data)
                print("Decoded Response: \(openFoodResponse)")
                
                if let products = openFoodResponse.products, !products.isEmpty {
                    completion(.success(products))
                } else {
                    print("No products found in the response")
                    completion(.failure(NSError(domain: "No products found", code: 0, userInfo: nil)))
                }
            } catch {
                print("Decoding Error: \(error)")
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
