
//  ViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 3.12.24.
//

import UIKit
import CoreData

class RegistrationViewController: UIViewController {
    private let appImageView = UIImageView()
    private let nameTextField = UITextField()
    private let passTextField = UITextField()
    private let datePicker = UIDatePicker()
    private let heightTextField = UITextField()
    private let weightTextField = UITextField()
    private let allergiesTextField = UITextField()
    private let allergiesPicker = UIPickerView()
    private let registerButton = UIButton()
    private let viewModel = RegistrationViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardHandling()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardHandling()
    }
    
   
    private func setupUI() {
        title = "Регистрация"
        view.backgroundColor = .white
        
     
        appImageView.image = UIImage(named: "Logo")
        appImageView.contentMode = .scaleAspectFit
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        
     
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        nameTextField.delegate = self
        
        passTextField.placeholder = "Пароль"
        passTextField.borderStyle = .roundedRect
        passTextField.isSecureTextEntry = true
        passTextField.delegate = self
        
        heightTextField.placeholder = "Рост (см)"
        heightTextField.borderStyle = .roundedRect
        heightTextField.keyboardType = .numberPad
        heightTextField.delegate = self
        
        weightTextField.placeholder = "Вес (кг)"
        weightTextField.borderStyle = .roundedRect
        weightTextField.keyboardType = .numberPad
        weightTextField.delegate = self
    
        allergiesTextField.placeholder = "Аллергии"
        allergiesTextField.borderStyle = .roundedRect
       
        
       
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -16, to: Date())
        
    
        registerButton.setTitle("Зарегистрироваться", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.layer.cornerRadius = 10
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
 
        let stackView = UIStackView(arrangedSubviews: [
            appImageView, nameTextField, passTextField,
            datePicker, heightTextField, weightTextField,
            allergiesTextField, registerButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
 
        view.addSubview(stackView)
        
 
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    

    @objc private func registerTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Введите имя")
            return
        }
        guard let password = passTextField.text, !password.isEmpty else {
            showAlert(message: "Введите пароль")
            return
        }
        guard let height = Int(heightTextField.text ?? ""), height > 0 else {
            showAlert(message: "Введите корректный рост")
            return
        }
        guard let weight = Int(weightTextField.text ?? ""), weight > 0 else {
            showAlert(message: "Введите корректный вес")
            return
        }
        
        let dateOfBirth = datePicker.date
        let allergies = allergiesTextField.text ?? ""
        
   
        viewModel.registerUser(
            name: name,
            password: password,
            dateOfBirth: dateOfBirth,
            height: height,
            weight: weight,
            allergy: allergies
        )
        
        showAlert(message: "Пользователь успешно зарегистрирован!")
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Сообщение", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
