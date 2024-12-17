//
//  ProfileViewCOntroller.swift
//  Diploma
//
//  Created by Oleg Podrez on 17.12.2024.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    var user: User?
    private var products: [Product] = []
    
    private let tableView = UITableView()
    private let addProductButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        UISetup.setupAnimatedBackground(for: view)
        
        if let user = user {
            print("Имя пользователя: \(user.name ?? "Неизвестно")")
            print("Рост: \(user.height)")
            print("Вес: \(user.weight)")
            print("Дата рождения: \(user.dateOfBirth)")
        }
        setupUI()
    }
    
    private func setupUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        addProductButton.setTitle("Добавить продукт", for: .normal)
        addProductButton.addTarget(self, action: #selector(addProductTapped), for: .touchUpInside)
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        view.addSubview(addProductButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addProductButton.topAnchor, constant: -10),
            
            addProductButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addProductButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addProductButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func addProductTapped() {
        let alert = UIAlertController(title: "Добавить продукт", message: "Введите данные продукта", preferredStyle: .alert)
        
        alert.addTextField { $0.placeholder = "Название продукта" }
        alert.addTextField { $0.placeholder = "Белки"; $0.keyboardType = .decimalPad }
        alert.addTextField { $0.placeholder = "Жиры"; $0.keyboardType = .decimalPad }
        alert.addTextField { $0.placeholder = "Углеводы"; $0.keyboardType = .decimalPad }
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            guard let name = alert.textFields?[0].text,
                  let proteins = Double(alert.textFields?[1].text ?? "0"),
                  let fats = Double(alert.textFields?[2].text ?? "0"),
                  let carbs = Double(alert.textFields?[3].text ?? "0") else { return }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let product = products[indexPath.row] as! ProductCD
        cell.textLabel?.text = "\(product.productName ?? "") - Б: \(product.proteins), Ж: \(product.fats), У: \(product.carbohydrates)"
        cell.backgroundColor = .clear
        return cell
    }
}
