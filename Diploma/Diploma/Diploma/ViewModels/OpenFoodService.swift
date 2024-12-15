//
//  OpenFoodService.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.

import Foundation

class OpenFoodService {
    let baseURL = "https://world.openfoodfacts.org/cgi/search.pl"
    
    func fetchProduct(by name: String) async throws -> [Product] {
        guard let url = URL(string: "\(baseURL)?search_terms=\(name)&json=1&tagtype_0=countries&tag_contains_0=contains&tag_0=Russia&tagtype_1=countries&tag_contains_1=contains&tag_1=Russia&fields=product_name,nutriments,nutrition_grades,image_front_url") else {
            throw URLError(.badURL, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        print("Request URL: \(url)")
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // MARK: Проверка статуса HTTP-ответа
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "Server returned status code \(httpResponse.statusCode)"])
            }
            
          
            let openFoodResponse = try JSONDecoder().decode(OpenFood.self, from: data)
            print("Decoded Response: \(openFoodResponse)")
            
            //MARK: Проверка наличия продуктов!Ю
            guard let products = openFoodResponse.products, !products.isEmpty else {
                throw URLError(.dataNotAllowed, userInfo: [NSLocalizedDescriptionKey: "No products found"])
            }
            
            return products
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}
