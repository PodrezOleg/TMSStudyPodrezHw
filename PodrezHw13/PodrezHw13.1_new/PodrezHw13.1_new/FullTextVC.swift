//
//  FullTextVC.swift
//  PodrezHw13.1_new
//
//  Created by Oleg Podrez on 18.08.24.
//

import UIKit

class FullTextVC: UIViewController {
    
    var fullTextLabel = UILabel()
    var imageFull = UIImageView()
    
    var textToDisplay: String? {
        didSet {
            fullTextLabel.text = textToDisplay
        }
    }
    var imageToDisplay: UIImage? {
        didSet {
            imageFull.image = imageToDisplay
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        configureLabel()
        configureImageView()
        setConstrains()
    }
    
    private func configureLabel() {
        fullTextLabel.numberOfLines = 0
        fullTextLabel.textColor = .black
        fullTextLabel.font = UIFont.systemFont(ofSize: 18)
        fullTextLabel.textAlignment = .center
        fullTextLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fullTextLabel)
    }
    
     private  func configureImageView() {
            imageFull.contentMode = .scaleToFill
            imageFull.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageFull)
        }
   private func setConstrains() {
            
            NSLayoutConstraint.activate ([
                imageFull.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                imageFull.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageFull.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                imageFull.heightAnchor.constraint(equalTo: imageFull.widthAnchor, multiplier: 0.5),
                
                
                fullTextLabel.topAnchor.constraint(equalTo: imageFull.bottomAnchor, constant: 20),
                fullTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                fullTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                fullTextLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
        }
    }

