//
//  RegistrationViewModel.swift
//  Diploma
//
//  Created by Oleg Podrez on 4.12.24.
//

import Foundation

class RegistrationViewModel {
    let heightOptions = Array(100...250)
    let weightOptions = Array(30...250)
    let allergyOptions = ["Нет аллергий", "Глютен", "Орехи", "Молочные продукты", "Фрукты","Морепродукты"]
    
    func registerUser(name: String, dateOfBirth: Date, height: Int, weight: Int, allergy: String){
        CoreDataManager.shared.createUser(
                  name: name,
                  dateOfBirth: dateOfBirth,
                  height: height,
                  weight: weight,
                  allergies: allergy
              )
    }
    
}
