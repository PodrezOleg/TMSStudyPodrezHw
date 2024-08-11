//
//  EditFieldViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 11.08.24.
//

import UIKit

class EditFieldViewController: UIViewController {
    
    weak var delegate: EditFieldViewControllerDelegate?
    
    var fieldName: String
    var initialValue: String
    private let completion: (String) -> Void
    
    private let textField = UITextField()
    private let saveButton = UIButton(type: .system)
    
    init(fieldName: String, initialValue: String, completion: @escaping (String) -> Void) {
        self.fieldName = fieldName
        self.initialValue = initialValue
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        
        textField.text = initialValue
    }
    
    private func setupUI() {
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            textField.widthAnchor.constraint(equalToConstant: 200),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func saveButtonTapped() {
        let updatedValue = textField.text ?? ""
        delegate?.didUpdateField(fieldName: fieldName, withValue: updatedValue)
        dismiss(animated: true, completion: nil)
    }
}
