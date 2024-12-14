//
//  NutritionViewModel.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.
//


import Foundation

class NutritionViewModel {
    private let service = OpenFoodService()
    
    // Теперь передаем массив продуктов вместо одного
    var onDataFetched: (([Product]) -> Void)?
    var onError: ((Error) -> Void)?
    
    func searchProduct(named name: String) {
        service.fetchProduct(by: name) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    // Передаем все продукты
                    self?.onDataFetched?(products)
                case .failure(let error):
                    self?.onError?(error)
                }
            }
        }
    }
}
