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
        startTime = Date().timeIntervalSince1970 - elapsedTime  
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        stop()
        elapsedTime = 0
    }
    func setElapsedTime(_ time: TimeInterval) {
         self.elapsedTime = time
     }
    
    @objc private func updateTimer() {
        let currentTime = Date().timeIntervalSince1970
        elapsedTime = currentTime - startTime
        print("Время в игре \(elapsedTime)")
    }
}
