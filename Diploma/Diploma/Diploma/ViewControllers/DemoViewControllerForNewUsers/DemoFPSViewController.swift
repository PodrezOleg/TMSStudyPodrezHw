//
//  DemoFPSViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 9.12.24.
//

import UIKit

class DemoFPSViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
    }
    private func setupUIWelcomeController() {
        title = "Подсчет ЖБУ ДЕМО РЕЖИМ"
        UISetup.setupAnimatedBackground(for: view)

    }
}
