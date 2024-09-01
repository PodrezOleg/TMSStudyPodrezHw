//
//  ViewController.swift
//  PodrezHw18
//
//  Created by Oleg Podrez on 26.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Передать тут"
        textField.borderStyle = .roundedRect
        textField.backgroundColor? = .clear
        return textField
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нажать тут", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let notificationView: UIView = {
        let notificationView = UIView()
        notificationView.backgroundColor = .white
        notificationView.layer.cornerRadius = 15
        notificationView.layer.shadowColor = UIColor.systemOrange.cgColor
        notificationView.layer.shadowOpacity = 0.3
        notificationView.layer.shadowOffset = CGSize(width: 6, height: 2)
        notificationView.layer.shadowRadius = 4
        return notificationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        setupView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    func setupView() {
        
        view.addSubview(notificationView)
        
        
        notificationView.addSubview(label)
        notificationView.addSubview(textField)
        notificationView.addSubview(button)
        
        
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            notificationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            notificationView.widthAnchor.constraint(equalToConstant: 300),
            notificationView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            label.topAnchor.constraint(equalTo: notificationView.topAnchor, constant: 20),
            
            textField.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.widthAnchor.constraint(equalToConstant: 250),
            
            button.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func buttonTapped() {
        label.text = textField.text
        textField.text = ""
        textField.resignFirstResponder()
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            notificationView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight / 1.25)
        }
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        notificationView.transform = .identity
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
