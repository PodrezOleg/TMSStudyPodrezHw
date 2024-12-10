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
    private let registerButton = CustomButton()
    private let viewModel = RegistrationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: view)
        setupUI()
    }

    private func setupUI() {
        title = "Регистрация"

        // Логотип
        appImageView.image = UIImage(named: "Logo")
        appImageView.contentMode = .scaleAspectFit
        appImageView.translatesAutoresizingMaskIntoConstraints = false

        // Имя
        nameTextField.placeholder = "Введите имя"
        nameTextField.borderStyle = .roundedRect

        // Дата рождения
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -16, to: Date())
        datePicker.preferredDatePickerStyle = .compact
        datePicker.calendar = .autoupdatingCurrent

        // Рост
        heightTextField.placeholder = "Выберите рост"
        heightTextField.borderStyle = .roundedRect
        heightTextField.inputView = createPicker(for: .height)
        heightTextField.inputAccessoryView = createToolbar()

        // Вес
        weightTextField.placeholder = "Выберите вес"
        weightTextField.borderStyle = .roundedRect
        weightTextField.inputView = createPicker(for: .weight)
        weightTextField.inputAccessoryView = createToolbar()

        // Аллергии
        allergiesTextField.placeholder = "Добавить аллергию"
        allergiesTextField.borderStyle = .roundedRect
        allergiesTextField.inputView = allergiesPicker
        allergiesTextField.inputAccessoryView = createToolbar()

        allergiesPicker.delegate = self
        allergiesPicker.dataSource = self

        // Кнопка регистрации
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)

        // StackView
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            datePicker,
            heightTextField,
            weightTextField,
            allergiesTextField,
            registerButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(appImageView)
        view.addSubview(stackView)

        NSLayoutConstraint.activate(
[
            appImageView.topAnchor
                .constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: LayoutConstants.logoTopAnchor
                ),
            appImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.logoTopAnchor),
            appImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.logoSizeWidth),
            appImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.logoSizeHeight),

            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leadingLayoutConstant),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailingLayoutConstant),
            stackView.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements)
        ]
)
    }

    private func createPicker(for type: PickerType) -> UIPickerView {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.tag = type.rawValue
        return picker
    }

    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Кнопка "Готово"
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonTapped))
        
        // Кнопка "Отмена"
        let cancelButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(cancelButtonTapped))
        
        // Добавляем кнопки на toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelButton, spacer, doneButton], animated: true)
        
        return toolbar
    }

    @objc private func doneButtonTapped() {
        view.endEditing(true)
    }

    @objc private func cancelButtonTapped() {
 
        if heightTextField.isFirstResponder {
            heightTextField.text = ""
        } else if weightTextField.isFirstResponder {
            weightTextField.text = ""
        } else if allergiesTextField.isFirstResponder {
            allergiesTextField.text = ""
        }
        view.endEditing(true)
    }

    @objc private func registrationButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
            print("Введите имя")
            return
        }

        let dateOfBirth = datePicker.date

        // Преобразуем текстовые значения в числа
        guard let height = Int(heightTextField.text ?? ""), let weight = Int(weightTextField.text ?? "") else {
            print("Введите корректные значения роста и веса")
            return
        }

        let allergy = allergiesTextField.text ?? ""

        // Передаем данные в ViewModel
        viewModel.registerUser(
            name: name,
            dateOfBirth: dateOfBirth,
            height: height,
            weight: weight,
            allergy: allergy
        )
        print("Пользователь зарегистрирован")
    }
}

extension RegistrationViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == PickerType.height.rawValue {
            return viewModel.heightOptions.count
        } else if pickerView.tag == PickerType.weight.rawValue {
            return viewModel.weightOptions.count
        } else if pickerView == allergiesPicker {
            return viewModel.allergyOptions.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == PickerType.height.rawValue {
            return "\(viewModel.heightOptions[row]) см"
        } else if pickerView.tag == PickerType.weight.rawValue {
            return "\(viewModel.weightOptions[row]) кг"
        } else if pickerView == allergiesPicker {
            return viewModel.allergyOptions[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == PickerType.height.rawValue {
            heightTextField.text = "\(viewModel.heightOptions[row]) см"
        } else if pickerView.tag == PickerType.weight.rawValue {
            weightTextField.text = "\(viewModel.weightOptions[row]) кг"
        } else if pickerView == allergiesPicker {
            allergiesTextField.text = viewModel.allergyOptions[row]
        }
    }
}

enum PickerType: Int {
    case height = 1
    case weight
}
