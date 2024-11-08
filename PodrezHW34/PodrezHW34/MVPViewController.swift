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

    private let label = UILabel()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private lazy var presenter = CountMVPPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MVPViewController: viewDidLoad called")
        setupUI()
    }

    private func setupUI() {
        print("MVPViewController: setupUI called")
        
        view.backgroundColor = .cyan
        label.textColor = .red
        label.text = "skdnflsdnflfngldknf"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        
        plusButton.setTitle("+", for: .normal)
        minusButton.setTitle("-", for: .normal)
        
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
        
        print("MVPViewController: UI setup complete")
    }

    func updateCount(with value: Int) {
        print("MVPViewController: updateCount called with value \(value)")
        label.text = String(value)
    }
    
    @objc private func minusButtonTapped() {
        print("MVPViewController: minusButtonTapped called")
        presenter.minusButtonTapped()
    }
    
    @objc private func plusButtonTapped() {
        print("MVPViewController: plusButtonTapped called")
        presenter.plusButtonTapped()
    }
}
