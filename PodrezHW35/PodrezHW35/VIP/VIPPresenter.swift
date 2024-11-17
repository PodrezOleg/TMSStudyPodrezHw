//
//  VIPPresenter.swift
//  PodrezHW35
//
//  Created by Oleg Podrez on 10.11.24.
//

import Foundation

protocol VIPPresenterProtocol: AnyObject {
    func present(_ count: Int)
}

class VIPPresenter: VIPPresenterProtocol {
    weak var view: VIPViewControllerProtocol?
    func present(_ count: Int) {
        view?.updateCount(with: count)
    }
}
