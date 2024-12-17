//
//  LoginViewControler.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit



class LoginViewController: UIViewController {
    private let nameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = CustomButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: view)
        setupUI()
        setupKeyboardHandling()
    }

    private func setupUI() {
        title = "Авторизация"

        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect

        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect

        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [nameTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(loginButton)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.minusWelcomeViewBetweenElements),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func loginTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Введите имя и пароль")
            return
        }

       
        if CoreDataManager.shared.authenticateUser(name: name, password: password) {
            showAlert(message: "Успешный вход!")
        } else {
            showAlert(message: "Неверное имя или пароль")
        }
    }

    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Сообщение", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true)
    }
    
    
}
