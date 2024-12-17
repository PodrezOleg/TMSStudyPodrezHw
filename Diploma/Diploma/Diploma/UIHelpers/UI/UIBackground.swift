//
//  UIBackground.swift
//  Diploma
//
//  Created by Oleg Podrez on 4.12.24.
//

import UIKit

class UISetup {
    static func setupAnimatedBackground(for view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [
            UIColor.systemGreen.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemYellow.cgColor,
            UIColor.systemGreen.cgColor
        ]
        gradientLayer.locations = [0.2, 0.5, 1.1, 1.0]
        view.layer.insertSublayer(gradientLayer, at: 0)

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [
            UIColor.systemGreen.cgColor,
            UIColor.systemCyan.cgColor,
            UIColor.systemYellow.cgColor,
            UIColor.systemGreen.cgColor
        ]
        
        animation.toValue = [
            UIColor.systemMint.cgColor,
            UIColor.systemYellow.cgColor,
            UIColor.systemGreen.cgColor,
            UIColor.systemTeal.cgColor
        ]
        
        animation.duration = 4.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "animateColors")
    }
}
