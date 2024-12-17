//
//  CustomBrowserView.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import WebKit

class CustomBrowserView: UIView {
    
    // MARK: - UI Components
    
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
    
    // Верхние кнопки
    let backButton = UIButton(type: .system)
    let forwardButton = UIButton(type: .system)
    let refreshButton = UIButton(type: .system)
    let loadButton = UIButton(type: .system)
    
    // Нижние кнопки
    let bookmarkButton = UIButton(type: .system)
    let showBookmarksButton = UIButton(type: .system)
    
    // Stack Views
    private let topButtonsStackView = UIStackView()
    private let bottomButtonsStackView = UIStackView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        // Настройка кнопок
        backButton.setTitle("← Назад", for: .normal)
        forwardButton.setTitle("Вперед →", for: .normal)
        refreshButton.setTitle("Обновить", for: .normal)
        loadButton.setTitle("Загрузить", for: .normal)
        bookmarkButton.setTitle("Закладка", for: .normal)
        showBookmarksButton.setTitle("Закладки", for: .normal)
        
        // Верхний StackView (под строкой ввода)
        topButtonsStackView.axis = .horizontal
        topButtonsStackView.distribution = .fillEqually
        topButtonsStackView.spacing = 8
        topButtonsStackView.addArrangedSubview(backButton)
        topButtonsStackView.addArrangedSubview(forwardButton)
        topButtonsStackView.addArrangedSubview(refreshButton)
        topButtonsStackView.addArrangedSubview(loadButton)
        topButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Нижний StackView (внизу экрана)
        bottomButtonsStackView.axis = .horizontal
        bottomButtonsStackView.distribution = .fillEqually
        bottomButtonsStackView.spacing = 8
        bottomButtonsStackView.addArrangedSubview(bookmarkButton)
        bottomButtonsStackView.addArrangedSubview(showBookmarksButton)
        bottomButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем компоненты на экран
        addSubview(urlTextField)
        addSubview(topButtonsStackView)
        addSubview(webView)
        addSubview(bottomButtonsStackView)
        
        // MARK: - Constraints
        
        NSLayoutConstraint.activate([
            // Строка ввода URL
            urlTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            urlTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            urlTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            urlTextField.heightAnchor.constraint(equalToConstant: 36),
            
            // Верхний StackView (кнопки навигации и обновления)
            topButtonsStackView.topAnchor.constraint(equalTo: urlTextField.bottomAnchor, constant: 8),
            topButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            topButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            topButtonsStackView.heightAnchor.constraint(equalToConstant: 40),
            
            // WebView (основной просмотр)
            webView.topAnchor.constraint(equalTo: topButtonsStackView.bottomAnchor, constant: 8),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomButtonsStackView.topAnchor, constant: -8),
            
            // Нижний StackView (кнопки закладок)
            bottomButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bottomButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            bottomButtonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            bottomButtonsStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        if let url = URL(string: "https://world.openfoodfacts.org") { // Замените на нужный URL
            let request = URLRequest(url: url)
            webView.load(request)
            urlTextField.text = url.absoluteString // Отображаем URL в текстовом поле
        }
    }
}
