//
//  EditSingleInterestViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 12.08.24.
//

import UIKit

protocol EditSingleInterestViewControllerDelegate: AnyObject {
    func didUpdateInterest(at index: Int, with newValue: String)
}

class EditSingleInterestViewController: UIViewController {

    weak var delegate: EditSingleInterestViewControllerDelegate?
    var interest: String
    var interestIndex: Int?

    init(interest: String) {
        self.interest = interest
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        let textField = UITextField()
        textField.text = interest
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func saveTapped() {
        if let index = interestIndex, let delegate = delegate {
            delegate.didUpdateInterest(at: index, with: interest)
        }
        dismiss(animated: true, completion: nil)
    }
}
