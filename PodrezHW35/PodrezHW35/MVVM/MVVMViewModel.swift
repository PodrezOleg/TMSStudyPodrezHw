//
//  MVVMViewModel.swift
//  PodrezHW35
//
//  Created by Oleg Podrez on 11.11.24.
//

import Foundation
import Combine

class MVVMViewModel: ObservableObject {
    @Published private(set) var countText: String = "0"
    
    private var model = CountMVVMModel()
    
    func plusOne() {
        if model.count < model.maxCount {
            model.count += 1
            countText = String(model.count)
        }
    }
    func minusOne() {
        if model.count > model.minCount {
            model.count -= 1
            countText = String(model.count)
        }
    }
}
