//
//  ViewController.swift
//  PodrezHw16
//
//  Created by Oleg Podrez on 24.08.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var dvdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 100, y: 100, width: 100, height: 100)
        imageView.backgroundColor = .systemOrange
        imageView.image = UIImage(named: "DVD")
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(dvdImageView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        dvdImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func viewDidTap() {
        let randomX = CGFloat.random(in: 0...(view.bounds.width - dvdImageView.frame.width))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - dvdImageView.frame.height))
        
        dvdImageView.frame.origin = CGPoint(x: randomX, y: randomY)
        dvdImageView.backgroundColor = [UIColor.systemOrange, UIColor.systemBrown, UIColor.systemCyan, UIColor.systemPink, UIColor.red, UIColor.systemYellow, UIColor.systemGreen].randomElement()
    }
}
