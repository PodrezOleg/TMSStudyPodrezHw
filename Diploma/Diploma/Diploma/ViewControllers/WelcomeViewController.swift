//
//  WelcomeViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let registrationButton = CustomButton()
    private let loginButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
    }
    private func setupUIWelcomeController() {
        
        UISetup.setupAnimatedBackground(for: view)
        
        logoImageView.image = UIImage(named: "iPad_App_Icon_at2x_logo")
        logoImageView.contentMode = .scaleAspectFit
        
        // MARK: придумать приветсвие
        
        titleLabel.text = "Bee Fit, Придумай позже"
        titleLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleFontSizeLogo, weight: .bold)
        titleLabel.textAlignment = .center
        
        registrationButton.setTitle("Sign Up", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(registrationButton)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
                   // Логотип
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.logoTopAnchot),
                   logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   logoImageView.widthAnchor.constraint(equalToConstant: 150),
                   logoImageView.heightAnchor.constraint(equalToConstant: 150),

                   // Текст
                   titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
                   titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                   titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

                   // Кнопка "Зарегистрироваться"
                   registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
                   registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                   registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                   registrationButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.bottomAnchor.constraint(equalTo: registrationButton.topAnchor , constant: -10),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
     

    
               ])
           }

    
    
    
    
    @objc private func registrationButtonTapped() {
        let registrationViewController = RegistrationViewController()
        navigationController?.delegate = self
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    @objc private func logInButtonTapped() {
        let loginViewControler = LoginViewControler()
        navigationController?.delegate = self
        navigationController?.pushViewController(loginViewControler, animated: true)
    }
    
}

//  Своя анимации перехода
extension WelcomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return FadeInAnimationViewController()
        }
        return nil
    }
}
