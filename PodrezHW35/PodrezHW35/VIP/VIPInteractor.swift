//
//  VIPInteractor.swift
//  PodrezHW35
//
//  Created by Oleg Podrez on 10.11.24.
//

import UIKit

protocol VIPInteractorProtocol: AnyObject {
    func plusOne()
    func minusOne()
}

class VIPInteractor: VIPInteractorProtocol {
    var presenter: VIPPresenterProtocol?
    var entity = VIPEntity()
    
    func plusOne() {
        if entity.count < 50 {
            entity.count += 1
            presenter?.present(entity.count)
        }
    }
    
    func minusOne() {
           if entity.count > 0 {
               entity.count -= 1
               presenter?.present(entity.count)
           }
       }
   }
