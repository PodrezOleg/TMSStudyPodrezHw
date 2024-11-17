//
//  AddTranslatorVC.swift
//  PodrezHW31
//
//  Created by Oleg Podrez on 27.10.24.
//

import CoreData
import UIKit

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

    private let statusSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Свободен", "Занят"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        uISetupBackground.setupAnimatedBackground(for: view)

        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {

        NotificationCenter.default.removeObserver(
            self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(
            self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func setupUI() {
        title = "Добавить переводчика"
        view.backgroundColor = .white

        let mainStackView = UIStackView(arrangedSubviews: [
            nameTextField, languageTextField, rateTextField, statusSegmentedControl, saveButton,
        ])
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    @objc func saveButtonTapped() {
        let newTranslator = TranslatorData(context: context)
        newTranslator.name = nameTextField.text
        newTranslator.language = languageTextField.text
        newTranslator.rate = Int16(rateTextField.text ?? "0") ?? 0
        newTranslator.status = (statusSegmentedControl.selectedSegmentIndex == 0)

        do {
            try context.save()
            delegate?.didAddTranslator()
            dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Failed to save translator: \(error), \(error.userInfo)")
        }
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? CGRect
        {
            let keyboardHeight = keyboardFrame.height
            self.view.frame.origin.y = -keyboardHeight / 2
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}
