//
//  CountMVPPresenter.swift
//  PodrezHW34
//
//  Created by Oleg Podrez on 9.11.24.
//

import Foundation

class CountMVPPresenter {
    private var model = CountMVPModel()
    private weak var view: CountMVPViewProtocol?
    
    init(view: CountMVPViewProtocol) {
        self.view = view
        updateView()
    }
    
    func plusButtonTapped() {
        if model.count < model.maxCount {
            model.count += 1
            updateView()
        }
    }
    
    func minusButtonTapped() {
        if model.count > model.minCount {
            model.count -= 1
            updateView()
        }
    }
    
    private func updateView() {
        view?.updateCount(with: model.count)
    }
}
