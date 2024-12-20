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

    let labelView = UILabel()
    let label = UILabel()
     let plusButton = UIButton()
     let minusButton = UIButton()
    lazy var presenter = CountMVPPresenter(view: self)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
      
        labelView.text = NSLocalizedString (
            "MVP,выбрал архитектуру, взгляни на структуру!",
            comment: ""
        )
        labelView.textAlignment = .center
        labelView.textColor = .black
        labelView.numberOfLines = 0
        labelView.font = UIFont.systemFont(ofSize: 25)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .cyan
        label.textColor = .systemOrange
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        
        plusButton.setTitle(NSLocalizedString("Плюс", comment: ""), for: .normal)
        minusButton.setTitle(NSLocalizedString("Минус", comment: ""), for: .normal)
        
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
        
        view.addSubview(labelView)
        view.addSubview(stack)
        
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            labelView.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -30),
            labelView.centerXAnchor.constraint(equalTo: stack.centerXAnchor),
            labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
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
