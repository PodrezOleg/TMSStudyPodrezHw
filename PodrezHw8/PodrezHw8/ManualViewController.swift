//
//  ManualViewController.swift
//  PodrezHw8
//
//  Created by Oleg Podrez on 30.06.24.
//

import UIKit
import SnapKit

class ManualViewController: UIViewController {
    lazy var label = UILabel()
    lazy var actionButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(actionButton)
        
        label.text = "123"
        //        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        label.snp.makeConstraints{
            $0.top.leading.equalTo(view.safeAreaLayoutGuide) }
        
        //        actionButton.translatesAutoresizingMaskIntoConstraints = false
        //        actionButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        //        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.center.equalTo(view)
            $0.trailing.equalToSuperview().offset(-20)
        
        }
        
        actionButton.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(1)
            $0.centerX.equalToSuperview()
          
        }
    
        
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        
        label.textColor = .orange
        
        actionButton.backgroundColor = .red
        actionButton.setTitle("Change Color", for: .normal)
//        actionButton.setTitleColor(.red, for: .highlighted)
        actionButton.titleLabel?.font = .systemFont(ofSize: 20)
//        actionButton.isEnabled = false

    }
    
    @IBAction func actionButtonTouched(_ sender: Any) {
        let colors: [UIColor] = [.red, .green, .blue, .orange, .clear]
        actionButton.backgroundColor = colors.randomElement()
    }
    
}

    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


