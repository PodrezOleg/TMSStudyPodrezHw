//
//  Background.swift
//  PodrezHW31
//
//  Created by Oleg Podrez on 27.10.24.
//

import Foundation
import UIKit

class uISetupBackground {
    static func setupAnimatedBackground(for view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.locations = [0.0, 1.0, 0.1, 1.1]
        view.layer.insertSublayer(gradientLayer, at: 0)

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.systemOrange.cgColor, UIColor.systemBlue.cgColor]
        animation.toValue = [UIColor.darkGray.cgColor, UIColor.systemOrange.cgColor]
        animation.duration = 4.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "animateColors")
    }
}
