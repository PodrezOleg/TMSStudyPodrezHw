//
//  DemoProgressViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 9.12.24.
//

import UIKit

class DemoProgressViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
    }
    private func setupUIWelcomeController() {
        title = "Прогресс ДЕМО РЕЖИМ"
        UISetup.setupAnimatedBackground(for: view)
        
    }
}


