//
//  ViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 3.12.24.
//

import UIKit

class ViewController: UIViewController {

    private let nametexField = UITextField()
    private let datePicker = UIDatePicker()
    private let heightPicker = UIPickerView()
    private let weightPicker = UIPickerView()
    private let allergiesTextField = UITextField()
    private let allergiesPicker = UIPickerView()
    private let registerButton = UIButton()
    
    private let viewModel = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: self.view)
        setupUI()
    }
    private func setupUI() {
        title = "Регистрация"
        
        nametexField.placeholder = "Введите имя"
        nametexField.borderStyle = .roundedRect
        nametexField.keyboardType = .default
        
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 16,
                                                       to: Date())
        
        heightPicker.dataSource = self
        heightPicker.delegate = self
        
        weightPicker.dataSource = self
        weightPicker.delegate = self
        
        allergiesTextField.placeholder = "Добавить алергию"
        allergiesTextField.borderStyle = .roundedRect
        allergiesTextField.inputView = allergiesPicker
        
        allergiesPicker.delegate = self
        allergiesPicker.dataSource = self
        
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 5
        registerButton.addTarget(self,
                                 action: #selector(registrationButtonTapped),
                                 for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: nametexField, datePicker, heightPicker, weightPicker, allergiesTextField, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constantant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    @objc private func registrationButtonTapped() {
        guard let name = nametexField.text, !name.isEmpty else {
            print("Введите имя")
            return
        }
    }
    
    let dateOfBirth = datePicker.date
    let height = viewModel.height.Options[heightPicker.selectedRow(inComponent: 0)
    
    
sdfdsfdsfdsf
}

