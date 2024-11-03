//
//  EventFormController.swift
//  PodrezHW33
//
//  Created by Oleg Podrez on 30.10.24.
//

import UIKit
import ContactsUI

class EventFormController: UIViewController, CNContactPickerDelegate {
    var onAdd: ((Event) -> Void)?
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Укажи событие"
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        return picker
    }()
    
    private let useContactSwitch = UISwitch()
    private var selectedContactName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetup.setupAnimatedBackground(for: view)
        title = "Добавить Событие"
        
        setupUI()
    }
    
    private func setupUI() {
        let useContactLabel = UILabel()
        useContactLabel.text = "Использовать контакт"
        
        let addEventButton = UIButton(type: .system)
        addEventButton.setTitle("Добавить", for: .normal)
        addEventButton.tintColor = .white
        addEventButton.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
        
        [titleTextField, datePicker, useContactLabel, useContactSwitch, addEventButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            datePicker.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            useContactLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            useContactLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            useContactSwitch.centerYAnchor.constraint(equalTo: useContactLabel.centerYAnchor),
            useContactSwitch.leadingAnchor.constraint(equalTo: useContactLabel.trailingAnchor, constant: 10),
            
            addEventButton.topAnchor.constraint(equalTo: useContactSwitch.bottomAnchor, constant: 30),
            addEventButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        useContactSwitch.addTarget(self, action: #selector(selectContact), for: .valueChanged)
    }
    
    @objc private func selectContact() {
        if useContactSwitch.isOn {
            let contactPicker = CNContactPickerViewController()
            contactPicker.delegate = self
            present(contactPicker, animated: true, completion: nil)
        }
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        selectedContactName = contact.givenName
    }
    
    @objc private func addEvent() {
        let eventTitle: String
        if useContactSwitch.isOn, let contactName = selectedContactName {
              let userEventText = titleTextField.text ?? "Событие"
            eventTitle = "Назначаю отвественного \(contactName): \(userEventText)"
          } else {
              eventTitle = titleTextField.text ?? "Событие"
          }
        let newEvent = Event(title: eventTitle, date: datePicker.date, notificationInterval: 60 * 60 * 24)
        onAdd?(newEvent)
        
        Notifications.shared.updateBadgeCount()
        navigationController?.popViewController(animated: true)
    }
}
