//
//  ViewController.swift
//  PodrezHw10.2
//
//  Created by Oleg Podrez on 14.07.24.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        navigationItem.title = "First Page"
        
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5TH Page", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.addTarget(self, action: #selector(clickTheButton), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let foodButton = UIButton()
        foodButton.addTarget(self, action: #selector(healthButton), for: .touchUpInside)
        view.addSubview(foodButton)
        foodButton.translatesAutoresizingMaskIntoConstraints = false
        foodButton.setTitle("Is healthy food healthy food?", for: .normal)
        foodButton.setTitleColor(.systemOrange, for: .normal)
        
        foodButton.snp.makeConstraints{ make in
            make.topMargin.equalTo(button.snp.bottomMargin).offset(30)
            make.centerX.equalToSuperview()
        }
    }
        @objc func healthButton() {
            let mainTask2ViewController = MainTask2ViewController()
            navigationController?.pushViewController(mainTask2ViewController, animated: true)
        }
        
        @objc func clickTheButton() {
            let secondCotroller = SecondViewController()
            let thirdController = ThirdViewController()
            let fourthController = ForthViewController()
            let fifthController = FifthViewController()
            
            navigationController?.pushViewController(secondCotroller, animated: true)
            navigationController?.pushViewController(thirdController, animated: true)
            navigationController?.pushViewController(fourthController, animated: true)
            navigationController?.pushViewController(fifthController, animated: true)
        }
        
        
        class SecondViewController: UIViewController {
            
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemMint
                navigationItem.title = "Health Page"
            }
        }
        
        class ThirdViewController: UIViewController {
            
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemPink
                navigationItem.title = "Third Page"
            }
        }
        
        class ForthViewController: UIViewController {
            
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemTeal
                navigationItem.title = "May 4"
            }
        }
        
        class FifthViewController: UIViewController {
            
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemIndigo
                navigationItem.title = "Fifth"
                
                let label = UILabel()
                view.addSubview(label)
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = "5 page"
                label.textColor = .white
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                
                let homeButton = UIButton()
                homeButton.setTitle("To the start", for: .normal)
                homeButton.setTitleColor(.systemGreen, for: .normal)
                homeButton.translatesAutoresizingMaskIntoConstraints = false
                homeButton.addTarget(self, action: #selector(tapHomeButton), for: .touchUpInside)
                view.addSubview(homeButton)
                homeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
                homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                
                let secondPage = UIButton()
                secondPage.setTitle("To second Page", for: .normal)
                secondPage.setTitleColor(.white, for: .normal)
                view.addSubview(secondPage)
                secondPage.translatesAutoresizingMaskIntoConstraints = false
                secondPage.addTarget(self, action: #selector(tapSecondButoon), for: .touchUpInside)
                secondPage.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 100).isActive = true
                secondPage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                secondPage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            }
            
            @objc func tapHomeButton() {
                navigationController?.popToRootViewController(animated: true)
            }
            
            @objc func tapSecondButoon() {
                if let secondController = navigationController?.viewControllers.first(where: {
                    $0 is SecondViewController
                }) {
                    navigationController?.popToViewController(secondController, animated: true)
                }
            }
            
        }
    }
