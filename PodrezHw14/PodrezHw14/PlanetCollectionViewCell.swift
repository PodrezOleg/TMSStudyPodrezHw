//
//  PlanetCollectionViewCell.swift
//  PodrezHw14
//
//  Created by Oleg Podrez on 19.08.24.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlanetCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.alpha = 0.75
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelHeight: CGFloat = 30
        let imageViewHeight = contentView.frame.size.height - labelHeight

        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: imageViewHeight)
        label.frame = CGRect(x: 0, y: imageView.frame.size.height, width: contentView.frame.size.width, height: -100)
    }
    
    public func configure(with planet: Planet) {
        imageView.image = UIImage(named: planet.imageName)
        label.text = planet.name
    }
}
