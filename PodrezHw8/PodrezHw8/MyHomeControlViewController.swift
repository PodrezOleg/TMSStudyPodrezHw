//
//  MyHomeControlViewController.swift
//  PodrezHw8
//
//  Created by Oleg Podrez on 30.06.24.
//

import UIKit
import SnapKit

class MyHomeControlViewController: UIViewController {
    
    lazy var imageBackgroud = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var newTitleLabel = UILabel()
    lazy var newTitleLabelPass = UILabel()
    lazy var textField = UITextField()
    lazy var passwordField = UITextField()
    lazy var wrapper = UIView()
    lazy var buttonLogin = UIButton()
    lazy var buttonReg = UIButton()
    //    let imageBackgound = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageBackgroud)
        view.addSubview(textField)
        view.addSubview(passwordField)
        view.addSubview(buttonLogin)
        view.addSubview(buttonReg)
        view.addSubview(titleLabel)
        view.addSubview(newTitleLabel)
        view.addSubview(newTitleLabelPass)
        
        imageBackgroud.image = UIImage(named: "Background1")
        imageBackgroud.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroud.contentMode = .scaleAspectFill
        
//        textField.placeholder = "Please enter username"
//        passwordField.placeholder = "Please enter password"
        
        //        imageBackgroud.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        imageBackgroud.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //        imageBackgroud.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        imageBackgroud.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        // SnapKit
        
        imageBackgroud.snp.makeConstraints { make in
            make.edges.equalToSuperview()}
        
        
        wrapper.backgroundColor = .clear
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapper)
        wrapper.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(400)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        titleLabel.text = "My Home Control"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.textColor = .white
        titleLabel.bottomAnchor.constraint(equalTo: wrapper.topAnchor, constant: -100).isActive = true
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        newTitleLabel.text = "Username"
        newTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newTitleLabel.textColor = .white
        newTitleLabel.font = .systemFont(ofSize: 25)
        wrapper.addSubview(newTitleLabel)
        newTitleLabel.snp.makeConstraints {make in
            make.left.equalTo(wrapper.snp.left).offset(10)
            make.top.equalTo(wrapper.snp.top).offset(15)
        }
            
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please enter username"
        textField.layer.cornerRadius = 15
        wrapper.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.left).offset(10)
            make.top.equalTo(newTitleLabel.snp.bottom).offset(15)
            make.right.equalTo(wrapper.snp.right).offset(-10)
        }
        
        newTitleLabelPass.text = "Password"
        newTitleLabelPass.translatesAutoresizingMaskIntoConstraints = false
        newTitleLabelPass.textColor = .white
        newTitleLabelPass.font = .systemFont(ofSize: 25)
        wrapper.addSubview(newTitleLabelPass)
        newTitleLabelPass.snp.makeConstraints {make in
            make.left.equalTo(wrapper.snp.left).offset(10)
            make.top.equalTo(textField.snp.bottom).offset(15)
        }
            
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Please enter password"
        passwordField.layer.cornerRadius = 15
        wrapper.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.left).offset(10)
            make.top.equalTo(newTitleLabelPass.snp.bottom).offset(15)
            make.right.equalTo(wrapper.snp.right).offset(-10)
        }
        
        buttonLogin.setTitle("Log In", for: .normal)
        buttonLogin.backgroundColor = .white
        buttonLogin.setTitleColor(.black, for: .normal)
        wrapper.addSubview(buttonLogin)
        buttonLogin.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        buttonReg.setTitle("Register", for: .normal)
        buttonReg.backgroundColor = .clear
        buttonReg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottomMargin.equalToSuperview().offset(-40)
        }
        
        
            func addSubviews (_ views: UIView...) {
                views.forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    wrapper.addSubview($0)
                    $0.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 20).isActive = true
                    $0.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -20).isActive = true
                }
            }
            
            func alignToCenter(_ views: UIView...) {
                views.forEach {
                    $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                }
            }
        }
        
    }

