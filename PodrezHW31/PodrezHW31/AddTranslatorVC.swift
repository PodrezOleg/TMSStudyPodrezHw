//
//  AddTranslatorVC.swift
//  PodrezHW31
//
//  Created by Oleg Podrez on 27.10.24.
//

import UIKit
import CoreData

protocol AddTranslatorDelegate: AnyObject {
    func didAddTranslator()
}

class AddTranslatorVC: UIViewController {

    weak var delegate: AddTranslatorDelegate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let languageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Язык"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let rateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ставка за 1800 символов"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()

    private let statusSwitch: UISwitch = {
        let switchControl = UISwitch()
        return switchControl
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Созранить", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Добавить переводчика"
        view.backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [nameTextField, languageTextField, rateTextField, statusSwitch, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc func saveButtonTapped() {
        let newTranslator = TranslatorData(context: context)
        newTranslator.name = nameTextField.text
        newTranslator.language = languageTextField.text
        newTranslator.rate = Int16(rateTextField.text ?? "0") ?? 0
        newTranslator.status = statusSwitch.isOn

        do {
            try context.save()
            delegate?.didAddTranslator()
            dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Failed to save translator: \(error), \(error.userInfo)")
        }
    }
}
