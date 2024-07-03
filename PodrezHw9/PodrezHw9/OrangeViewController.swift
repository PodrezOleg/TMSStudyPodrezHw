//
//  OrangeViewController.swift
//  PodrezHw9
//
//  Created by Oleg Podrez on 3.07.24.
//

import UIKit
import SnapKit
class OrangeViewController: UIViewController {
    
    
    lazy var orangeBackground = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        orangeBackground.backgroundColor = .orange
        orangeBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orangeBackground)
        orangeBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

        
    }
}
