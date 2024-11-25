//
//  ViewController.swift
//  PodrezHW38
//
//  Created by Oleg Podrez on 25.11.24.
//

import UIKit

class ViewController: UIViewController {

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       let hello = UILabel()
        hello.text = "Hello, World!"
        hello.textColor = .red
        hello.font = .systemFont(ofSize: 30)
        hello.textAlignment = .center
        view.addSubview(hello)
        hello.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hello.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hello.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

