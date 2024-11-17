//
//  ViewController.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 29.09.24.
//
import UIKit

class ViewController: UIViewController {
    
    lazy var stackOfButtons: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userButton, photoButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    lazy var userButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "user"), for: .normal)
       
        button.frame.size = CGSize(width: 220, height: 120)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
     
        button.addTarget(self, action: #selector(showUsers), for: .touchUpInside)
        return button
    }()

    lazy var photoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "photo"), for: .normal)
       
        button.frame.size = CGSize(width: 220, height: 120)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
      
        button.addTarget(self, action: #selector(showPhotos), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: self.view)
        view.addSubview(stackOfButtons)
        
        NSLayoutConstraint.activate([
            stackOfButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackOfButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackOfButtons.heightAnchor.constraint(equalToConstant: 120),
            stackOfButtons.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc private func showUsers() {
        let usersVC = UsersViewController()
        navigationController?.pushViewController(usersVC, animated: true)
    }

    @objc private func showPhotos() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}
