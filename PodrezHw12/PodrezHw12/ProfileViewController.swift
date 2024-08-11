//
//  ViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 10.08.24.
//

import UIKit

protocol EditFieldViewControllerDelegate: AnyObject {
    func didUpdateField(fieldName: String, withValue value: String)
}

protocol EditInterestsViewControllerDelegate: AnyObject {
    func didUpdateInterests(_ interests: [String])
}

struct User {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var birthDate: Date
    var interests: [String]
}

class ProfileViewController: UIViewController, EditFieldViewControllerDelegate, EditInterestsViewControllerDelegate {

    var user: User = User(firstName: "", lastName: "", age: 25, gender: "", birthDate: Date(), interests: ["Футбол", "Музыка", "Пить Пиво"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical

        stackView.spacing = 30
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Имя: \(user.firstName)", action: #selector(editFirstName)))
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Фамилия: \(user.lastName)", action: #selector(editLastName)))
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Возраст: \(user.age)", action: #selector(editAge)))
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Пол: \(user.gender)", action: #selector(editGender)))
        stackView.addArrangedSubview(createLabelWithButton(labelText: "День рождения: \(formatDate(user.birthDate))", action: #selector(editBirthDate)))
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Интересы: \(user.interests.joined(separator: ", "))", action: #selector(editInterests)))
    }
    
    func createLabelWithButton(labelText: String, action: Selector) -> UIView {
        let view = UIView()
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.numberOfLines = .max
        label.text = labelText
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let editButton = UIButton(type: .system)
        editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editButton.addTarget(self, action: action, for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.isUserInteractionEnabled = true
        view.addSubview(editButton)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
           
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            editButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    @objc func editButtonTapped() {
           print("Edit button tapped!")
       }
    // Методы редактирования полей
    @objc func editFirstName() {
        openEditScreen(fieldName: "Имя", initialValue: user.firstName)
    }
    
    @objc func editLastName() {
        openEditScreen(fieldName: "Фамилия", initialValue: user.lastName)
    }
    
    @objc func editAge() {
        openEditScreen(fieldName: "Возраст", initialValue: "\(user.age)")
    }
    
    @objc func editGender() {
        openEditScreen(fieldName: "Пол", initialValue: user.gender)
    }
    
    @objc func editBirthDate() {
        // Реализуйте этот метод для редактирования даты
    }
    
    @objc func editInterests() {
        let editInterestsVC = EditInterestsViewController(interests: user.interests)
        editInterestsVC.delegate = self
        present(editInterestsVC, animated: true, completion: nil)
    }
    
    func openEditScreen(fieldName: String, initialValue: String) {
        let editVC = EditFieldViewController(fieldName: fieldName, initialValue: initialValue) { [weak self] updatedValue in
            self?.didUpdateField(fieldName: fieldName, withValue: updatedValue)
        }
        editVC.delegate = self
        present(editVC, animated: true, completion: nil)
    }
    
    func didUpdateField(fieldName: String, withValue value: String) {
        switch fieldName {
        case "Имя":
            user.firstName = value
        case "Фамилия":
            user.lastName = value
        case "Возраст":
            if let age = Int(value) {
                user.age = age
            }
        case "Пол":
            user.gender = value
        case "Интересы":
            user.interests = value.components(separatedBy: ", ")
        default:
            break
        }
        reloadUI()
    }

    
    func didUpdateInterests(_ interests: [String]) {
        user.interests = interests
        reloadUI()
    }

    
    func reloadUI() {
        // Перезагружаем все элементы интерфейса
        view.subviews.forEach({ $0.removeFromSuperview() })
        setupUI()
    }
}
