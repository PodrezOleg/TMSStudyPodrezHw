//
//  ViewController.swift
//  Individual multithreading
//
//  Created by Oleg Podrez on 24.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    actor Wallet {
        private var balance: Double = 0.0
        private let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter
        }()
        
        func addFunds(_ amount: Double) async {
            let formattedAmount = round(amount * 100) / 100.00
            balance += formattedAmount
            print("Пополнение: \(formattedAmount). Текущий баланс: \(await checkBalance())")
        }
        
        func spendFunds(_ amount: Double) async {
            let formattedAmount = round(amount * 100) / 100.00
            if balance >= formattedAmount {
                balance -= formattedAmount
                print("Снял: \(formattedAmount). Текущий баланс: \(await checkBalance())")
            } else {
                print("Недостаточно средств.")
            }
        }
        
        func checkBalance() async  -> String {
            let formattedBalance = formattedAmount(balance)
            return "Текущий баланс: \(formattedBalance)"
        }
        
        private func formattedAmount(_ amount: Double) -> String {
            return numberFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.performWalletOperations()
    
    }
    func performWalletOperations() {
        let wallet = Wallet()
        
        Task  {
            await wallet.addFunds(10)
        }
        Task {
            await wallet.spendFunds(2)
        }
        Task {
            await wallet.spendFunds(4)
        }
        Task {
            await wallet.addFunds(124)
        }
    }
}
    
