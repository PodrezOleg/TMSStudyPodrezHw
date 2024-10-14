
//  SaveManger.swift
//  HW30
//
//  Created by Oleg Podrez on 14.10.24.
//

import Foundation

class GameStateManager {
    static let shared = GameStateManager()
    
    private let leaderboardKey = "leaderboard"
    
    struct GameState: Codable {
        let playerName: String
        let currentStoryPointID: Int
        let elapsedTime: TimeInterval
    }
    
    struct LeaderboardEntry: Codable {
        let playerName: String
        let time: TimeInterval
    }
    
    func saveGame(playerName: String, currentStoryPointID: Int, elapsedTime: TimeInterval) {
        let gameState = GameState(playerName: playerName, currentStoryPointID: currentStoryPointID, elapsedTime: elapsedTime)
        if let data = try? JSONEncoder().encode(gameState) {
            UserDefaults.standard.set(data, forKey: "savedGame")
        }
    }
    
    func loadGame() -> GameState? {
        if let data = UserDefaults.standard.data(forKey: "savedGame"),
           let gameState = try? JSONDecoder().decode(GameState.self, from: data) {
            return gameState
        }
        return nil
    }
    
    func deleteSavedGame() {
        UserDefaults.standard.removeObject(forKey: "savedGame")
    }
    

    func addLeaderboardEntry(playerName: String, time: TimeInterval) {
        var leaderboard = loadLeaderboard()
        let newEntry = LeaderboardEntry(playerName: playerName, time: time)
        leaderboard.append(newEntry)
        leaderboard.sort { $0.time < $1.time }
        saveLeaderboard(leaderboard)
    }
    
    private func saveLeaderboard(_ leaderboard: [LeaderboardEntry]) {
        if let data = try? JSONEncoder().encode(leaderboard) {
            UserDefaults.standard.set(data, forKey: leaderboardKey)
        }
    }
    
    func loadLeaderboard() -> [LeaderboardEntry] {
        if let data = UserDefaults.standard.data(forKey: leaderboardKey),
           let leaderboard = try? JSONDecoder().decode([LeaderboardEntry].self, from: data) {
            return leaderboard
        }
        return []
    }
    
    func clearLeaderboard() {
        UserDefaults.standard.removeObject(forKey: leaderboardKey)
    }
}
