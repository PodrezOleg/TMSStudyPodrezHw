//
//  ProfileViewModel.swift
//  Diploma
//
//  Created by Oleg Podrez on 18.12.2024.
//

import Foundation

class ProfileViewModel {
    private let openFoodService = OpenFoodService()
    var onDataFetched: (([Product]) -> Void)?
    var onError: ((Error) -> Void)?
    
    func searchProduct(named name: String) async {
        do {
            let fetchedProducts = try await openFoodService.fetchProduct(by: name)
            DispatchQueue.main.async {
                self.onDataFetched?(fetchedProducts)
            }
        } catch {
            DispatchQueue.main.async {
                self.onError?(error)
            }
        }
    }
}
