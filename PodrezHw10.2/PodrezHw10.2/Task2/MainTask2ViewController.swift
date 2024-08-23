//
//  MainTask2ViewController.swift
//  PodrezHw10.2
//
//  Created by Oleg Podrez on 14.07.24.
//

import UIKit

class MainTask2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Home Page for Food"
        
        let foodButton = UIButton()
        foodButton.addTarget(self, action: #selector(healthButon), for: .touchUpInside)
        view.addSubview(foodButton)
        foodButton.translatesAutoresizingMaskIntoConstraints = false
        foodButton.setTitle("Is healthy food healthy food?", for: .normal)
        foodButton.setTitleColor(.systemOrange, for: .normal)
        
        foodButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
    }
}

       @objc func healthButon() {
         let healthyFood = HealthyFood(name: "Apple", count: 10, healthy: true)
         let secondController = Task2ViewController()
         secondController.healthyFood = healthyFood
         navigationController?.pushViewController(secondController, animated: true)
    }
}
