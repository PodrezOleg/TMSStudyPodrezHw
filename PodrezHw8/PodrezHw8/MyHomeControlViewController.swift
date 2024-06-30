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
    lazy var textField = UITextField()
    lazy var passwordField = UITextField()
    lazy var button = UIButton()
    lazy var wrapper = UIView()
    //    let imageBackgound = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageBackgroud)
        view.addSubview(textField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.addSubview(titleLabel)
        view.addSubview(wrapper)
        
        imageBackgroud.image = UIImage(named: "Background1")
        imageBackgroud.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroud.contentMode = .scaleAspectFill
        
        textField.placeholder = "Please enter username"
        passwordField.placeholder = "Please enter password"
        
        //        imageBackgroud.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        imageBackgroud.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //        imageBackgroud.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        imageBackgroud.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        // SnapKit
        
        imageBackgroud.snp.makeConstraints { make in
            make.edges.equalToSuperview()}
        
        
        wrapper.backgroundColor = .white
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapper)
        wrapper.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(400)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        titleLabel.text = "My Home Control"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textColor = .white
        titleLabel.bottomAnchor.constraint(equalTo: wrapper.topAnchor, constant: -30).isActive = true
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            
            
            
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
}
