//
//  ViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 10.08.24.
//

import UIKit




protocol SelectGenderViewControllerDelegate: AnyObject {
    func didSelectGender(_ gender: String)
}

struct User {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
    var birthDate: Date
    var interests: [String]
}

class ProfileViewController: UIViewController, EditFieldViewControllerDelegate, EditInterestsViewControllerDelegate, SelectGenderViewControllerDelegate {
   
    var user: User = User(firstName: "", lastName: "", age: 0 , gender: "Укажите пол", birthDate: Date(), interests: ["Футбол", "Музыка", "Пить Пиво"])


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль Пользователя"
        setupUI()
    }
    

    
    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical

        stackView.spacing = 10
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
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Дата рождения: \(formatDate(user.birthDate))", action: #selector(editBirthDate)))
        stackView.addArrangedSubview(createLabelWithButton(labelText: "Интересы: \(user.interests.joined(separator: ", "))", action: #selector(editInterests)))
    }
    
    func createLabelWithButton(labelText: String, action: Selector) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.backgroundColor = .lightGray
        label.numberOfLines = 0
        label.text = labelText
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)

        let editButton = UIButton(type: .system)
        editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editButton.addTarget(self, action: action, for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(editButton)

        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -30),
            
            editButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            editButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            
            containerView.heightAnchor.constraint(equalTo: label.heightAnchor, constant: 20)
        ])
        
        return containerView
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    @objc func editButtonTapped() {
           print("Edit button tapped!")
       }
    
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
           let selectGenderVC = SelectGenderViewController(currentGender: user.gender)
           selectGenderVC.delegate = self
           present(selectGenderVC, animated: true, completion: nil)
       }
    
    @objc func editBirthDate() {
        let alertControl = UIAlertController(title: "Укажите Дату рождения", message: nil, preferredStyle: .alert)
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
     
        let minDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
        let maxDate = Date()
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        
        alertControl.view.addSubview(datePicker)
        
  
        alertControl.view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: alertControl.view.centerXAnchor).isActive = true
        datePicker.topAnchor.constraint(equalTo: alertControl.view.topAnchor, constant: 50).isActive = true
        
  
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
          
            let selectedDate = datePicker.date
            self.user.birthDate = selectedDate
            self.user.age = self.calculateAge(from: selectedDate)
            self.reloadUI()
        }
        alertControl.addAction(saveAction)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertControl.addAction(cancelAction)
        
        present(alertControl, animated: true, completion: nil)
    }

    func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
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
    
    func didSelectGender(_ gender: String) {
        user.gender = gender
        reloadUI()
    }
    
    func reloadUI() {
    
        view.subviews.forEach { $0.removeFromSuperview() }
        setupUI()
    }
}
