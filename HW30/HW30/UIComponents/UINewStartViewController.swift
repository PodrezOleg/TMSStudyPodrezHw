//
//  UINewStartViewController.swift
//  HW30
//
//  Created by Oleg Podrez on 13.10.24.
//

import UIKit

class UINewStartViewController {
    
    static func setupUI(for viewController: UIViewController, storyTextView: UITextView, storyStackView: UIStackView) {
  
        storyTextView.font = UIFont.systemFont(ofSize: LayoutConstants.textStorySize)
        storyTextView.textColor = .white
        storyTextView.backgroundColor = .clear
        storyTextView.isEditable = false
        storyTextView.isSelectable = false
        storyTextView.textAlignment = .justified
        
        storyTextView.layer.borderWidth = LayoutConstants.borderMainText
        storyTextView.layer.borderColor = UIColor.white.cgColor
        storyTextView.layer.cornerRadius = LayoutConstants.cornerRadiusButton
        storyTextView.layer.masksToBounds = true
        
        storyStackView.axis = .vertical
        storyStackView.distribution = .equalSpacing
        storyStackView.alignment = .center
        storyStackView.spacing = LayoutConstants.stackViewSpacing
        
        storyStackView.translatesAutoresizingMaskIntoConstraints = false
        storyTextView.translatesAutoresizingMaskIntoConstraints = false
        
        viewController.view.addSubview(storyStackView)
        viewController.view.addSubview(storyTextView)
        
        NSLayoutConstraint.activate([
            storyTextView.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.topAnchorStack),
            storyTextView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: LayoutConstants.leadingStack),
            storyTextView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: LayoutConstants.trailingStack),
            storyTextView.heightAnchor.constraint(equalTo: viewController.view.heightAnchor, multiplier: LayoutConstants.heightStack),
            
            storyStackView.topAnchor.constraint(equalTo: storyTextView.bottomAnchor, constant: LayoutConstants.topAnchorStack),
            storyStackView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: LayoutConstants.leadingStack),
            storyStackView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: LayoutConstants.trailingStack),
            storyStackView.bottomAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.bottomAnchor, constant: LayoutConstants.bottomAnchorStack)
        ])
    }
    
    static func setupGestures(for viewController: UIViewController, nextSelector: Selector, previousSelector: Selector) {
        
        let nextTapGesture = UISwipeGestureRecognizer(target: viewController, action: nextSelector)
        nextTapGesture.direction = .left
        viewController.view.addGestureRecognizer(nextTapGesture)
        
        let previousSwipeGesture = UISwipeGestureRecognizer(target: viewController, action: previousSelector)
        previousSwipeGesture.direction = .right
        viewController.view.addGestureRecognizer(previousSwipeGesture)
    }
    
}
