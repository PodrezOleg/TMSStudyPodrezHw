//
//  CarouselCellColletionView.swift
//  Diploma
//
//  Created by Oleg Podrez on 10.12.2024.
//

import UIKit

class CarouselCellColletionView: UICollectionViewCell {
    
    static let reuseIdentifier = "CarouselCellColletionView"
    
    private let imageView = UIImageView()
    private let centerTextLabel = UILabel() 
    private let bottomTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = LayoutConstants.cornerRadiusGeneral
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        centerTextLabel.textAlignment = .center
        centerTextLabel.textColor = .white
        centerTextLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleDescriptionFontSize, weight: .bold)
        centerTextLabel.numberOfLines = 0
        centerTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bottomTextLabel.textAlignment = .center
        bottomTextLabel.textColor = .white
        bottomTextLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleDescriptionFontSize, weight: .light)
        bottomTextLabel.numberOfLines = 1
        bottomTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        imageView.addSubview(centerTextLabel)
        imageView.addSubview(bottomTextLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            centerTextLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            centerTextLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            centerTextLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            centerTextLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            bottomTextLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            bottomTextLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            bottomTextLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            bottomTextLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])
    }
    func configureCell(with feature: (centerText: String, bottomText: String, imageName: String)) {
        imageView.image = UIImage(named: feature.imageName)
        centerTextLabel.text = feature.centerText
        bottomTextLabel.text = feature.bottomText
    }
}
