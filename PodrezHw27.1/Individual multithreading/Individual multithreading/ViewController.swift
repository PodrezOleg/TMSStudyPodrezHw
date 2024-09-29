//
//  ViewController.swift
//  Individual multithreading
//
//  Created by Oleg Podrez on 24.09.24.
//

import UIKit

class ViewController: UIViewController {
    
    class Wallet {
        private var balance: Double = 0.0
        private let addFundSemaphore = DispatchSemaphore(value: 1)
        private let spendFundsSemaphore = DispatchSemaphore(value: 1)
        private let CheckBalanceSemaphore = DispatchSemaphore(value: 1)
        
        private let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter
        }()
        
        func addFunds(_ amount: Double) {
            let formattedAmount = round(amount * 100) / 100.00
            if addFundSemaphore.wait(timeout: .now() + 2) == .success {
                defer { addFundSemaphore.signal() }
                balance += formattedAmount
                print("Пополнение: \(formattedAmount). Текущий баланс: \(checkBalance())")
            } else {
                print("Не удалось добавить средства: операция заблокирована.")
            }
        }
        
        func spendFunds(_ amount: Double) {
                  let formattedAmount = round(amount * 100) / 100.00
            spendFundsSemaphore.wait()
                  if balance >= formattedAmount {
                      balance -= formattedAmount
                      print("Снял: \(formattedAmount). Текущий баланс: \(checkBalance())")
                  } else {
                      print("Недостаточно средств")
                  }
            spendFundsSemaphore.signal()
              }
        
        func checkBalance() -> String {
            CheckBalanceSemaphore.wait()
            let formattedBalance = formattedAmount(balance)
            CheckBalanceSemaphore.signal()
            return "Текущий баланс: \(formattedBalance)"
        }
        
        private func formattedAmount(_ amount: Double) -> String {
            return numberFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performWalletOperations()
        }
    }
    
    func performWalletOperations(){
        let wallet = Wallet()
        let queue = DispatchQueue(
            label: "com.wallet.queue",
            attributes: .concurrent
        )
        let group = DispatchGroup()
        
        group.enter()
        queue.async {
            wallet.addFunds(248)
            sleep(1)
            group.leave()
        }
        group.enter()
        queue.async {
            wallet.spendFunds(59999)
            sleep(1)
            group.leave()
        }
        group.enter()
        queue.async {
            wallet.spendFunds(100)
            sleep(1)
            group.leave()
        }
        group.enter()
        queue.async {
            wallet.addFunds(5243697)
            sleep(1)
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("Финальный баланс: \(wallet.checkBalance())")
        }
    }
}
