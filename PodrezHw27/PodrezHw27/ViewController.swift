//
//  ViewController.swift
//  PodrezHw27
//
//  Created by Oleg Podrez on 22.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    class BankAccount {
        private var balance: Double = 0
        private let semaphore = DispatchSemaphore(value: 1)
        
        func deposit(amount: Double) {
            semaphore.wait()
            balance += amount
            print("Пополнил счет на: \(amount). Текущий баланс: \(balance)")
            semaphore.signal()
        }
        
        func withdraw(amount: Double) {
            semaphore.wait()
            if balance >= amount {
                balance -= amount
                print("Снял: \(amount). Текущий баланс: \(balance)")
            } else {
                print("Хочу снять: \(amount). Недостаточно средств.Текущий баланс: \(balance)")
            }
            semaphore.signal()
        }
    }
    
    let account = BankAccount()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = DispatchQueue(label: "com.podrez.hw27.queue")
        
        for _ in 1...10 {
            queue.async {
                self.account.deposit(amount: Double.random(in: 1...100))
            }
            queue.async {
                self.account.withdraw(amount: Double.random(in: 1...1000))
            }
        }
        
    }
}
