//
//  EditInterestsViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 11.08.24.
//
import UIKit



class EditInterestsViewController: UIViewController {
    
    weak var delegate: EditInterestsViewControllerDelegate?
    
    private var interests: [String]
    
    private let tableView = UITableView()
    private let saveButton = UIButton(type: .system)
    
    init(interests: [String]) {
        self.interests = interests
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func saveButtonTapped() {
        delegate?.didUpdateInterests(interests)
        dismiss(animated: true, completion: nil)
    }
    
    func updateInterests(newInterests: [String]) {
        interests = newInterests
        tableView.reloadData()
    }
}

extension EditInterestsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let interest = interests[indexPath.row]
        cell.textLabel?.text = interest
        
        let editButton = UIButton(type: .system)
        editButton.setTitle("Edit", for: .normal)
        editButton.tag = indexPath.row
        editButton.addTarget(self, action: #selector(editInterest(_:)), for: .touchUpInside)
        cell.accessoryView = editButton
        
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.tag = indexPath.row
        deleteButton.addTarget(self, action: #selector(deleteInterest(_:)), for: .touchUpInside)
        cell.accessoryView = deleteButton
        
        let stackView = UIStackView(arrangedSubviews: [editButton, deleteButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        cell.accessoryView = stackView
        
        return cell
    }
    
    @objc private func editInterest(_ sender: UIButton) {
        let index = sender.tag
        let interestToEdit = interests[index]
        
        let editVC = EditFieldViewController(fieldName: "Interest", initialValue: interestToEdit) { [weak self] updatedValue in
            self?.interests[index] = updatedValue
            self?.tableView.reloadData()
        }
        
        present(editVC, animated: true, completion: nil)
    }
    
    @objc private func deleteInterest(_ sender: UIButton) {
        let index = sender.tag
        interests.remove(at: index)
        tableView.reloadData()
    }
}
