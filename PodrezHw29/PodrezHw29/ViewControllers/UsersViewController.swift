//
//  UsersViewController.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 29.09.24.
//
import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var users: [Users] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: self.view)
        title = "Users"
        view.addSubview(tableView)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.isTranslucent = true

        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        loadUsers()
    }

    private func loadUsers() {
        let dataDownloader = DataToDownload()
        dataDownloader.loadUsers { [weak self] users in
            DispatchQueue.main.async {
                self?.users = users
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.text = user.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        let detailVC = UserDetailViewController()
        
        detailVC.user = selectedUser
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
