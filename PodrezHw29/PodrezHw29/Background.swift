//
//  Background.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 29.09.24.
//

import UIKit

class UISetup {
    static func setupAnimatedBackground(for view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.locations = [0.0, 1.0, 0.1, 1.1]
        view.layer.insertSublayer(gradientLayer, at: 0)

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.systemIndigo.cgColor, UIColor.systemBlue.cgColor]
        animation.toValue = [UIColor.systemCyan.cgColor, UIColor.systemPink.cgColor]
        animation.duration = 4.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "animateColors")
    }
}
