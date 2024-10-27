//
//  BackGroundHalloween.swift
//  PodrezHW32
//
//  Created by Oleg Podrez on 28.10.24.
//

import UIKit

extension UIView {
    func setBackgroundImage(named imageName: String) {
        let backgroundImageView = UIImageView(frame: self.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(backgroundImageView, at: 0)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
