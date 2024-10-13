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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundController.setupBlurBackground(for: view, style: .extraLight, alpha: LayoutConstants.blurAlpha)
        backgroundController.setupBackground(for: view, imageName: "StoryBackground")
        
        UINewStartViewController.setupUI(for: self, storyTextView: storyTextView, storyStackView: storyStackView)
        UINewStartViewController.setupGestures(for: self, nextSelector: #selector(handleNextSegmentTap), previousSelector: #selector(handlePreviousSegmentSwipe))
        
        displayPlayerIntro()  // Начало с ввода имени
    }
    
    // Переход к следующему сегменту текста с именем
    @objc func handleNextSegmentTap() {
        displayNextSegment()
    }
    
    // Переход к предыдущему сегменту текста с именем
    @objc func handlePreviousSegmentSwipe() {
        displayPreviousSegment()
    }
    
    // Отображаем вводное сообщение с именем игрока
    func displayPlayerIntro() {
        guard currentTextIndex >= 0 && currentTextIndex < lorText.count else { return }
        let textWithPlayerName = lorText[currentTextIndex].replacingOccurrences(of: "{name}", with: playerName)
        storyTextView.text = textWithPlayerName
    }
    
    // Переход к следующему тексту или началу сюжета
    func displayNextSegment() {
        if currentTextIndex < lorText.count - 1 {
            currentTextIndex += 1
            displayPlayerIntro()
        } else {
            // После ввода имени начинаем показывать сюжет
            displayCurrentStoryPoint()
        }
    }
    
    // Переход к предыдущему тексту
    func displayPreviousSegment() {
        if currentTextIndex > 0 {
            currentTextIndex -= 1
            displayPlayerIntro()
        }
    }
    
    // Отображаем текущую сюжетную точку и выборы
    func displayCurrentStoryPoint() {
        let currentStoryPoint = storyPoints[currentStoryPointID]
        storyTextView.text = currentStoryPoint.text
        storyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Добавляем кнопки для каждого варианта выбора
        for choice in currentStoryPoint.choices {
            let choiceButton = CustomMenuButton() 
            choiceButton.setTitle(choice.text, for: .normal)
            choiceButton.backgroundColor = .orange
            choiceButton.layer.cornerRadius = 10
            choiceButton.addTarget(self, action: #selector(choiceSelected(_:)), for: .touchUpInside)
            choiceButton.tag = choice.nextStoryPointID
            storyStackView.addArrangedSubview(choiceButton)
        }
    }
    
    // Обработка выбора и переход к следующей сюжетной точке
    @objc func choiceSelected(_ sender: CustomMenuButton) {
        currentStoryPointID = sender.tag
        displayCurrentStoryPoint()
    }
}
