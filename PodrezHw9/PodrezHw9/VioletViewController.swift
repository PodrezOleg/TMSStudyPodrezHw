//
//  VioletViewController.swift
//  PodrezHw9
//
//  Created by Oleg Podrez on 3.07.24.
//

import UIKit
import SnapKit
class VioletViewController: UIViewController {
    
    
    lazy var violetBackground = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        violetBackground.backgroundColor = .purple
        violetBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(violetBackground)
        violetBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
