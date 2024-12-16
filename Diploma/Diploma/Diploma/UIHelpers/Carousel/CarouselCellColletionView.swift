//
//  CarouselCellColletionView.swift
//  Diploma
//
//  Created by Oleg Podrez on 10.12.2024.
//

import UIKit

class CarouselCellColletionView: UICollectionViewCell {
    static let reuseIdentifier = "CarouselCell"
    
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init? (coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = LayoutConstants.cornerRadiusGeneral
        label.font = LayoutConstants.labelCarouselFont
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: LayoutConstants.cellLabelBottomConstant)
        ])
        
    }
    
    func configureCell(with cellSetup: (text: String, imageName: String)) {
        label.text = cellSetup.text
        imageView.image = UIImage(named: cellSetup.imageName)
    }
}
