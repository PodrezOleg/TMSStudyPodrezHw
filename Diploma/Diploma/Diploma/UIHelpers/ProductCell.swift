//
//  ProductCell.swift
//  Diploma
//
//  Created by Oleg Podrez on 15.12.2024.
//

import UIKit

class ProductCell: UICollectionViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private let gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with product: Product) {
        nameLabel.text = product.productName ?? "Без названия"
        gradeLabel.text = "Nutriscore: \(product.nutriscoreGrade?.uppercased() ?? "N/A")"
    }

    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(gradeLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            gradeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            gradeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            gradeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            gradeLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
