//
//  FirstViewController.swift
//  PodrezHw9
//
//  Created by Oleg Podrez on 8.07.24.
//

import UIKit
import SnapKit

        class FirstViewController: UIViewController {
            
            lazy var greenButton = UIButton()
            lazy var bound = UIView()
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                view.backgroundColor = .orange
                title = "First Screen"
                
                bound.backgroundColor = .darkGray
                view.addSubview(bound)
                bound.translatesAutoresizingMaskIntoConstraints = false
                bound.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(200)
                    make.height.equalTo(400)
                }
                
                greenButton.setTitle("Go to page 3", for: .normal)
                greenButton.setTitleColor(.systemGreen, for: .normal)
                greenButton.backgroundColor = .darkGray
                greenButton.translatesAutoresizingMaskIntoConstraints = false
                bound.addSubview(greenButton)
                greenButton.snp.makeConstraints { make in
                    make.width.equalTo(150)
                    make.height.equalTo(30)
                    make.centerX.equalTo(bound)
                    make.centerY.equalTo(bound)
                    
                }
                greenButton.addTarget(self, action: #selector(openNextPage), for: .touchUpInside)
            }
            
            @objc func openNextPage() {
                let secondViewController = SecondViewController()
                let thirdViewController = ThirdViewController()
                navigationController?.pushViewController(secondViewController, animated: true)
                navigationController?.pushViewController(thirdViewController, animated: true)
               }
        }
