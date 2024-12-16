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
    private let loginButton = UIButton(type: .system)

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

        loginButton.setTitle("Войти", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [nameTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func loginTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Введите имя и пароль")
            return
        }

        // Проверка пользователя в CoreData
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
