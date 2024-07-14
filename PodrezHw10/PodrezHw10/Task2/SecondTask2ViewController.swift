//
//  SecondTask2ViewController.swift
//  PodrezHw10
//
//  Created by Oleg Podrez on 13.07.24.
//

import UIKit
import SnapKit

class SecondTask2ViewController: UIViewController {

    var healthyFood: HealthyFood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Healthy Food"
        
        guard let healthyFood = healthyFood else { return }
        
        let labelName = UILabel()
        let labelCount = UILabel()
        let labelTruth = UILabel()
        
        labelName.text = "Food name is: \(healthyFood.name)"
        labelCount.text = "Amount: \(healthyFood.count)"
        labelTruth.text = "Is it Healthy? \(healthyFood.healthy ? "Yes" : "No")"
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelCount.translatesAutoresizingMaskIntoConstraints = false
        labelTruth.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelName)
        view.addSubview(labelCount)
        view.addSubview(labelTruth)
        
        labelName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        labelCount.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelName.snp.bottom).offset(20)
        }
        labelTruth.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelCount.snp.bottom).offset(20)
        }
    }
}
