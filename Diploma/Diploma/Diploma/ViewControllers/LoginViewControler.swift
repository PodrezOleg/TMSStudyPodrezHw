//
//  LoginViewControler.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class LoginViewControler: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
    }
    private func setupUIWelcomeController() {
        
        UISetup.setupAnimatedBackground(for: view)
        
    }
}
