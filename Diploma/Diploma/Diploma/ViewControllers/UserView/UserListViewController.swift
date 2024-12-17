//
//  UserListViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import CoreData

class UserListViewController: UIViewController {
    
    private var users: [User] = [] // Хранение списка пользователей из Core Data
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 80)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Пользователи"
        UISetup.setupAnimatedBackground(for: view)
        
        setupCollectionView()
        fetchUsers()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchUsers() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            users = try CoreDataManager.shared.context.fetch(fetchRequest)
            collectionView.reloadData()
        } catch {
            print("Ошибка при получении пользователей: \(error.localizedDescription)")
        }
    }
    
    private func deleteUser(at indexPath: IndexPath) {
        let userToDelete = users[indexPath.row]
        CoreDataManager.shared.deleteUser(userToDelete)
        users.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
    }
}

extension UserListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let user = users[indexPath.row]
        cell.configure(with: user.name ?? "Неизвестно")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        promptForPassword(for: selectedUser)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        trailingSwipeActionsConfigurationForItemAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            self.deleteUser(at: indexPath)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}

extension UserListViewController {
    private func promptForPassword(for user: User) {
        let alert = UIAlertController(title: "Введите пароль", message: "Введите пароль для пользователя \(user.name ?? "Неизвестно")", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Пароль"
            textField.isSecureTextEntry = true
        }
        
        let loginAction = UIAlertAction(title: "Войти", style: .default) { _ in
            guard let enteredPassword = alert.textFields?.first?.text else { return }
            
            if enteredPassword == user.password {
                self.goToProfile(for: user)
            } else {
                self.showAlert(message: "Неверный пароль!")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(loginAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func goToProfile(for user: User) {
        let profileVC = ProfileViewController()
        profileVC.user = user
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
