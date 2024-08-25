//
//  ButtonDelegate.swift
//  PodrezHw17
//
//  Created by Oleg Podrez on 25.08.24.
//

import UIKit
protocol ButtonDelegateTap: AnyObject {
    func didTapUp()
    func didTapDown()
    func didTapLeft()
    func didTapRight()
}

class ButtonDelegate: UIView {
    
    weak var delegate: ButtonDelegateTap?
    
    private lazy var upButton: UIButton = createButton(with: "arrowshape.up.fill")
    private lazy var downButton: UIButton = createButton(with: "arrowshape.down.fill")
    private lazy var leftButton: UIButton = createButton(with: "arrowshape.left.fill")
    private lazy var rightButton: UIButton = createButton(with: "arrowshape.right.fill")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createButton(with systemImageName: String) -> UIButton {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold)
        let image = UIImage(systemName: systemImageName, withConfiguration: config)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }
    @objc private func buttonTapped(_ sender: UIButton) {
        switch sender {
        case upButton:
            delegate?.didTapUp()
        case downButton:
            delegate?.didTapDown()
        case leftButton:
            delegate?.didTapLeft()
        case rightButton:
            delegate?.didTapRight()
        default:
            break
        }
        
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [leftButton, rightButton, upButton, downButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
