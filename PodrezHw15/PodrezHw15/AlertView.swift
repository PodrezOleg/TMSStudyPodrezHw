//
//  AlertView.swift
//  PodrezHw15
//
//  Created by Oleg Podrez on 23.08.24.
//

import UIKit

class AlertView: UIView {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let openLinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("Слушать", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let youtubeURL: URL
    
    init(message: String, youtubeURL: URL, backgroundColor: UIColor) {
        self.youtubeURL = youtubeURL
        super.init(frame: .zero)
        
        self.layer.cornerRadius = 10
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        
        configureColors(for: backgroundColor)
        
        messageLabel.text = message
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureColors(for backgroundColor: UIColor) {
        if backgroundColor == .black {
            messageLabel.textColor = .white
            dismissButton.setTitleColor(.white, for: .normal)
            dismissButton.backgroundColor = .systemRed
            openLinkButton.setTitleColor(.white, for: .normal)
            openLinkButton.backgroundColor = .systemOrange
        } else {
            messageLabel.textColor = .black
            dismissButton.setTitleColor(.black, for: .normal)
            dismissButton.backgroundColor = .systemBlue
            openLinkButton.setTitleColor(.black, for: .normal)
            openLinkButton.backgroundColor = .systemMint
        }
    }
    
    private func setupView() {
        addSubview(messageLabel)
        addSubview(dismissButton)
        addSubview(openLinkButton)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        openLinkButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            dismissButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            dismissButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dismissButton.widthAnchor.constraint(equalToConstant: 90),
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            dismissButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            openLinkButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            openLinkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            openLinkButton.widthAnchor.constraint(equalToConstant: 90),
            openLinkButton.heightAnchor.constraint(equalToConstant: 40),
            openLinkButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
        dismissButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        openLinkButton.addTarget(self, action: #selector(openYouTube), for: .touchUpInside)
    }
    
    @objc private func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.alpha = 0
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
    
    @objc private func openYouTube() {
        UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
    }
}
