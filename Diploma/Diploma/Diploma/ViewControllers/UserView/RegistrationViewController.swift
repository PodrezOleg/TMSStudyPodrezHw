
//  ViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 3.12.24.
//

import UIKit
import CoreData

class RegistrationViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//    private let appImageView = UIImageView()
    private let avatarImageView = UIImageView()
    private let nameTextField = UITextField()
    private let passTextField = UITextField()
    private let datePicker = UIDatePicker()
    private let heightTextField = UITextField()
    private let weightTextField = UITextField()
    private let registerButton = CustomButton()
    private let viewModel = RegistrationViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardHandling()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           
           // Возвращаемся на главный экран при нажатии "Назад"
           if self.isMovingFromParent {
               navigationController?.popToRootViewController(animated: true)
           }
       }
    
   
    private func setupUI() {
        title = "Регистрация"
        view.backgroundColor = .white
        
        avatarImageView.image = UIImage(named: "placeholder")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true
     
//        appImageView.image = UIImage(named: "Logo")
//        appImageView.contentMode = .scaleAspectFit
//        appImageView.translatesAutoresizingMaskIntoConstraints = false
    
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        nameTextField.delegate = self
        
        passTextField.placeholder = "Пароль"
        passTextField.borderStyle = .roundedRect
        passTextField.isSecureTextEntry = true
        passTextField.textContentType = .username
        passTextField.delegate = self
        
        heightTextField.placeholder = "Рост (см)"
        heightTextField.borderStyle = .roundedRect
        heightTextField.keyboardType = .numbersAndPunctuation
        heightTextField.delegate = self
        
        weightTextField.placeholder = "Вес (кг)"
        weightTextField.borderStyle = .roundedRect
        weightTextField.keyboardType = .numbersAndPunctuation
        weightTextField.delegate = self
    
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -16, to: Date())
        
        let stackView = UIStackView(arrangedSubviews: [
            /*appImageView*/ nameTextField, passTextField,
            datePicker, heightTextField, weightTextField
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        registerButton.setTitle("Sing up", for: .normal)
        registerButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
          
        view.addSubview(registerButton)
        view.addSubview(avatarImageView)
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.minusWelcomeViewBetweenElements),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
//            appImageView.heightAnchor.constraint(equalToConstant: 100),
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: LayoutConstants.buttonForRegisterConstant),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            avatarImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.avatarSize),
               avatarImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.avatarSize)
           
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectAvatar))
        avatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func selectAvatar() {
           let picker = UIImagePickerController()
           picker.sourceType = .photoLibrary
           picker.delegate = self
        picker.allowsEditing = true
           present(picker, animated: true)
       }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                avatarImageView.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    
    @objc private func registrationButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Введите имя")
            return
        }
        
        guard let password = passTextField.text, !password.isEmpty else {
            showAlert(message: "Введите пароль")
            return
        }
        
        let dateOfBirth = datePicker.date
        
        guard let height = Int(heightTextField.text ?? ""),
              let weight = Int(weightTextField.text ?? "") else {
            showAlert(message: "Введите корректные значения роста и веса")
            return
        }
        
       let user = CoreDataManager.shared.createUser(
            name: name,
            password: password,
            dateOfBirth: dateOfBirth,
            height: height,
            weight: weight,
            image: avatarImageView.image
        )
        
        let profileVC = ProfileViewController()
        profileVC.user = user
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Сообщение", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
