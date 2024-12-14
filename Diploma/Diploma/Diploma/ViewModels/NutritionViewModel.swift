//
//  NutritionViewModel.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.
//


import Foundation

class NutritionViewModel {
    private let service = OpenFoodService()
    
    var onDataFetched: (([Product]) -> Void)?
    var onError: ((Error) -> Void)?
    
    func searchProduct(named name: String) async {
        do {
            let products = try await service.fetchProduct(by: name)
            DispatchQueue.main.async {
                self.onDataFetched?(products)
            }
        } catch {
            DispatchQueue.main.async {
                self.onError?(error)
            }
        }
    }
}
