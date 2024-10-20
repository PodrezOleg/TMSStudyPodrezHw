//
//  MainGameController.swift
//  HW30
//
//  Created by Oleg Podrez on 13.10.24.
//



import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var leaderboardEntries: [(name: String, time: TimeInterval)] = []
    let tableView = UITableView()
    let clearButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupUI()
        backButtonMenu()
        leaderboardEntries = GameStateManager.shared.loadLeaderboard().map { ($0.playerName, $0.time) }
        
    }
    
    func setupBackground() {
        backgroundController.setupBlurBackground(for: view, style: .extraLight, alpha: LayoutConstants.blurAlpha)
        backgroundController.setupBackground(for: view, imageName: "MainBackgroundView")
    }
    
    func setupUI() {
        let leaderboardLabel = UILabel()
        leaderboardLabel.text = "Таблица лидеров"
        leaderboardLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        leaderboardLabel.textAlignment = .center
        leaderboardLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leaderboardLabel)
        
        view.addSubview(tableView)
        view.addSubview(clearButton)
        
        setupTableView()
        
        //MARK: Не забыть удалит!! - Добавляем кнопку очистки таблицы лидеров
        setupClearButton()
        
        NSLayoutConstraint.activate([
            leaderboardLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            leaderboardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LeaderboardCell")
        
        NSLayoutConstraint.activate(
[
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor
                .constraint(
                    equalTo: clearButton.topAnchor,
                    constant: LayoutConstants.bottomAnchorStack
                )
        ]
)
        tableView.backgroundColor = .clear
    }
    func backButtonMenu() {
        let backButton = CustomMenuButton()
        backButton.setTitle("Главная", for: .normal)
        backButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
      
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    func setupClearButton() {
        clearButton.setTitle("Очистить таблицу лидеров", for: .normal)
        clearButton.backgroundColor = .systemRed
        clearButton.layer.cornerRadius = LayoutConstants.cornerRadiusButton
        clearButton.addTarget(self, action: #selector(clearLeaderboard), for: .touchUpInside)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(clearButton)
        
        NSLayoutConstraint.activate(
            [
                clearButton.heightAnchor.constraint(equalToConstant: 50),
                clearButton.leadingAnchor
                    .constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leadingStack),
                clearButton.trailingAnchor
                    .constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailingStack),
                clearButton.bottomAnchor
                    .constraint(
                        equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                        constant: LayoutConstants
                            .bottomAnchorStack)
            ]
        )
    }
    
    @objc func clearLeaderboard() {
        GameStateManager.shared.clearLeaderboard()
        leaderboardEntries = []
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardCell", for: indexPath)
        
        let entry = leaderboardEntries[indexPath.row]
        let formattedTime = String(format: "%.2f", entry.time)
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let label = UILabel()
        label.text = "\(indexPath.row + 1). \(entry.name) - \(formattedTime) сек"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tag = 100
        
        cell.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10)
        ])
        
        
        cell.backgroundColor = .clear
        return cell
    }
    
   @objc func backToMainMenu() {
        let mainViewController = MainMenuViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        mainViewController.modalTransitionStyle = .crossDissolve
        present(mainViewController, animated: true, completion: nil)
    }
}
