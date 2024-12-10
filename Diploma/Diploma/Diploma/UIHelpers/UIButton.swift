//
//  UIButton.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class CustomButton: UIButton {
    
    private var shapeLayers: CAShapeLayer?
    private let buttonWidth: CGFloat = LayoutConstants.buttonWidth
    private let buttonHeight: CGFloat = LayoutConstants.buttonHeight
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 0.4)
        self.layer.cornerRadius = LayoutConstants.cornerRadiusButton
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
               self.layer.shadowOpacity = 0.3
               self.layer.shadowRadius = 4
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: LayoutConstants.buttonWidth),
            self.heightAnchor.constraint(equalToConstant: LayoutConstants.buttonHeight)
        ])
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
