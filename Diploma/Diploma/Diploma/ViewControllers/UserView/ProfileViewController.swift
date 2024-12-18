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
    private let addProductButton = CustomButton()
    private var selectedProducts: [Product] = []
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let birthDateLabel = UILabel()
    private let heightWeightLabel = UILabel()
    private let progressCircleLayer = CAShapeLayer()
    private let tableView = UITableView()
    private let headerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: view)
        title = "Профиль"
        setupUI()
        loadUserData()
        updateHeaderLabel()
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
        
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .black
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .singleLine
        tableView.layer.cornerRadius = LayoutConstants.cornerRadiusGeneral
        tableView.alpha = LayoutConstants.mainAlpha
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(birthDateLabel)
        view.addSubview(heightWeightLabel)
        view.addSubview(addProductButton)
        view.addSubview(headerLabel)
        view.addSubview(tableView)
        
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
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: addProductButton.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            headerLabel.topAnchor.constraint(equalTo: addProductButton.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        progressCircleLayer.strokeColor = UIColor.systemCyan.cgColor
        progressCircleLayer.fillColor = UIColor.clear.cgColor
        progressCircleLayer.lineWidth = 10
        progressCircleLayer.strokeEnd = 0
        view.layer.addSublayer(progressCircleLayer)
    }
    
    private func updateHeaderLabel() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let currentDate = formatter.string(from: Date())
        headerLabel.text = "Сегодняшняя дата: \(currentDate)"
    }
    
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
    
    private func updateProgressCircle() {
        let maxCarbs: Double = 100.0
        let progress = min(totalCarbohydrates / maxCarbs, 1.0)
        DispatchQueue.main.async {
            self.progressCircleLayer.strokeEnd = CGFloat(progress)
        }
    }
    
    @objc private func addProductTapped() {
        let nutritionVC = NutritionViewController()
        nutritionVC.onProductSelected = { [weak self] product in
            guard let self = self else { return }
            self.selectedProducts.append(product)
            self.totalCarbohydrates += product.nutriments?.carbohydrates ?? 0.0
            self.updateProgressCircle()
            self.updateHeaderLabel()
            self.tableView.reloadData()
        

        }
        navigationController?.pushViewController(nutritionVC, animated: true)
    }
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = selectedProducts[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = """
        \(product.productName ?? "Неизвестно")
        Белки: \(product.nutriments?.proteins ?? 0.0) г | Жиры: \(product.nutriments?.fat ?? 0.0) г | Углеводы: \(product.nutriments?.carbohydrates ?? 0.0) г
        """
        return cell
    }
}
