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
        print("TranslatorTableVC loaded")
        
        setupUI()
        fetchTranslators()
        uISetupBackground.setupAnimatedBackground(for: self.view)
        
        if translators.isEmpty {
                 let newTranslator = TranslatorData(context: context)
                 newTranslator.name = "Test Translator"
                 newTranslator.language = "English"
                 newTranslator.rate = 10
                 newTranslator.status = true
                 
                 do {
                     try context.save()
                     fetchTranslators()
                 } catch {
                     print("Failed to save initial data: \(error)")
                 }
             }
         }
        


    private func setupUI() {
        title = "Translators"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTranslatorTapped))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TranslatorCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TranslatorCell", for: indexPath)
        let translator = translators[indexPath.row]
        cell.textLabel?.text = "\(translator.name ?? "") - \(translator.language ?? "")"
        cell.detailTextLabel?.text = "Rate: \(translator.rate) per page, Status: \(translator.statusDescription)"
        print("Displaying cell for \(translator.name ?? "Unknown")")  // Отладочная информация
        return cell
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
