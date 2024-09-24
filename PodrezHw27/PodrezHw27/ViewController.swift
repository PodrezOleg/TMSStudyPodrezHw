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
        private let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            return formatter
        }()
        
        func deposit(amount: Double) {
            let roundedAmount = round(amount * 100) / 100.0
            semaphore.wait()
            balance += roundedAmount
            print("Пополнил счет на: \(roundedAmount). Текущий баланс: \(balance)")
            semaphore.signal()
        }
        
        func withdraw(amount: Double) {
            let roundedAmount = round(amount * 100) / 100.0
            semaphore.wait()
            if balance >= amount {
                balance -= amount
                print("Снял: \(roundedAmount). Текущий баланс: \(balance)")
            } else {
                print("Хочу снять: \(roundedAmount). Недостаточно средств.Текущий баланс: \(balance)")
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
