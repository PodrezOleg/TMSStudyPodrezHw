//
//  WelcomeViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 12/5/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let titleDescriptionLabel = UILabel()
    private let featuresCarousel = FeaturesCarousel()
    private let registrationButton = CustomButton()
    private let loginButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
        featuresCarousel.delegate = self
        print("Delegate set: \(featuresCarousel.delegate != nil)") // От
        
    }
    
    private func setupUIWelcomeController() {
        
        UISetup.setupAnimatedBackground(for: view)
        
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        
        // MARK: придумать приветсвие
        
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
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        featuresCarousel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(titleDescriptionLabel)
        view.addSubview(featuresCarousel)
        view.addSubview(registrationButton)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate(
            [
                // Логотип
                logoImageView.topAnchor
                    .constraint(
                        equalTo: view.safeAreaLayoutGuide.topAnchor,
                        constant: LayoutConstants.logoTopAnchor),
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.logoSizeWidth),
                logoImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.logoSizeHeight),
                
                // Текст
                titleLabel.topAnchor
                    .constraint(
                        equalTo: logoImageView.bottomAnchor,
                        constant: LayoutConstants.welcomeViewBetweenElements
                    ),
                titleLabel.leadingAnchor
                    .constraint(
                        equalTo: view.leadingAnchor,
                        constant: LayoutConstants.leadingLayoutConstant),
                titleLabel.trailingAnchor
                    .constraint(
                        equalTo: view.trailingAnchor,
                        constant: LayoutConstants.trailingLayoutConstant),
                // Дополнительное описание Title
                titleDescriptionLabel.topAnchor
                    .constraint(
                        equalTo: titleLabel.bottomAnchor,
                        constant: LayoutConstants.welcomeViewBetweenElements
                    ),
                titleDescriptionLabel.leadingAnchor
                    .constraint(
                        equalTo: view.leadingAnchor,
                        constant: LayoutConstants.leadingLayoutConstant
                    ),
                titleDescriptionLabel.trailingAnchor
                    .constraint(
                        equalTo: view.trailingAnchor,
                        constant: LayoutConstants.trailingLayoutConstant
                    ),
             // Карусель 
                featuresCarousel.topAnchor
                    .constraint(
                        equalTo: titleDescriptionLabel.bottomAnchor,
                        constant: LayoutConstants.welcomeViewBetweenElements
                    ),
                featuresCarousel.leadingAnchor
                    .constraint(
                        equalTo: view.leadingAnchor,
                        constant: LayoutConstants.leadingLayoutConstant
                    ),
                featuresCarousel.trailingAnchor
                    .constraint(
                        equalTo: view.trailingAnchor,
                        constant: LayoutConstants.trailingLayoutConstant
                    ),
                
                // Кнопка "Зарегистрироваться"
                registrationButton.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: -80),
                registrationButton.leadingAnchor
                    .constraint(
                        equalTo: view.leadingAnchor,
                        constant: LayoutConstants.leadingLayoutConstant),
                registrationButton.trailingAnchor
                    .constraint(
                        equalTo: view.trailingAnchor,
                        constant: LayoutConstants.trailingLayoutConstant),
              
                // Кнопка "Входа"
                loginButton.bottomAnchor.constraint(
                    equalTo: registrationButton.topAnchor,
                    constant: -10),
                loginButton.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: LayoutConstants.leadingLayoutConstant),
                loginButton.trailingAnchor
                    .constraint(
                        equalTo: view.trailingAnchor,
                        constant: LayoutConstants.trailingLayoutConstant)
            ]
        )
    }
    
    
    @objc private func registrationButtonTapped() {
        let registrationViewController = RegistrationViewController()
        navigationController?.delegate = self
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    @objc private func logInButtonTapped() {
        let loginViewControler = LoginViewControler()
        navigationController?.delegate = self
        navigationController?.pushViewController(loginViewControler, animated: true)
    }
    
}

//MARK:  Своя анимации перехода ( по вопросом)
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
    

    extension WelcomeViewController: FeaturesCarouselDelegate {
        func featuresCarousel(_ carousel: FeaturesCarousel, didSelectFeatureAt index: Int) {
            print("Feature selected at index: \(index)")
            switch index {
            case 0:
                let productViewController = DemoProductsViewController()
                navigationController?.pushViewController(productViewController, animated: true)
            case 1:
                let fpsViewController = DemoFPSViewController()
                navigationController?.pushViewController(fpsViewController, animated: true)
                print("БЖУ нажаты")
            case 2:
                let progressViewController = DemoProgressViewController()
                navigationController?.pushViewController(progressViewController, animated: true)
            case 3:
                let reportsViewController = DemoReportsViewController()
                navigationController?.pushViewController(reportsViewController, animated: true)
            default:
                break
            }
        }
        
    }


