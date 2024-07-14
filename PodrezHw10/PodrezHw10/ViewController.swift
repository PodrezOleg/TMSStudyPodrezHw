//
//  ViewController.swift
//  PodrezHw10
//
//  Created by Oleg Podrez on 13.07.24.
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
        
//        let task2Button = UIButton()
//        view.addSubview(task2Button)
//        task2Button.translatesAutoresizingMaskIntoConstraints = false
//        task2Button.setTitle("Second Task HW10", for: .normal)
//        task2Button.setTitleColor(.systemRed, for: .normal)
//        task2Button.addTarget(self, action: #selector(goToTaskTwo), for: .touchUpInside)
//        task2Button.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
//        task2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
//    @objc func goToTaskTwo() {
//        let task2Storyboard = UIStoryboard(name: "Task2", bundle: nil)
//        guard let viewController = task2Storyboard.instantiateViewController(withIdentifier: "Task2ViewController") as? SecondTask2ViewController else {
//            return
//        }
//        let healthyFood = HealthyFood(name: "Apple", count: 10, healthy: true)
//        viewController.healthyFood = healthyFood
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    
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
  
}
        class SecondViewController: UIViewController {

            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemMint
                navigationItem.title = "Second Page"
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

