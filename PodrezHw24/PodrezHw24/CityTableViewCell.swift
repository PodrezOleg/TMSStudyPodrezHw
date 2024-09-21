//
//  CityTableViewCell.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    let cityImageView = UIImageView()
    let cityLabel = UILabel()
    var timer: Timer?
    var city: City?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 15
        cityImageView.clipsToBounds = true
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 18)
        cityLabel.numberOfLines = 0
        cityLabel.textAlignment = .left
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cityImageView)
        contentView.addSubview(cityLabel)
       
        
        NSLayoutConstraint.activate([
            cityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cityImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cityImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cityImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    func configure(with city: City) {
        self.city = city
        cityImageView.image = UIImage(named: city.isDaytime() ? "daySky2" : "nightSky")
        updateCityTime()
        startTimer()
    }
    
    @objc func updateCityTime() {
        if let city = city {
            cityLabel.text = "\(city.name)\nCurrent Time: \(city.showCurrentTime())"
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateCityTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
    }
}
