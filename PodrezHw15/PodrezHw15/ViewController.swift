//
//  ViewController.swift
//  PodrezHw15
//
//  Created by Oleg Podrez on 21.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    let whiteNotes = ["До", "Ре", "Ми", "Фа", "Соль", "Ля", "Си", "До"]
    let blackNotes = ["До#", "Ре#", "", "Фа#", "Соль#", "Ля#", ""]
    
    let youtubeLink = URL(string: "https://www.youtube.com/watch?v=xLAPstwuvG0")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimatedBackground()
        setupPianoKeys()
    }

    func setupAnimatedBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradientLayer.locations = [0.0, 1.0] // Корректировка для плавного перехода
        view.layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        animation.toValue = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        animation.duration = 5.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "animateColors")
    }


    func setupPianoKeys() {
        let whiteStackView = createStackView(axis: .horizontal)
        let blackStackView = createStackView(axis: .horizontal)
        
        view.addSubview(whiteStackView)
        view.addSubview(blackStackView)

        
        NSLayoutConstraint.activate([
            whiteStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whiteStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            whiteStackView.heightAnchor.constraint(equalToConstant: 200),
            whiteStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97),
            
            blackStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blackStackView.bottomAnchor.constraint(equalTo: whiteStackView.topAnchor, constant: 5),
            blackStackView.widthAnchor.constraint(equalTo: whiteStackView.widthAnchor, multiplier: 0.97),
            blackStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        for note in whiteNotes {
            let button = createWhiteButton(note: note)
            whiteStackView.addArrangedSubview(button)
        }

        for (index, note) in blackNotes.enumerated() {
            if !note.isEmpty {
                let button = createBlackButton(note: note)
                blackStackView.addArrangedSubview(button)
            } else {
                let spacer = UIView()
                spacer.widthAnchor.constraint(equalToConstant: 10).isActive = true
                blackStackView.addArrangedSubview(spacer)
            }
        }
    }
    
    func createStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func createWhiteButton(note: String) -> UIButton {
        let button = UIButton()
        button.setTitle(note, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(noteTapped), for: .touchUpInside)
        return button
    }
    
    func createBlackButton(note: String) -> UIButton {
        let button = UIButton()
        button.setTitle(note, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.isHidden = note.isEmpty
        button.addTarget(self, action: #selector(noteTapped), for: .touchUpInside)
        return button
    }
    
    @objc func noteTapped(_ sender: UIButton) {
        guard let note = sender.titleLabel?.text else { return }
        
        let backgroundColor: UIColor
        let message: String
        
        if sender.backgroundColor == .black {
            backgroundColor = .black
            message = "Вы нажали на черную клавишу \(note)"
        } else {
            backgroundColor = .white
            message = "Вы нажали на белую клавишу \(note)"
        }
        
        showCustomAlert(message: message, backgroundColor: backgroundColor)
    }
    
    func showCustomAlert(message: String, backgroundColor: UIColor) {
        let alertView = AlertView(message: message, youtubeURL: youtubeLink, backgroundColor: backgroundColor)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView)
        
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            alertView.widthAnchor.constraint(equalToConstant: 250),
            alertView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        alertView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            alertView.transform = CGAffineTransform.identity
            alertView.alpha = 1
        })
    }
}
