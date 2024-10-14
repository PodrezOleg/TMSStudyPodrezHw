//
//  ControllersBackgrounds.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import UIKit

class backgroundController {
    static func setupBackground(for view: UIView, imageName: String) {
        for subview in view.subviews {
            if let imageView = subview as? UIImageView {
                imageView.removeFromSuperview()
            }
        }
        
        guard let backgroundImage = UIImage(named: imageName) else {
            print("Error: background image not found \(imageName)")
            return
        }
        
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    static func setupBlurBackground( for view: UIView, style: UIBlurEffect.Style, alpha: CGFloat) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.alpha = LayoutConstants.blurAlpha
        view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)
        
        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
