//
//  ViewController.swift
//  PodrezHw17
//
//  Created by Oleg Podrez on 25.08.24.
//

import UIKit

class ViewController: UIViewController, ButtonDelegateTap {
    func didTapUp() {
        Animation.animationSquare(squareView, direction: "up", in: view)
    }
    func didTapDown() {
        Animation.animationSquare(squareView, direction: "down", in: view)
    }
    func didTapLeft() {
        Animation.animationSquare(squareView, direction: "left", in: view)
    }
    func didTapRight() {
         Animation.animationSquare(squareView, direction: "right", in: view)
    }
    
    lazy var squareView: UIView = .init()
    let buttonDelegate = ButtonDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        squareView.frame = .init(x: view.bounds.width / 2 - 50,
                                 y: view.bounds.height / 2 - 50,
                                 width: 50,
                                 height: 100)
        squareView.backgroundColor = .systemOrange
        view.addSubview(squareView)
        
        buttonDelegate.delegate = self
        buttonDelegate.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonDelegate)
        
        NSLayoutConstraint.activate([
            buttonDelegate.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonDelegate.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonDelegate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonDelegate.heightAnchor.constraint(equalToConstant: 100)
        ])
 
    }
}
