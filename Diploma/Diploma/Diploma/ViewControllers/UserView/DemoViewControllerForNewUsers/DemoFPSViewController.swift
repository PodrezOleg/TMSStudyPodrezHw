//
//  DemoFPSViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit

class DemoFPSViewController: UIViewController {
    private let logoImageView = UIImageView()
    private let countdownLabel = UILabel()
    private var timer: Timer?
    private let registrationButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWelcomeController()
        setupCountdownTimer()
    }
    
    private func setupUIWelcomeController() {
        title = "Подсчет ЖБУ ДЕМО РЕЖИМ"
        UISetup.setupAnimatedBackground(for: view)
        
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        
        countdownLabel.textAlignment = .center
        countdownLabel.font = LayoutConstants.labelCountDownFont
        countdownLabel.textColor = .white
        countdownLabel.numberOfLines = 0
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        countdownLabel.text = "Обновление будет доступно..."
        
        registrationButton.setTitle("Sign Up Now", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        view.addSubview(countdownLabel)
        view.addSubview(registrationButton)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.logoTopAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.logoSizeWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.logoSizeHeight),
            countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countdownLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registrationButton.topAnchor.constraint(equalTo: countdownLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func registrationButtonTapped() {
        let registrationViewController = RegistrationViewController()
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    private func setupCountdownTimer() {
     
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    @objc private func updateCountdown() {
        let calendar = Calendar.current
        let now = Date()
        
        let nextYear = calendar.date(from: DateComponents(year: calendar.component(.year, from: now) + 1)) ?? Date()
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: nextYear)
        
        if let days = components.day,
           let hours = components.hour,
           let minutes = components.minute,
           let seconds = components.second {
            countdownLabel.text = """
            Обновление доступно через:
            \(days) д \(hours) ч \(minutes) м \(seconds) с
            """
        }
    }
    deinit {
        timer?.invalidate()
    }
}
