//
//  DemoProductsViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 9.12.24.
//

import UIKit

class DemoProductsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
    }
    private func setupUIWelcomeController() {
        title = "Продукты ДЕМО РЕЖИМ"
        UISetup.setupAnimatedBackground(for: view)
        
    }
}

