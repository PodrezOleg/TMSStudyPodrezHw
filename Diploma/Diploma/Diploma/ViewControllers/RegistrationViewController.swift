//
//  ViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 3.12.24.
//

//
//  ViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 3.12.24.
//

import UIKit

class RegistrationViewController: UIViewController {
  
    private let appImageView = UIImageView()
    private let nameTextField = UITextField()
    private let datePicker = UIDatePicker()
    private let heightPicker = UIPickerView()
    private let weightPicker = UIPickerView()
    private let allergiesTextField = UITextField()
    private let allergiesPicker = UIPickerView()
    private let registerButton = UIButton(type: .system)
    private let viewModel = RegistrationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: view)
        setupUI()
    }

    private func setupUI() {
        title = "Регистрация"
        view.backgroundColor = .white

     
        appImageView.image = UIImage(named: "Logo") // Замените на своё изображение
        appImageView.contentMode = .scaleAspectFit
        appImageView.translatesAutoresizingMaskIntoConstraints = false

   
        nameTextField.placeholder = "Введите имя"
        nameTextField.borderStyle = .roundedRect

        
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -16, to: Date())

       
        heightPicker.dataSource = self
        heightPicker.delegate = self

        weightPicker.dataSource = self
        weightPicker.delegate = self

        allergiesTextField.placeholder = "Добавить аллергию"
        allergiesTextField.borderStyle = .roundedRect
        allergiesTextField.inputView = allergiesPicker

        allergiesPicker.delegate = self
        allergiesPicker.dataSource = self

     
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 5
        registerButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)

   
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            datePicker,
            heightPicker,
            weightPicker,
            allergiesTextField,
            registerButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false

     
        view.addSubview(appImageView)
        view.addSubview(stackView)

      
        NSLayoutConstraint.activate([
          
            appImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.logoTopAnchot),
            appImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appImageView.widthAnchor.constraint(equalToConstant: 150),
            appImageView.heightAnchor.constraint(equalToConstant: 150),

         
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 20)
        ])
    }

    @objc private func registrationButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
            print("Введите имя")
            return
        }

        let dateOfBirth = datePicker.date
        let height = viewModel.heightOptions[heightPicker.selectedRow(inComponent: 0)]
        let weight = viewModel.weightOptions[weightPicker.selectedRow(inComponent: 0)]
        let allergy = viewModel.allergyOptions[allergiesPicker.selectedRow(inComponent: 0)]

        viewModel.registerUser(
            name: name,
            dateOfBirth: dateOfBirth,
            height: height,
            weight: weight,
            allergy: allergy
        )
        print("Зарегистрирован")
    }
}

extension RegistrationViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == heightPicker {
            return viewModel.heightOptions.count
        } else if pickerView == weightPicker {
            return viewModel.weightOptions.count
        } else if pickerView == allergiesPicker {
            return viewModel.allergyOptions.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == heightPicker {
            return "\(viewModel.heightOptions[row]) см"
        } else if pickerView == weightPicker {
            return "\(viewModel.weightOptions[row]) кг"
        } else if pickerView == allergiesPicker {
            return viewModel.allergyOptions[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == allergiesPicker {
            allergiesTextField.text = viewModel.allergyOptions[row]
        }
    }
}
