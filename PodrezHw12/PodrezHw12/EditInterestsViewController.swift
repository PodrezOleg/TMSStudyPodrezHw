//
//  EditInterestsViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 11.08.24.
//
import UIKit

protocol EditFieldViewControllerDelegate: AnyObject {
    func didUpdateField(fieldName: String, withValue value: String)
}
class EditInterestsViewController: UIViewController {

    weak var delegate: EditInterestsViewControllerDelegate?
    var interests: [String]

    init(interests: [String]) {
        self.interests = interests
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    @objc func saveTapped() {
        delegate?.didUpdateInterests(interests)
        dismiss(animated: true, completion: nil)
    }
}

extension EditInterestsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = interests[indexPath.row]
        
        let editButton = UIButton(type: .system)
        editButton.setTitle("Редактировать", for: .normal)
        editButton.addTarget(self, action: #selector(editInterestTapped(_:)), for: .touchUpInside)
        editButton.tag = indexPath.row
        editButton.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(editButton)
        
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteInterestTapped(_:)), for: .touchUpInside)
        deleteButton.tag = indexPath.row
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
            deleteButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            editButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
        ])

        return cell
    }

    @objc func editInterestTapped(_ sender: UIButton) {
        let index = sender.tag
        let editSingleInterestVC = EditSingleInterestViewController(interest: interests[index])
        editSingleInterestVC.delegate = self
        editSingleInterestVC.interestIndex = index
        present(editSingleInterestVC, animated: true, completion: nil)
    }

    @objc func deleteInterestTapped(_ sender: UIButton) {
        let index = sender.tag
        interests.remove(at: index)
        dismiss(animated: true, completion: nil)
    }
}

extension EditInterestsViewController: EditSingleInterestViewControllerDelegate {
    func didUpdateInterest(at index: Int, with newValue: String) {
        interests[index] = newValue
    }
}
