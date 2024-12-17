//
//  WelcomeViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let textOnImageView = UILabel()
    private let titleLabel = UILabel()
    private let titleDescriptionLabel = UILabel()
    
    private lazy var featuresCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: LayoutConstants.cellWidth, height: LayoutConstants.cellHeight)
        layout.minimumLineSpacing = LayoutConstants.cellSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CarouselCellColletionView.self, forCellWithReuseIdentifier: CarouselCellColletionView.reuseIdentifier)
        return collectionView
    }()
    
    private let registrationButton = CustomButton()
    private let loginButton = CustomButton()
    
    private let features = [
        (centerText: "Доступно уже сейчас", bottomText: "Продукты", imageName: "ScrollViewBackground1"),
        (centerText: "Скоро в обновлениях", bottomText: "Подсчет ЖБУ" , imageName: "ScrollViewBackground2"),
        (centerText: "Следите за изменениями", bottomText: "Прогресс", imageName: "ScrollViewBackground3"),
        (centerText: "Больше статистики", bottomText: "Ежедневные отчеты", imageName: "ScrollViewBackground4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
    }
    
    private func setupUIWelcomeController() {
        UISetup.setupAnimatedBackground(for: view)
        
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = "Bee Fit!"
        titleLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleFontSizeLogo, weight: .bold)
        titleLabel.textAlignment = .center
        
        titleDescriptionLabel.text = "Придумай отмазку после праздников, а сейчас Ебзззззз"
        titleDescriptionLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleDescriptionFontSize, weight: .light)
        titleDescriptionLabel.numberOfLines = 0
        titleDescriptionLabel.textAlignment = .center
        
        registrationButton.setTitle("Sign Up", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        featuresCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(titleDescriptionLabel)
        view.addSubview(featuresCollectionView)
        view.addSubview(registrationButton)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.logoTopAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.logoSizeWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.logoSizeHeight),
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leadingLayoutConstant),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailingLayoutConstant),
            titleDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leadingLayoutConstant),
            titleDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailingLayoutConstant),
            featuresCollectionView.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            featuresCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leadingLayoutConstant),
            featuresCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailingLayoutConstant),
            featuresCollectionView.heightAnchor.constraint(equalToConstant: 250),
            registrationButton.topAnchor.constraint(equalTo: featuresCollectionView.bottomAnchor, constant: 20),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           
        ])
    }
    
    @objc private func registrationButtonTapped() {
        let registrationViewController = RegistrationViewController()
        navigationController?.delegate = self
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    @objc private func logInButtonTapped() {
        let userListVC = UserListViewController()
        navigationController?.delegate = self
        navigationController?.pushViewController(userListVC, animated: true)
    }
    }
    


//MARK:  Своя анимации перехода ( под вопросом)
extension WelcomeViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return FadeInAnimation()
        }
        return nil
    }
}


extension WelcomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return features.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CarouselCellColletionView.reuseIdentifier,
                for: indexPath
        ) as? CarouselCellColletionView else {
            print("Error: Unable to dequeue CarouselCellColletionView. Returning a default cell.")
            return UICollectionViewCell()
        }
        
        let feature = features[indexPath.item]
        cell.configureCell(with: feature)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            navigationController?.pushViewController(NutritionViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(DemoFPSViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(CustomBrowserViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(DemoReportsViewController(), animated: true)
        default:
            break
        }
    }
}
