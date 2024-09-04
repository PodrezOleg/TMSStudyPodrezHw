//
//  ViewController.swift
//  PodrezHw23
//
//  Created by Oleg Podrez on 4.09.24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    let webView: WKWebView = .init()
    private var bookmarks: [String] = []
    lazy var urlField: UITextField = {
        let urlField = UITextField()
        urlField.borderStyle = .roundedRect
        urlField.placeholder = "Введите сайт"
        urlField.autocapitalizationType = .none
        urlField.layer.cornerRadius = 10
        urlField.layer.borderWidth = 1
        urlField.keyboardType = .URL
        urlField.returnKeyType = .go
        urlField.delegate = self
        return urlField
    }()
    lazy var bookmarkButton: UIButton = {
        let bookmarkButton = UIButton(type: .system)
        bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        bookmarkButton.addTarget(self, action: #selector(showBookmarks), for: .touchUpInside)
        return bookmarkButton
    }()
    
    lazy var goButton: UIButton = {
        let goButton = UIButton(type: .system)
        goButton.setTitle("GO", for: .normal)
        goButton.addTarget(self, action: #selector(goButtonTap), for: .touchUpInside)
        return goButton
    }()
    
    lazy var backButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setTitle("←", for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.isEnabled = false
        return backButton
    }()
    
    lazy var bookMarkButtonOpen: UIButton = {
        let bookMarkButtonOpen = UIButton(type: .system)
        bookMarkButtonOpen.setTitle("☆", for: .normal)
        bookMarkButtonOpen.addTarget(self, action: #selector(addBookmark), for: .touchUpInside)
        return bookMarkButtonOpen
    }()
    
    lazy var urlFieldStack: UIStackView = {
        let urlStack = UIStackView(arrangedSubviews: [backButton, bookMarkButtonOpen, urlField, goButton, bookmarkButton])
        urlStack.axis = .horizontal
        urlStack.spacing = 5
        urlStack.distribution = .fillProportionally
        return urlStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        view.addSubview(urlFieldStack)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        urlFieldStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            urlFieldStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            urlFieldStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            urlFieldStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            webView.topAnchor.constraint(equalTo: urlFieldStack.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        webView.scrollView.delegate = self
        
     
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleWebViewTap))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        webView.scrollView.addGestureRecognizer(tapGesture)
    
        if let url = URL(string: "https://translateme.by") {
            webView.load(URLRequest(url: url))
        }
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
    }
    
    @objc func goButtonTap() {
        guard let urlString = urlField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !urlString.isEmpty,
              var urlComponents = URLComponents(string: urlString) else { return }
        
        if urlComponents.scheme == nil {
            urlComponents.scheme = "https"
        }
        
        guard let url = urlComponents.url else { return }
        webView.load(URLRequest(url: url))
    }

    @objc func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func addBookmark() {
        guard let url = webView.url else { return }
        var bookmarks = UserDefaults.standard.array(forKey: "Bookmarks") as? [String] ?? []
        if !bookmarks.contains(url.absoluteString) {
            bookmarks.append(url.absoluteString)
            UserDefaults.standard.set(bookmarks, forKey: "Bookmarks")
            showAlert("Закладка добавлена", message: "\(url.absoluteString) добавлена в закладки.")
        }
    }
    
   
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc func handleWebViewTap() {
        if self.urlFieldStack.alpha == 0 {
            UIView.animate(withDuration: 0.3) {
                self.urlFieldStack.alpha = 1
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        UIView.animate(withDuration: 0.3) {
            if yOffset > 0 {
                self.urlFieldStack.alpha = 0
            } else {
                self.urlFieldStack.alpha = 1
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        goButtonTap()
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func showBookmarks() {
        print("Show bookmarks button tapped") // Debug output
        let bookmarks = UserDefaults.standard.array(forKey: "Bookmarks") as? [String] ?? []
        let bookmarksVC = BookmarksViewController(bookmarks: bookmarks) { [weak self] selectedUrl in
            if let url = URL(string: selectedUrl) {
                self?.webView.load(URLRequest(url: url))
            }
        }
        let navigationController = UINavigationController(rootViewController: bookmarksVC)
        present(navigationController, animated: true)
    }
}

