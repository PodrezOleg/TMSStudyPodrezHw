//
//  NewGameStartViewController.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import UIKit

class NewGameStartViewController: UIViewController {
    
    let storyStackView = UIStackView()
    let storyTextView = UITextView()
    var currentTextIndex = 0
    var currentStoryPointID = 0
    var playerName: String = "Player"
    var isShowingChoiceExplanation = false
    var selectedChoiceExplanation: String?
    var selectedNextStoryPointID: Int?
    let gameTimer = GameTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundController.setupBlurBackground(for: view, style: .extraLight, alpha: LayoutConstants.blurAlpha)
        backgroundController.setupBackground(for: view, imageName: "StoryBackground")
        
        UINewStartViewController.setupUI(for: self, storyTextView: storyTextView, storyStackView: storyStackView)
        UINewStartViewController.setupGestures(for: self, nextSelector: #selector(handleNextSegmentTap), previousSelector: #selector(handlePreviousSegmentSwipe))
        
        displayPlayerIntro() 
    }
    
    @objc func handleNextSegmentTap() {
        if isShowingChoiceExplanation {
            isShowingChoiceExplanation = false
            if let nextStoryPointID = selectedNextStoryPointID {
                if nextStoryPointID >= 0 && nextStoryPointID < storyPoints.count {
                    currentStoryPointID = nextStoryPointID
                    displayCurrentStoryPoint()
                } else {
                    print("Ошибка: выбранный ID выходит за пределы массива storyPoints")
                }
            }
        } else {
            displayNextSegment()
        }
    }
    
    @objc func handlePreviousSegmentSwipe() {
        displayPreviousSegment()
    }
    
    func displayPlayerIntro() {
        guard currentTextIndex >= 0 && currentTextIndex < lorText.count else {
            displayCurrentStoryPoint()
            return
        }
        
        let textWithPlayerName = ReplaceName.replacePlayerName(in: lorText[currentTextIndex], with: playerName)
        storyTextView.text = textWithPlayerName
    }
    
    func displayNextSegment() {
        if currentTextIndex < lorText.count - 1 {
            currentTextIndex += 1
            displayPlayerIntro()
        } else {
            displayCurrentStoryPoint()
        }
    }
    
    func displayPreviousSegment() {
        if currentTextIndex > 0 {
            currentTextIndex -= 1
            displayPlayerIntro()
        }
    }
    
    func displayCurrentStoryPoint() {
        let currentStoryPoint = storyPoints[currentStoryPointID]
        
        let storyTextWithPlayerName = ReplaceName.replacePlayerName(in: currentStoryPoint.text, with: playerName)
        storyTextView.text = storyTextWithPlayerName
    
        for choice in currentStoryPoint.choices {
            let choiceButton = UIButton()
            let choiceTextWithPlayerName = ReplaceName.replacePlayerName(in: choice.text, with: playerName)
            choiceButton.setTitle(choiceTextWithPlayerName, for: .normal)
            let explanationWithPlayerName = ReplaceName.replacePlayerName(in: choice.explanation, with: playerName)
            choiceButton.backgroundColor = UIColor.orange.withAlphaComponent(LayoutConstants.blurAlpha)
            choiceButton.layer.cornerRadius = LayoutConstants.cornerRadiusButton
            
            choiceButton.titleLabel?.numberOfLines = 0
            choiceButton.titleLabel?.textAlignment = .center
            choiceButton.titleLabel?.minimumScaleFactor = 0.5
            
            choiceButton.translatesAutoresizingMaskIntoConstraints = false
            choiceButton.widthAnchor.constraint(equalToConstant: LayoutConstants.widthStroyButton).isActive = true
            choiceButton.heightAnchor.constraint(equalToConstant: LayoutConstants.heightStroyButton).isActive = true

            choiceButton.accessibilityHint = explanationWithPlayerName
            choiceButton.tag = choice.nextStoryPointID
            choiceButton.addTarget(self, action: #selector(choiceSelected(_:)), for: .touchUpInside)
            storyStackView.addArrangedSubview(choiceButton)
        }
        
        backgroundController.setupBackground(for: view, imageName: currentStoryPoint.backGroundView)
    }
    
    @objc func choiceSelected(_ sender: UIButton) {
        if let explanation = sender.accessibilityHint {
            selectedChoiceExplanation = explanation
            storyTextView.text = explanation
        }
        
        isShowingChoiceExplanation = true
        selectedNextStoryPointID = sender.tag
    
        let currentStoryPoint = storyPoints[currentStoryPointID]
        
        if currentStoryPoint.text.contains("Ты погиб") {
            endGameWithDeath()
            return
        }
        
        storyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    // Сохранение игры
    @objc func saveCurrentGame() {
        GameStateManager.shared.saveGame(playerName: playerName, currentStoryPointID: currentStoryPointID, elapsedTime: gameTimer.elapsedTime)
        GameStateManager.shared.addLeaderboardEntry(playerName: playerName, time: gameTimer.elapsedTime)
        print("Игра сохранена.")
    }
    
    // Загрузка игры
    @objc func loadSavedGame() {
        if let savedGame = GameStateManager.shared.loadGame() {
            self.playerName = savedGame.playerName
            self.currentStoryPointID = savedGame.currentStoryPointID
            
            gameTimer.setElapsedTime(savedGame.elapsedTime)
            
            print("Игра загружена: Игрок: \(playerName), Время: \(gameTimer.elapsedTime), Точка сюжета: \(currentStoryPointID)")
            displayCurrentStoryPoint()
        } else {
            print("Сохраненная игра не найдена.")
        }
    }
    
    func endGameWithDeath() {
        gameTimer.stop()
        GameStateManager.shared.addLeaderboardEntry(playerName: playerName, time: gameTimer.elapsedTime)
        showLeaderboardScreen()
    }
    
    func showLeaderboardScreen() {
        let leaderboardVC = LeaderboardViewController()
        leaderboardVC.modalPresentationStyle = .fullScreen
        leaderboardVC.modalTransitionStyle = .crossDissolve
        present(leaderboardVC, animated: true, completion: nil)
    }
}
