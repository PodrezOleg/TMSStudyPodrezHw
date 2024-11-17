//
//  VIPRouter.swift
//  PodrezHW35
//
//  Created by Oleg Podrez on 10.11.24.
//

import UIKit

class VIPRouter {
    static func createModule() -> UIViewController {
        let view = VIPViewController()
        let interactor = VIPInteractor()
        let presenter = VIPPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}

