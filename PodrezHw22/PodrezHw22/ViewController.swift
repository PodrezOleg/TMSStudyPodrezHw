//
//  ViewController.swift
//  PodrezHw22
//
//  Created by Oleg Podrez on 1.09.24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let buttonToTap: UIButton = {
        let buttonToTap = UIButton(type: .system)
        buttonToTap.setTitle("Показать сообщение", for: .normal)
        buttonToTap.setTitleColor(.blue, for: .normal)
        buttonToTap.backgroundColor = .white
        buttonToTap.layer.cornerRadius = 5
        buttonToTap.translatesAutoresizingMaskIntoConstraints = false
        return buttonToTap
    }()
    
    let buttonAddImage: UIButton = {
        let buttonToTap = UIButton(type: .system)
        buttonToTap.setTitle("Загрузить изображение", for: .normal)
        buttonToTap.setTitleColor(.blue, for: .normal)
        buttonToTap.backgroundColor = .white
        buttonToTap.layer.cornerRadius = 5
        buttonToTap.translatesAutoresizingMaskIntoConstraints = false
        return buttonToTap
    }()
    
    let showCity: UILabel = {
        let labelCity = UILabel()
        labelCity.text = "Выберете город"
        labelCity.textAlignment = .center
        labelCity.font = UIFont.systemFont(ofSize: 20)
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        return labelCity
    }()
   
    let pickerCity: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let showPicture: UIImageView = {
        let showPicture = UIImageView()
        showPicture.contentMode = .scaleToFill
        showPicture.layer.cornerRadius = 30
//        showPicture.layer.borderWidth = 1
//        showPicture.layer.borderColor = UIColor.orange.cgColor
        showPicture.clipsToBounds = true
        showPicture.translatesAutoresizingMaskIntoConstraints = false
        return showPicture
    }()
    
    var cities = ["Мачу-Пикчу", "Вавилон", "Троя", "Помпеи", "Теночтитлан", "Припять", "Галвестон"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        view.addSubview(buttonToTap)
        view.addSubview(pickerCity)
        view.addSubview(showCity)
        view.addSubview(buttonAddImage)
        view.addSubview(showPicture)
        
        pickerCity.delegate = self
        pickerCity.dataSource = self
        
        NSLayoutConstraint.activate([
            buttonAddImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAddImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonAddImage.heightAnchor.constraint(equalToConstant: 50),
            buttonAddImage.widthAnchor.constraint(equalToConstant: 250),
            
            buttonToTap.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonToTap.topAnchor.constraint(equalTo: buttonAddImage.bottomAnchor, constant: 20),
            buttonToTap.heightAnchor.constraint(equalToConstant: 50),
            buttonToTap.widthAnchor.constraint(equalToConstant: 250),
            
            pickerCity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerCity.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            showCity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showCity.bottomAnchor.constraint(equalTo: pickerCity.topAnchor, constant: 20),
            showCity.widthAnchor.constraint(equalToConstant: 200),
            showCity.heightAnchor.constraint(equalToConstant: 75),
            
            showPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showPicture.bottomAnchor.constraint(equalTo: buttonAddImage.topAnchor, constant: -20),
            showPicture.heightAnchor.constraint(equalToConstant: 200),
            showPicture.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        buttonToTap.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        buttonAddImage.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showCity.text = (cities[row])
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Важное Сообщение",
                                      message: "Спасибо, что выбрали наше приложение!",
                                      preferredStyle: .alert)
        
        let alertButtonsCancel = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(alertButtonsCancel)
        
        let alertButtonsOk = UIAlertAction(title: "Ok", style: .default) { _ in
            self.okButton()
        }
        alert.addAction(alertButtonsOk)
        present(alert, animated: true, completion: nil)
    }
    
    func okButton() {
        let okButtonAlert = UIAlertController(title: nil,
                                              message: "Спасибо",
                                              preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        okButtonAlert.addAction(okButton)
        
        present(okButtonAlert, animated: true, completion: nil)
    }
    
    @objc func openImagePicker() {
            let pickerController = UIImagePickerController()
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = true
            pickerController.delegate = self
            present(pickerController, animated: true)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[.originalImage] as? UIImage {
               showPicture.image = image
           }
           picker.dismiss(animated: true)
       }
}

