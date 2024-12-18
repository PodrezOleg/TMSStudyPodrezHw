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
//    private let tableView = UITableView()
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawProgressCircle()
    }
    
    private func setupUI() {
        avatarImageView.image = UIImage(named: "placeholder")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = LayoutConstants.avaterCornerRadius
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.textAlignment = .center
        nameLabel.font = LayoutConstants.labelNameProfile
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        birthDateLabel.textAlignment = .center
        birthDateLabel.font = LayoutConstants.labelCarouselFont
        birthDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        heightWeightLabel.textAlignment = .center
        heightWeightLabel.font = LayoutConstants.labelCarouselFont
        heightWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addProductButton.setTitle("Добавить продукт", for: .normal)
        addProductButton.addTarget(self, action: #selector(addProductTapped), for: .touchUpInside)
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(birthDateLabel)
        view.addSubview(heightWeightLabel)
        view.addSubview(addProductButton)
    
        NSLayoutConstraint.activate([
         
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: LayoutConstants.welcomeViewBetweenElements * 2),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.avatarSize),
            
            birthDateLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            birthDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
            heightWeightLabel.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            heightWeightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
          
            addProductButton.topAnchor.constraint(equalTo: heightWeightLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func loadUserData() {
        guard let user = user else {
            print("Ошибка: пользователь не передан!")
            return
        }
        nameLabel.text = user.name ?? "Неизвестно"
        birthDateLabel.text = "Дата рождения: \(formatDate(user.dateOfBirth))"
        heightWeightLabel.text = "Рост: \(user.height) см | Вес: \(user.weight) кг"
        if let imageData = user.avatar, let avatarImage = UIImage(data: imageData) {
            avatarImageView.image = avatarImage
        } else {
            avatarImageView.image = UIImage(named: "placeholder")
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
