//
//  BookMarkVC.swift
//  PodrezHw23
//
//  Created by Oleg Podrez on 4.09.24.
//
import UIKit

class BookmarksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var bookmarks: [String]
    private let onSelect: (String) -> Void
    private let tableView = UITableView()
    
    init(bookmarks: [String], onSelect: @escaping (String) -> Void) {
        self.bookmarks = bookmarks
        self.onSelect = onSelect
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BookmarksViewController loaded with \(bookmarks.count) bookmarks")
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookmarkCell")
        
        navigationItem.title = "Закладки"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
    }
    
    @objc private func close() {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)
        cell.textLabel?.text = bookmarks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = bookmarks[indexPath.row]
        onSelect(urlString)
        dismiss(animated: true)
    }
}

