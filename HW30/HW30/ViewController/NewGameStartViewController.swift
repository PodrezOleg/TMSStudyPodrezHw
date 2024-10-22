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
    var currentStoryPointID = 201
    var playerName: String = "Fantom Player"
    var isShowingChoiceExplanation = false
    var selectedChoiceExplanation: String?
    var selectedNextStoryPointID: Int?
    let gameTimer = GameTimer.shared
    
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
            
            if selectedNextStoryPointID == 101 {
                endGameWithDeath()
                } else if selectedNextStoryPointID == 102 {
                    backToMainMenu() 
                } else if let nextStoryPoint = findStoryPoint(by: selectedNextStoryPointID ?? -1) {
                    currentStoryPointID = nextStoryPoint.id
                    displayCurrentStoryPoint()
                } else {
                    print("Ошибка: ID следующей точки не найден.")
                }
            
            if let tapGestures = view.gestureRecognizers?.filter({ $0 is UITapGestureRecognizer }) {
                for gesture in tapGestures {
                    view.removeGestureRecognizer(gesture)
                }
            }
            if let nextStoryPointID = selectedNextStoryPointID, let nextStoryPoint = findStoryPoint(by: nextStoryPointID) {
                currentStoryPointID = nextStoryPoint.id
                displayCurrentStoryPoint()
            } else {
                print("Ошибка: ID следующей точки не найден.")
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
        guard let currentStoryPoint = findStoryPoint(by: currentStoryPointID) else {
            print("Ошибка: Точка с ID \(currentStoryPointID) не найдена")
            return
        }
        
        let storyTextWithPlayerName = ReplaceName.replacePlayerName(in: currentStoryPoint.text, with: playerName)
        storyTextView.text = storyTextWithPlayerName
        
        if currentStoryPoint.text.contains("Ты погиб") {
            GameTimer.shared.stop()
            GameStateManager.shared.addLeaderboardEntry(playerName: playerName, time: gameTimer.elapsedTime)
            print("Таймер остановлен. Время: \(gameTimer.elapsedTime) секунд. Результат добавлен в таблицу лидеров.")
        }
        
        storyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
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
            
            NSLayoutConstraint.activate([
                choiceButton.widthAnchor.constraint(equalToConstant: LayoutConstants.widthStroyButton),
                choiceButton.heightAnchor.constraint(equalToConstant: LayoutConstants.heightStroyButton)
            ])
            
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

        storyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleNextSegmentTap))
        view.addGestureRecognizer(tapGesture)
    }

    func findStoryPoint(by id: Int) -> StoryPoint? {
        return storyPoints.first(where: { $0.id == id })
    }
    
    @objc func saveCurrentGame() {
        GameStateManager.shared.saveGame(playerName: playerName, currentStoryPointID: currentStoryPointID, elapsedTime: gameTimer.elapsedTime)
    }
       
    @objc func loadSavedGame() {
        if let savedGame = GameStateManager.shared.loadGame() {
            self.playerName = savedGame.playerName
            self.currentStoryPointID = savedGame.currentStoryPointID
            GameTimer.shared.stop()
            GameStateManager.shared.addLeaderboardEntry(playerName: playerName, time: gameTimer.elapsedTime)
        }
    }
    
    func endGameWithDeath() {
        GameTimer.shared.stop()
        GameStateManager.shared.addLeaderboardEntry(playerName: playerName, time: gameTimer.elapsedTime)
        UserDefaults.standard.set(true, forKey: "endGameWithDeath")
        showLeaderboardScreen()
    }
    
    func backToMainMenu() {
        let mainViewController = MainMenuViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        mainViewController.modalTransitionStyle = .crossDissolve
        present(mainViewController, animated: true, completion: nil)
    }
    
    func showLeaderboardScreen() {
        let leaderboardVC = LeaderboardViewController()
        leaderboardVC.modalPresentationStyle = .fullScreen
        leaderboardVC.modalTransitionStyle = .crossDissolve
        present(leaderboardVC, animated: true, completion: nil)
    }
}
