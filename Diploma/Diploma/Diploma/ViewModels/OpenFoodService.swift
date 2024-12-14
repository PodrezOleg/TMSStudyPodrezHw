//
//  OpenFoodService.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.

import Foundation

class OpenFoodService {
    private let baseURL = "https://world.openfoodfacts.org/api/v1/search"
    
    func fetchProduct(by name: String) async throws -> [Product] {
        guard let url = URL(string: "\(baseURL)?search_terms=\(name)&fields=product_name,nutriments,nutriscore_grade") else {
            throw URLError(.badURL, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        print("Request URL: \(url)")
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Проверка статуса HTTP-ответа
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "Server returned status code \(httpResponse.statusCode)"])
            }
            
            // Декодирование ответа
            let openFoodResponse = try JSONDecoder().decode(OpenFood.self, from: data)
            print("Decoded Response: \(openFoodResponse)")
            
            // Проверка наличия продуктов
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
