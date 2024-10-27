//
//  TranslatorVCRealm.swift
//  PodrezHW32
//
//  Created by Oleg Podrez on 27.10.24.
//

import UIKit
import RealmSwift

class TranslatorVCRealm: UITableViewController {

    private let realm = try! Realm()
    private var translators: Results<TranslatorDataRealm>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named: "backGroundHalloween"))
        backgroundImageView.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImageView
        
        title = "Переводчики"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.systemOrange
        ]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TranslatorCell")
        loadData()
        
        let customButton = UIButton(type: .system)
        customButton.setTitle("Добавить", for: .normal)
        customButton.setTitleColor(.white, for: .normal)
        customButton.backgroundColor = .systemOrange
        customButton.layer.cornerRadius = 10
        customButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        customButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customButton.widthAnchor.constraint(equalToConstant: 100),
            customButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        customButton.addTarget(self, action: #selector(addTranslatorTapped), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
        tableView.backgroundColor = .clear
    }

    private func loadData() {
        translators = realm.objects(TranslatorDataRealm.self)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translators?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TranslatorCell", for: indexPath)
        
        if let translator = translators?[indexPath.row] {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = """
            Имя: \(translator.name)
            Язык: \(translator.language)
            Ставка: \(translator.rate) за страницу
            Статус: \(translator.status ? "Свободен" : "Занят")
            """
            cell.textLabel?.textColor = .systemOrange
            cell.backgroundColor = .clear
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, let translatorToDelete = translators?[indexPath.row] {
            try! realm.write {
                realm.delete(translatorToDelete)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    @objc private func addTranslatorTapped() {
        let addTranslatorVC = AddTranslatorRealm()
        addTranslatorVC.delegate = self
        let navController = UINavigationController(rootViewController: addTranslatorVC)
        present(navController, animated: true, completion: nil)
    }
}

extension TranslatorVCRealm: AddTranslatorDelegate {
    func didAddTranslator() {
        loadData()
    }
}
