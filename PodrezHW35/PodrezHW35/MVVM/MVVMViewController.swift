//
//  MVVMViewController.swift
//  PodrezHW35
//
//  Created by Oleg Podrez on 11.11.24.
//

import UIKit
import Combine

class MVVMViewController: UIViewController {
    private let label = UILabel()
    private let labelView = UILabel()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    
    private var viewModel: MVVMViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: MVVMViewModel = MVVMViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
      
        labelView.text = "MVVM, это как MVP, но с большими возможностями и меньшим количеством шаблонного кода."
        labelView.textAlignment = .center
        labelView.textColor = .black
        labelView.numberOfLines = 0
        labelView.font = UIFont.systemFont(ofSize: 25)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemMint
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
    
    private func setupBindings() {
        viewModel.$countText
            .receive(on: RunLoop.main)
            .sink { [weak self ] count in
            self?.label.text = count
        }
        .store(in: &cancellables)
    }
    
    @objc func plusButtonTapped() {
        viewModel.plusOne()
    }
    @objc func minusButtonTapped() {
        viewModel.minusOne()
    }
    
}
