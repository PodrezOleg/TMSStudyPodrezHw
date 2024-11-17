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
    private var isRunning: Bool = false
    static let shared = GameTimer()

    
    func start() {
        guard !isRunning else { return }
        isRunning = true
        startTime = Date().timeIntervalSince1970 - elapsedTime
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
        print("Таймер запущен")
    }
    

    func stop() {
        guard isRunning else { return }
        timer?.invalidate()
        timer = nil
        isRunning = false
        print("Таймер остановлен на \(elapsedTime) секунд")
    }
    
    func reset() {
        stop()
        elapsedTime = 0
        print("Таймер сброшен")
    }
    
    func setElapsedTime(_ time: TimeInterval) {
        self.elapsedTime = time
        print("Установлено время: \(time) секунд")
    }

    @objc private func updateTimer() {
        elapsedTime = Date().timeIntervalSince1970 - startTime
        print("Текущее время в игре: \(elapsedTime)")
    }

    func isTimerRunning() -> Bool {
        return isRunning
    }
}
