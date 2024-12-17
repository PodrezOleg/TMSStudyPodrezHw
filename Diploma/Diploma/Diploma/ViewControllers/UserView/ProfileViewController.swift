//
//  ProfileViewCOntroller.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    var user: User?
    private var totalCarbohydrates: Double = 0.0
    private let tableView = UITableView()
    private let addProductButton = CustomButton()
    
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let birthDateLabel = UILabel()
    private let heightWeightLabel = UILabel()
    private let progressCircleLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: view)
        title = "Профиль"
        
        setupUI()
        loadUserData()
        drawProgressCircle()
    }
    
    private func setupUI() {
        avatarImageView.image = UIImage(named: "placeholder") // Заглушка аватара
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        birthDateLabel.textAlignment = .center
        birthDateLabel.font = UIFont.systemFont(ofSize: 16)
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        heightWeightLabel.textAlignment = .center
        heightWeightLabel.font = UIFont.systemFont(ofSize: 16)
        heightWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addProductButton.setTitle("Добавить продукт", for: .normal)
        addProductButton.addTarget(self, action: #selector(addProductTapped), for: .touchUpInside)
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(birthDateLabel)
        view.addSubview(heightWeightLabel)
        view.addSubview(addProductButton)
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            birthDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            birthDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            heightWeightLabel.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: 5),
            heightWeightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addProductButton.topAnchor.constraint(equalTo: heightWeightLabel.bottomAnchor, constant: 20),
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: addProductButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func loadUserData() {
        if let user = user {
            nameLabel.text = user.name ?? "Неизвестно"
            birthDateLabel.text = "Дата рождения: \(formatDate(user.dateOfBirth))"
            heightWeightLabel.text = "Рост: \(user.height) см | Вес: \(user.weight) кг"
        }
    }
    
    private func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "Неизвестно" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    private func drawProgressCircle() {
        let center = CGPoint(x: avatarImageView.center.x, y: avatarImageView.center.y)
        let radius: CGFloat = 80
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let backgroundCircle = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        backgroundCircle.path = circlePath.cgPath
        backgroundCircle.strokeColor = UIColor.lightGray.cgColor
        backgroundCircle.fillColor = UIColor.clear.cgColor
        backgroundCircle.lineWidth = 10
        view.layer.addSublayer(backgroundCircle)
        
        progressCircleLayer.path = circlePath.cgPath
        progressCircleLayer.strokeColor = UIColor.systemGreen.cgColor
        progressCircleLayer.fillColor = UIColor.clear.cgColor
        progressCircleLayer.lineWidth = 10
        progressCircleLayer.strokeEnd = 0
        view.layer.addSublayer(progressCircleLayer)
    }
    
    private func updateProgressCircle() {
        
        let maxCarbs: Double = 300.0
        let progress = min(totalCarbohydrates / maxCarbs, 1.0)
        progressCircleLayer.strokeEnd = CGFloat(progress)
    }
   
    @objc private func addProductTapped() {
        let nutritionVC = NutritionViewController()
        nutritionVC.onCarbsUpdated = { [weak self] carbs in
            self?.totalCarbohydrates += carbs
            self?.updateProgressCircle()
        }
        nutritionVC.modalPresentationStyle = .pageSheet
        present(nutritionVC, animated: true)
    }
}
