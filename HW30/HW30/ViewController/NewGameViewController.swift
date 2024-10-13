//
//  NewGameViewController.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import UIKit

class NewGameViewController: UIViewController {
    
    let label = UILabel()
    let nameTextField = UITextField()
    let backButton = CustomMenuButton()
    let startGameButton = CustomMenuButton()
    let gameTimer = GameTimer()
    var isKeyBoardVisible = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundController.setupBackground(for: view, imageName: "CreateCharacterBackgroundNew")
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupUI() {
        label.text = "Вспомни свое имя"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: LayoutConstants.buttonFontSize)
        label.textColor = .white
        
        nameTextField.placeholder = "Введите имя"
        nameTextField.borderStyle = .roundedRect
        nameTextField.textColor = .white
        nameTextField.backgroundColor = .clear
        nameTextField.textAlignment = .center
        nameTextField.textColor = .black
        
        backButton.StartAnimationBorder()
        backButton.setTitle("Назад", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        startGameButton.setTitle("Вспомнить", for: .normal)
        startGameButton.StartAnimationBorder()
        startGameButton.addTarget(self, action: #selector(startNewGameCharacter), for: .touchUpInside)
        
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startGameButton)
        
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameTextField.topAnchor
                    .constraint(
                        equalTo: label.bottomAnchor,
                        constant: LayoutConstants.titleBottomSpacing
                    ),
                nameTextField.widthAnchor.constraint(equalToConstant: CGFloat(LayoutConstants.buttonWidth)),
                nameTextField.heightAnchor.constraint(equalToConstant: CGFloat(LayoutConstants.buttonHeight)),
                
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: LayoutConstants
                    .saveTopAncor),
                backButton.topAnchor
                    .constraint(
                        equalTo: view.safeAreaLayoutGuide.topAnchor,
                        constant: LayoutConstants
                            .saveTopAncor),
                startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                startGameButton.topAnchor
                    .constraint( equalTo: nameTextField.bottomAnchor,
                                 constant: LayoutConstants.titleBottomSpacing),
            ]
        )
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func keyBoardWillShow(notification: NSNotification) {
        if !isKeyBoardVisible {
            view.frame.origin.y -= LayoutConstants.keyboardHeight
            isKeyBoardVisible = true
        }
    }
    @objc func keyBoardWillHide(notification: NSNotification) {
        if isKeyBoardVisible {
            view.frame.origin.y = 0
            isKeyBoardVisible = false
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @objc func startNewGameCharacter() {
        
        guard let playerName = nameTextField.text, !playerName.isEmpty else {
            let alert = UIAlertController(
                title: "Вспоминай",
                message: "Дед, выпей таблетки и напиши свое имя",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "ЧТО??? ааа Ок",
                                          style: .default,
                                          handler: nil)
            )
            present(alert, animated: true, completion: nil)
            
            return
        }
            gameTimer.start() 
            UserDefaults.standard.set(playerName, forKey: "playerName")
            
            let newGameStartViewController = NewGameStartViewController()
            newGameStartViewController.playerName = playerName 
            newGameStartViewController.modalTransitionStyle = .crossDissolve
            newGameStartViewController.modalPresentationStyle = .fullScreen
            present(newGameStartViewController, animated: true, completion: nil)
        
           
         
        }
   
    }
    


