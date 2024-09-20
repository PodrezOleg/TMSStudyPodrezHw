//
//  CityPickerView.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import UIKit

class CityPickerView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    let pickerView = UIPickerView()
    var selectedCity: City = cities[0]
    let currentTime = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UISetup.setupAnimatedBackground(for: self.view)
        setupPicker()
        setupUi()
        updateCurrentTime()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
    }

    func setupPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerView)
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func setupUi() {
        navigationItem.title = "Current time"
        currentTime.font = UIFont.systemFont(ofSize: 30)
        currentTime.numberOfLines = 0
        currentTime.textAlignment = .center
       
        currentTime.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentTime)
        
        let button = UIButton(type: .system)
        button.setTitle("Show Time", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemOrange
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showTime), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            currentTime.bottomAnchor.constraint(equalTo: pickerView.topAnchor, constant: 20),
            currentTime.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func showTime() {
         if selectedCity.name == "All" {
             let allCitiesVC = AllCitiesViewViewController()
             navigationController?.pushViewController(allCitiesVC, animated: true)
         } else {
             let cityTimeVC = CityDetailView()
             cityTimeVC.cities = selectedCity
             navigationController?.pushViewController(cityTimeVC, animated: true)
         }
     }
     
    @objc func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm:ss"
        let currentTimeFormat = formatter.string(from: Date())
        currentTime.text = "Current Time: \n \(currentTimeFormat)"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = cities[row]
    }
}
