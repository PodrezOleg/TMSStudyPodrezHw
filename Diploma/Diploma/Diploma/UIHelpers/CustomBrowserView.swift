//
//  CustomBrowserView.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import WebKit

class CustomBrowserView: UIView {

    let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let urlTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .URL
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let backButton = UIButton(type: .system)
    let forwardButton = UIButton(type: .system)
    let refreshButton = UIButton(type: .system)
    let loadButton = UIButton(type: .system)
    let bookmarkButton = UIButton(type: .system)
    let showBookmarksButton = UIButton(type: .system)
    
    private let topButtonsStackView = UIStackView()
    private let bottomButtonsStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        backgroundColor = .systemBackground
        
        backButton.setTitle("← Назад", for: .normal)
        forwardButton.setTitle("Вперед →", for: .normal)
        refreshButton.setTitle("Обновить", for: .normal)
        loadButton.setTitle("Загрузить", for: .normal)
        bookmarkButton.setTitle("Закладка", for: .normal)
        showBookmarksButton.setTitle("Закладки", for: .normal)
        
        topButtonsStackView.axis = .horizontal
        topButtonsStackView.distribution = .fillEqually
        topButtonsStackView.spacing = 8
        topButtonsStackView.addArrangedSubview(backButton)
        topButtonsStackView.addArrangedSubview(forwardButton)
        topButtonsStackView.addArrangedSubview(refreshButton)
        topButtonsStackView.addArrangedSubview(loadButton)
        topButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomButtonsStackView.axis = .horizontal
        bottomButtonsStackView.distribution = .fillEqually
        bottomButtonsStackView.spacing = 8
        bottomButtonsStackView.addArrangedSubview(bookmarkButton)
        bottomButtonsStackView.addArrangedSubview(showBookmarksButton)
        bottomButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(urlTextField)
        addSubview(topButtonsStackView)
        addSubview(webView)
        addSubview(bottomButtonsStackView)
        
        NSLayoutConstraint.activate([
            urlTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.browserConstraint),
            urlTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.browserConstraint),
            urlTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutConstants.minusBrowserConstraint),
            urlTextField.heightAnchor.constraint(equalToConstant: 36),
            topButtonsStackView.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: LayoutConstants.browserConstraint),
            topButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.browserConstraint),
            topButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutConstants.minusBrowserConstraint),
            topButtonsStackView.heightAnchor.constraint(equalToConstant: 40),
            webView.topAnchor.constraint(equalTo: topButtonsStackView.bottomAnchor, constant: LayoutConstants.browserConstraint),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomButtonsStackView.topAnchor, constant: LayoutConstants.minusBrowserConstraint),
            bottomButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.browserConstraint),
            bottomButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutConstants.minusBrowserConstraint),
            bottomButtonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:LayoutConstants.minusBrowserConstraint),
            bottomButtonsStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        if let url = URL(string: "https://world.openfoodfacts.org") {
            let request = URLRequest(url: url)
            webView.load(request)
            urlTextField.text = url.absoluteString
        }
    }
}
