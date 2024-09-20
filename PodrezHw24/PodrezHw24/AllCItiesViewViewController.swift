//
//  AllCItiesViewViewController.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import UIKit

class AllCitiesViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        setupUI()
        UISetup.setupAnimatedBackground(for: self.view)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
    }
    
    func setupUI() {
        navigationItem.title = "All Cities"
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
    
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }

    @objc func updateTable() {
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        let city = cities[indexPath.row]
        
        if city.isDaytime() {
            cell.contentView.backgroundColor = UIColor.systemBlue
        } else {
            cell.contentView.backgroundColor = UIColor.gray
            }
    
        cell.backgroundColor = .clear
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.masksToBounds = true
        cell.detailTextLabel?.text = "Current Time: \(city.showCurrentTime())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        let cityDetailVC = CityDetailView()
        cityDetailVC.cities = selectedCity
        navigationController?.pushViewController(cityDetailVC, animated: true)
    }
}
