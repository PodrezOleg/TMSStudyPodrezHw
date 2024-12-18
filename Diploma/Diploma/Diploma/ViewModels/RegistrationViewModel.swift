//
//  RegistrationViewModel.swift
//  Diploma
//
//  Created by Oleg Podrez on 4.12.24.
//

import Foundation
import UIKit

class RegistrationViewModel {
    let heightOptions = Array(100...250)
    let weightOptions = Array(30...250)
    let allergyOptions = ["Нет аллергий", "Глютен", "Орехи", "Молочные продукты", "Фрукты","Морепродукты"]
    
    func registerUser(name: String, password: String, dateOfBirth: Date, height: Int, weight: Int, allergy: String, image: UIImage){
        CoreDataManager.shared.createUser(
                  name: name,
                  password: password,
                  dateOfBirth: dateOfBirth,
                  height: height,
                  weight: weight,
                  image: image
              )
    }
    
    func loginUser(name: String, password: String) -> Bool {
        return CoreDataManager.shared.authenticateUser(name: name, password: password)
    }
}


