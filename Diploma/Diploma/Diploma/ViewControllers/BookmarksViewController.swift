//
//  BookmarksViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import WebKit

class BookmarksViewController: UIViewController {
    private let tableView = UITableView()
    private var bookmarks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadBookmarks()
    }

    private func setupUI() {
        title = "Закладки"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookmarkCell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func loadBookmarks() {
        bookmarks = BookmarkManager.shared.loadBookmarks()
        tableView.reloadData()
    }
    
    
}

extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)
        cell.textLabel?.text = bookmarks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
    }
}
