//
//  TimerModel.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import Foundation

class GameTimer {
    private var timer: Timer?
    private var startTime: TimeInterval = 0
    private(set) var elapsedTime: TimeInterval = 0
    
    func start() {
        print("Таймер запущен")
        startTime = Date().timeIntervalSince1970
        timer = Timer
            .scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector (updateTimer),
                userInfo: nil,
                repeats: true )
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        stop()
        elapsedTime = 0
    }
    @objc private func updateTimer() {
        let currentTime = Date().timeIntervalSince1970
        
        if startTime > 0 {
            elapsedTime = currentTime - startTime
            print("Время в игре \(elapsedTime)")
        } else {
            print("Ошибка: startTime не инициализировано")
        }
    }
}
