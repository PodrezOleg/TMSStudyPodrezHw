//
//  EventListController.swift
//  PodrezHW33
//
//  Created by Oleg Podrez on 30.10.24.
//

import UIKit

class EventListController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    var events: [Event] = StorageManager.shared.loadEvents().sorted { $0.date < $1.date}
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetup.setupAnimatedBackground(for: view)
        title = "Напомниналка"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
        navigationController?.navigationBar.tintColor = .white
        
        tableView.backgroundColor = .clear 
       
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        Notifications.shared.requestAuthorization()
    }
    
    @objc private func addEvent() {
        let vc = EventFormController()
        vc.onAdd = { [weak self] newEvent in
            guard let self = self else { return }
            self.events.append(newEvent)
            self.events.sort { $0.date < $1.date }
            StorageManager.shared.saveEvents(self.events)
            Notifications.shared.scheduleNotification(for: newEvent)
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = "\(event.title) - \(formattedDate(event.date))"
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let event = events[indexPath.row]
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [event.title])
            events.remove(at: indexPath.row)
            StorageManager.shared.saveEvents(events)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    
}
