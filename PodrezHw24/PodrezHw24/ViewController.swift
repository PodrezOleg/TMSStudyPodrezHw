//
//  ViewController.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 4.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    var city: City?
    var timer: Timer?
    
    let timeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        displayCityTime()
        UISetup.setupAnimatedBackground(for: self.view)
        
    }
    
    func setupUi() {
        
        navigationItem.title = city?.name
        
        timeLabel.font = UIFont.systemFont(ofSize: 40)
        timeLabel.textAlignment = .center
        timeLabel.numberOfLines = 0
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func displayCityTime() {
        if let city = city{
            timeLabel.text = "\(city.name) \n Current time: \n \(city.showCurrentTime())"
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        displayCityTime()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        startTimer()
        timer?.invalidate()
        timer = nil
    }
}


