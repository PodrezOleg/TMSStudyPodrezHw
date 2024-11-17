//
//  MVPViewController.swift
//  PodrezHW34
//
//  Created by Oleg Podrez on 9.11.24.
//

import UIKit

protocol CountMVPViewProtocol: AnyObject {
    func updateCount(with value: Int)
}

class MVPViewController: UIViewController, CountMVPViewProtocol {

     let label = UILabel()
     let plusButton = UIButton()
     let minusButton = UIButton()
    lazy var presenter = CountMVPPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MVPViewController: viewDidLoad called")
        setupUI()
    }

    private func setupUI() {
        print("MVPViewController: setupUI called")
        
        view.backgroundColor = .cyan
        label.textColor = .systemOrange
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        
        plusButton.setTitle("Plus", for: .normal)
        minusButton.setTitle("Minus", for: .normal)
        
        plusButton.setTitleColor(.white, for: .normal)
        minusButton.setTitleColor(.white, for: .normal)
        plusButton.backgroundColor = .blue
        minusButton.backgroundColor = .red
        
        plusButton.addTarget(
            self,
            action: #selector(plusButtonTapped),
            for: .touchUpInside
        )
        minusButton.addTarget(
            self,
            action: #selector(minusButtonTapped),
            for: .touchUpInside
        )
        
        let stack = UIStackView(arrangedSubviews: [minusButton, label, plusButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

    func updateCount(with value: Int) {
        label.text = String(value)
    }
    
    @objc private func minusButtonTapped() {
        presenter.minusButtonTapped()
    }
    
    @objc private func plusButtonTapped() {
        presenter.plusButtonTapped()
    }
}
