//
//  CustomBrowserViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import WebKit

class CustomBrowserViewController: UIViewController, UITextFieldDelegate {
    private let browserView = CustomBrowserView()
    
    override func loadView() {
        view = browserView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardHandling()
        setupActions()
    }

    private func setupActions() {
        browserView.urlTextField.delegate = self
        browserView.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        browserView.forwardButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        browserView.refreshButton.addTarget(self, action: #selector(reloadPage), for: .touchUpInside)
        browserView.bookmarkButton.addTarget(self, action: #selector(addToBookmarks), for: .touchUpInside)
        browserView.showBookmarksButton.addTarget(self, action: #selector(showBookmarks), for: .touchUpInside)
        browserView.loadButton.addTarget(self, action: #selector(loadPage), for: .touchUpInside)
    }
    
    @objc private func goBack() {
        if browserView.webView.canGoBack {
            browserView.webView.goBack()
        }
    }

    @objc private func goForward() {
        if browserView.webView.canGoForward {
            browserView.webView.goForward()
        }
    }

    @objc private func reloadPage() {
        browserView.webView.reload()
    }

    @objc private func addToBookmarks() {
        guard let url = browserView.webView.url?.absoluteString else { return }
        BookmarkManager.shared.saveBookmark(url: url)
    }

    @objc private func showBookmarks() {
        let bookmarksVC = BookmarksViewController()
        bookmarksVC.modalPresentationStyle = .pageSheet
        present(bookmarksVC, animated: true)
    }
    
    @objc private func loadPage() {
        if let urlString = browserView.urlTextField.text, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            browserView.webView.load(request)
        }
    }
}
