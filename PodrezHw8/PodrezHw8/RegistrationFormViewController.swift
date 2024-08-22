//
//  RegistrationFormViewController.swift
//  PodrezHw8
//
//  Created by Oleg Podrez on 1.07.24.
//
import SnapKit
import UIKit


class RegistrationFormViewController: UIViewController {
    
    
    lazy var imageBackround = UIImageView()
    lazy var wrapper = UIView()
    lazy var userField = UITextField()
    lazy var passwordField = UITextField()
    lazy var confirmPasswordField = UITextField()
    lazy var titleLabel = UILabel()
    lazy var titleLabelName = UILabel()
    lazy var titleLabelPassword = UILabel()
    lazy var titleLabelConfirmPass = UILabel()
    lazy var button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(imageBackround)
        imageBackround.translatesAutoresizingMaskIntoConstraints = false
        imageBackround.image = UIImage(named: "Background3")
        imageBackround.contentMode = .scaleAspectFill
        imageBackround.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.text = "Registration Form"
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        wrapper.backgroundColor = .clear
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapper)
        wrapper.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(550)

        }
        
        titleLabelName.text = "Username"
        titleLabelName.textColor = .white
        titleLabelName.font = .boldSystemFont(ofSize: 30)
        wrapper.addSubview(titleLabelName)
        titleLabelName.translatesAutoresizingMaskIntoConstraints = false
        titleLabelName.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.left).offset(20)
            make.top.equalTo(wrapper.snp.top).offset(15)
        }
        addTextField(userField, placeholder: "Please enter username", above: titleLabelName, topSpaicing: 10)
        
        titleLabelPassword.text = "Password"
        titleLabelPassword.textColor = .white
        titleLabelPassword.font = .boldSystemFont(ofSize: 30)
        wrapper.addSubview(titleLabelPassword)
        titleLabelPassword.translatesAutoresizingMaskIntoConstraints = false
        titleLabelPassword.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.left).offset(20)
            make.top.equalTo(titleLabelName.snp.bottom).offset(50)
        }
        
        addTextField(passwordField, placeholder: "Please enter password", above: titleLabelPassword, topSpaicing: 10)
        
        titleLabelConfirmPass.text = "Confirm Password"
        titleLabelConfirmPass.textColor = .white
        titleLabelConfirmPass.font = .boldSystemFont(ofSize: 30)
        wrapper.addSubview(titleLabelConfirmPass)
        titleLabelConfirmPass.translatesAutoresizingMaskIntoConstraints = false
        titleLabelConfirmPass.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.left).offset(20)
            make.top.equalTo(titleLabelPassword.snp.bottom).offset(50)
        }
        
        addTextField(confirmPasswordField, placeholder: "Confirm password", above: titleLabelConfirmPass, topSpaicing: 10)

        
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        wrapper.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabelConfirmPass.snp.bottom).offset(130)
            make.width.equalTo(100)
        }
            
            
      
        func addTextField(_ textField: UITextField, placeholder: String, above previousField: UIView?, topSpaicing: CGFloat = 15, leftOffset: CGFloat = 20, rightOffset: CGFloat = -10) {
            textField.placeholder = placeholder
            textField.borderStyle = .roundedRect
            wrapper.addSubview(textField)
            textField.snp.makeConstraints { make in
                make.left.equalTo(wrapper.snp.left).offset(leftOffset)
                make.right.equalTo(wrapper.snp.right).offset(rightOffset)
                if let previousField = previousField {
                    make.top.equalTo(previousField.snp.bottom).offset(topSpaicing)
                } else {
                    make.top.equalTo(wrapper.snp.top).offset(30)
                }
            }
        }
    }
}
