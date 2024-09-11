//
//  AllCItiesViewViewController.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import UIKit

class AllCitiesViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var timer: Timer?
    
    var city: City?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        UISetup.setupAnimatedBackground(for: self.view)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
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
    
//    func isDaytime() -> Bool {
//        let hour = Calendar.current.component(.hour, from: Date())
//        print("Текущее время: \(hour)")
//        return hour >= 6 && hour < 18
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        let isDay = isDaytime()
//              
//              if isDay {
//                  cell.contentView.backgroundColor = UIColor.systemBlue
//              } else {
//                  cell.contentView.backgroundColor = UIColor.gray
//              }
        
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.layer.masksToBounds = true
        
        let city = cities[indexPath.row]
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "Current Time: \(city.showCurrentTime())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let spacing = CGFloat(10)
        
        let insetView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: spacing))
        insetView.backgroundColor = .clear
        
        cell.contentView.insertSubview(insetView, at: 0)
        
        cell.contentView.frame = cell.contentView.frame.insetBy(dx: 20, dy: spacing / 1.25)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < cities.count - 1 {
            let selectedCity = cities[indexPath.row]
            
            let cityDetailVC = CityDetailView()
            cityDetailVC.cities = selectedCity
            navigationController?.pushViewController(cityDetailVC, animated: true)
        }
    }
}
