//
//  CityDetailView.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import UIKit

class CityDetailView: UIViewController {
 
        var cities: City?
        let timeLabel = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            UISetup.setupAnimatedBackground(for: self.view)
            updateCityTime()
            timerRefresh()
          
        }
        
        func setupUI() {
            navigationItem.title = cities?.name
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
        func timerRefresh() {
        Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(updateCityTime),
                             userInfo: nil,
                             repeats: true)
    }
        @objc func updateCityTime() {
            if let city = cities {
                timeLabel.text =  "\(city.name) \n Current Time: \n \(city.showCurrentTime())"
            }
        }
    }
