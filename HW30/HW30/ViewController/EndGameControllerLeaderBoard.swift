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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupUI()
        
        let loadedEntries = GameStateManager.shared.loadLeaderboard()
        leaderboardEntries = loadedEntries.map { ($0.playerName, $0.time) }
        
        print("Загруженные данные таблицы лидеров: \(leaderboardEntries)")
        
        tableView.reloadData()
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
        
        NSLayoutConstraint.activate([
            leaderboardLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            leaderboardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        setupTableView()
    }
    
    func setupTableView() {
     
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LeaderboardCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.backgroundColor = .clear
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardCell", for: indexPath)
        
        let entry = leaderboardEntries[indexPath.row]
        let formattedTime = String(format: "%.2f", entry.time)
        
        let label = UILabel()
        label.text = "\(indexPath.row + 1). \(entry.name) - \(formattedTime) сек"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center  
        label.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Вы выбрали: \(leaderboardEntries[indexPath.row].name)")
    }
    
    func displayLeaderboard() {
        tableView.reloadData()
    }
}
