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
        setupMainViewBackground()
        setupMenuButtons()
        
        let titleLabel = UILabel()
        titleLabel.text = "Все вспомнить"
        titleLabel.font = UIFont.systemFont(ofSize: LayoutConstants.titleFontSize)
        titleLabel.textAlignment = .center
       
        
        
    }
    
    
    
    
    func setupMainViewBackground() {
        let backgroundImage = UIImage(named: "MainBackgroundView")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    func setupMenuButtons()  {
        let stackMainView = UIStackView()
        stackMainView.axis = .vertical
        stackMainView.distribution = .equalSpacing
        stackMainView.alignment = .center
        stackMainView.spacing = LayoutConstants.stackViewSpacing
        
        let buttonsAction = [
            ("Новая Игра", #selector(startNewGame)),
            ("Новая Игра+", #selector(startNewGamePlus)),
            ("Загрузить", #selector(loadGame)),
             ("Лидеры", #selector(showLeaderBoard))
            ]
        for (title, action) in buttonsAction {
            let button = CustomMenuButton()
            button.setButtonTitle(title)
            button.addTarget(self, action: action, for: .touchUpInside)
            
            if title == "Новая Игра+" || title == "Лидеры" {
                if isGameCompleted {
                    button.StartAnimationBorder()
                } else {
                    button.layer.borderColor = UIColor.gray.cgColor
                    button.isEnabled = false
                }
            }
            
            stackMainView.addArrangedSubview(button)
        }
      
        stackMainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackMainView)
        
        NSLayoutConstraint.activate([
            stackMainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackMainView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
    @objc func startNewGame() {
//        let gameViewController = GameViewController()  // Твой игровой контроллер
//        navigationController?.pushViewController(gameViewController, animated: true)
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
