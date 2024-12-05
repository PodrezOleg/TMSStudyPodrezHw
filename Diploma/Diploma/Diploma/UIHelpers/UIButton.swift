//
//  UIButton.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class CustomButton: UIButton {
    
    private var shapeLayers: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor.purple.withAlphaComponent(LayoutConstants.mainAlpha)
        self.layer.cornerRadius = LayoutConstants.cornerRadiusButton
        self.layer.shadowColor = UIColor.blue.cgColor
      
    }
}
