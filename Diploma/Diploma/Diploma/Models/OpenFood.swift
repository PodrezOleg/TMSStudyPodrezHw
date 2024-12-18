//
//  OpenFood.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let openFood = try? JSONDecoder().decode(OpenFood.self, from: jsonData)

import Foundation

// MARK: - OpenFood
struct OpenFood: Codable {
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable {
    let productName: String?
    let nutriscoreGrade: String?
    let image_front_url: String?
    let nutriments: Nutriments?

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case nutriscoreGrade = "nutriscore_grade"
        case nutriments
        case image_front_url = "image_front_url"
    }
}

// MARK: - Nutriments
struct Nutriments: Codable {
    let energy: Double?
    let fat: Double?
    let carbohydrates: Double?
    let proteins: Double?
    let sugars: Double?
    let salt: Double?

    enum CodingKeys: String, CodingKey {
        case energy = "energy-kj"  
        case fat = "fat_100g"
        case carbohydrates = "carbohydrates_100g"
        case proteins = "proteins_100g"
        case sugars = "sugars_100g"
        case salt = "salt_100g"
    }
}
