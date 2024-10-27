//
//  TranslatorTableVC.swift
//  PodrezHW31
//
//  Created by Oleg Podrez on 27.10.24.
//

import UIKit
import CoreData

class TranslatorTableVC: UITableViewController {

    var translators = [TranslatorData]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchTranslators()
        
    }
    private func setupUI() {
        title = "Переводчики"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTranslatorTapped))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TranslatorCell")
        tableView.backgroundColor = .clear
    }

    func fetchTranslators() {
        let fetchRequest = TranslatorData.fetchRequest()
        do {
            translators = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translators.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TranslatorCell")
           let translator = translators[indexPath.row]
           
           cell.textLabel?.numberOfLines = 0
           cell.textLabel?.text = """
           Имя: \(translator.name ?? "Unknown")
           Язык: \(translator.language ?? "Unknown Language")
           Ставка: \(translator.rate) за страницу
           Статус: \(translator.status ? "Свободен" : "Занят")
           """
           cell.textLabel?.textColor = .systemOrange
           cell.backgroundColor = .clear
           return cell
       }
    
       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let translatorToRemove = translators[indexPath.row]
            context.delete(translatorToRemove)
            do {
                try context.save()
                translators.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } catch let error as NSError {
                print("Failed to delete translator: \(error), \(error.userInfo)")
            }
        }
    }

    @objc func addTranslatorTapped() {
        let addTranslatorVC = AddTranslatorVC()
        addTranslatorVC.delegate = self
        let navController = UINavigationController(rootViewController: addTranslatorVC)
        present(navController, animated: true, completion: nil)
    }
}

extension TranslatorTableVC: AddTranslatorDelegate {
    func didAddTranslator() {
        fetchTranslators()
    }
}
