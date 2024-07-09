//
//  LoginViewController.swift
//  PodrezHw8
//
//  Created by Oleg Podrez on 30.06.24.
//

import UIKit

class LoginViewController: UIViewController {

    lazy var loginTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    lazy var wrapper = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.placeholder = "Введите логин"
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.keyboardType = .default
        wrapper.backgroundColor = .lightGray
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapper)
        addSubviews(loginButton, passwordTextField, loginTextField)
        alignToCenter(wrapper)
        wrapper.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        wrapper.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        wrapper.heightAnchor.constraint(equalToConstant: 300).isActive = true
//
        loginTextField.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 10).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        
        loginButton.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: 10).isActive = true

        loginButton.addTarget(self, action: #selector(loginDidTapped), for: .touchUpInside)
    }
    
    @objc func loginDidTapped() {
        wrapper.isHidden = true
    }
    
    func alignToCenter(_ views: UIView...) {
        views.forEach {
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
    }
            func addSubviews (_ views: UIView...) {
                views.forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    wrapper.addSubview($0)
                    $0.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 20).isActive = true
                    $0.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -20).isActive = true
                }
            }
    }
    




