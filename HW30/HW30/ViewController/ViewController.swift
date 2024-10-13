//
//  ViewController.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    var isGameCompleted: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundController.setupBackground(for: view, imageName: "MainBackgroundView")
        setupMenuButtons()
        
    }
    
    func setupMenuButtons()  {
        let stackMainView = UIStackView()
        stackMainView.axis = .vertical
        stackMainView.distribution = .equalSpacing
        stackMainView.alignment = .center
        stackMainView.spacing = LayoutConstants.stackViewSpacing
        
        let titleLabel = UILabel()
        titleLabel.text = "Все вспомнить!"
        titleLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleFontSize, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .orange.withAlphaComponent(0.8)
        
        titleLabel.layer.cornerRadius = LayoutConstants.cornerRadiusButton
        titleLabel.layer.masksToBounds = true
        
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowOpacity = 0.5
        titleLabel.layer.shadowOffset = LayoutConstants.shadowOffsetButton
        titleLabel.layer.shadowRadius = LayoutConstants.shadowRadiusButton
        titleLabel.layer.shadowRadius = LayoutConstants.shadowRadiusButton
        
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        let buttonsAction = [
            ("Новая Игра", #selector(startNewGame)),
            ("Забыть все+", #selector(startNewGamePlus)),
            ("Загрузить", #selector(loadGame)),
            ("Лидеры", #selector(showLeaderBoard))
        ]
        
        for (title, action) in buttonsAction {
            let button = CustomMenuButton()
            button.setButtonTitle(title)
            button.addTarget(self, action: action, for: .touchUpInside)
            
            //условия активации кнопки Новая игра+
            
            if title == "Забыть все+" || title == "Лидеры" {
                if isGameCompleted {
                    button.isEnabled = true
                    button.setTitleColor(.white, for: .normal)
                    button.StartAnimationBorder()
                } else {
                    button.isEnabled = false
                    button.layer.borderColor = UIColor.gray.cgColor
                    button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
                }
            }
    
            stackMainView.addArrangedSubview(button)
        }
        
        stackMainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackMainView)
        
        NSLayoutConstraint.activate([
            stackMainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackMainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: LayoutConstants.topTittleSpacing
            ),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        )
        
    }
    @objc func startNewGame() {
        let newGameViewController = NewGameViewController()  
        newGameViewController.modalTransitionStyle = .crossDissolve
        newGameViewController.modalPresentationStyle = .fullScreen
        present(newGameViewController, animated: true, completion: nil)
    }
    @objc func startNewGamePlus() {
        //                 let gamePlusViewController = GamePlusViewController()
        //                 navigationController?.pushViewController(gamePlusViewController, animated: true)
    }
    @objc func loadGame() {
        //                 let loadGameViewController = LoadGameViewController()
        //                 navigationController?.pushViewController(loadGameViewController, animated: true)
    }
    @objc func showLeaderBoard() {
        //                 let leaderBoardViewController = LeaderBoardViewController()
        //                 navigationController?.pushViewController(leaderBoardViewController, animated: true)
    }
    
}
