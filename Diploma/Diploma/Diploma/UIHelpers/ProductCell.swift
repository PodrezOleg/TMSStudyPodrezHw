//
//  ProductCell.swift
//  Diploma
//
//  Created by Oleg Podrez on 15.12.2024.
//
import UIKit

class ProductCell: UICollectionViewCell {
    // MARK: - UI Elements

    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
       
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views and Constraints

    private func setupViews() {
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(infoLabel)

        mainStackView.addArrangedSubview(productImageView)
        mainStackView.addArrangedSubview(contentStackView)

        contentView.addSubview(mainStackView)

        productImageView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            productImageView.widthAnchor.constraint(equalToConstant: 80),
            productImageView.heightAnchor.constraint(equalToConstant: 80),

            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8), 
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    // MARK: - Configure Cell

    func configure(with product: Product) {
        nameLabel.text = product.productName ?? "Без названия"

        if let nutriments = product.nutriments {
            let proteins = nutriments.proteins ?? 0.0
            let fats = nutriments.fat ?? 0.0
            let carbs = nutriments.carbohydrates ?? 0.0
            infoLabel.text = "Б: \(proteins) г | Ж: \(fats) г | У: \(carbs) г"
        } else {
            infoLabel.text = "Нет данных о БЖУ"
        }

        if let imageUrl = product.image_front_url {
            productImageView.loadImage(from: imageUrl)
        } else {
            productImageView.image = UIImage(named: "placeholder")
        }
    }
}

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(named: "placeholder")
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "placeholder")
                }
            }
        }
    }
}
