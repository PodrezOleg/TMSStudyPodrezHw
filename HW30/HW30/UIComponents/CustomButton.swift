//
//  CustomButton.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import UIKit

class CustomMenuButton: UIButton {
    
    private var gradientLayer: CAGradientLayer?
    private var shapeLayers: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupButton()
        StartAnimationBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupButton() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.layer.cornerRadius = LayoutConstants.cornerRadiusButton

        setupGradientBorder()
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = LayoutConstants.shadowOffsetButton
        self.layer.shadowOpacity = LayoutConstants.shadowOpacityButton
        self.layer.shadowRadius = LayoutConstants.shadowRadiusButton
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: CGFloat(LayoutConstants.buttonWidth)).isActive = true
        self.heightAnchor.constraint(equalToConstant: CGFloat(LayoutConstants.buttonHeight)).isActive = true
    }
    private func setupGradientBorder() {
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = self.bounds
        gradientLayer?.colors = [UIColor.red.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer?.cornerRadius = LayoutConstants.cornerRadiusButton
        gradientLayer?.masksToBounds = true
        
        shapeLayers = CAShapeLayer()
        shapeLayers?.lineWidth = LayoutConstants.borderWidthButton
        shapeLayers?.path = UIBezierPath(roundedRect: bounds, cornerRadius: LayoutConstants.cornerRadiusButton).cgPath
        shapeLayers?.fillColor = UIColor.clear.cgColor
        shapeLayers?.strokeColor = UIColor.white.cgColor
        
        guard let gradientLayer = gradientLayer, let shapeLayer = shapeLayers else {
            return
        }
        layer.addSublayer(shapeLayer)
        gradientLayer.mask = shapeLayer
        layer.insertSublayer(gradientLayer, below: shapeLayer)
    }
    
    func StartAnimationBorder() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        animation.toValue = [UIColor.cyan.cgColor, UIColor.orange.cgColor, UIColor.white.cgColor]
        animation.duration = 2.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer?.add(animation, forKey: "changeColor")
    }
    
    func setButtonTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
        shapeLayers?.path = UIBezierPath(
            roundedRect: bounds, cornerRadius: LayoutConstants.cornerRadiusButton).cgPath
    }
}
