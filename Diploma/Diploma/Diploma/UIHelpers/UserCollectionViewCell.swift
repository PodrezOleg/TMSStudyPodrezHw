//
//  UserCollectionViewCell.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "UserCell"
    
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 10
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with name: String) {
        nameLabel.text = name
    }
}
