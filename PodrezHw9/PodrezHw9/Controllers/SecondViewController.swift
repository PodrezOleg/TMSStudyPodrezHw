//
//  SecondViewController.swift
//  PodrezHw9
//
//  Created by Oleg Podrez on 8.07.24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    lazy var labelText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Hello"
        view.addSubview(labelText)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        view.backgroundColor = .purple
        title = "Second Screen"
        
        func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }
    }
}
