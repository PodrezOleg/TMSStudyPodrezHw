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
        label.text = "5 page"
        label.textColor = .white
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
    }
}
