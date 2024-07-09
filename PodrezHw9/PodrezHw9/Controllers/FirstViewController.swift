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
                
                greenButton.setTitle("Go to page 3", for: .normal)
                greenButton.setTitleColor(.systemGreen, for: .normal)
                greenButton.backgroundColor = .darkGray
                greenButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(greenButton)
                greenButton.addTarget(self, action: #selector(openNextPage), for: .touchUpInside)
                greenButton.snp.makeConstraints { make in
                    make.width.equalTo(150)
                    make.height.equalTo(30)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                }
            }
    
            @objc func openNextPage() {
              
                let secondViewController = SecondViewController()
                let thirdViewController = ThirdViewController()
                
                navigationController?.pushViewController(secondViewController, animated: true)
                navigationController?.pushViewController(thirdViewController, animated: true)
               }
            }
