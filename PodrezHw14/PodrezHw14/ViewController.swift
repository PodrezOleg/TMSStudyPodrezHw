//
//  ViewController.swift
//  PodrezHw14
//
//  Created by Oleg Podrez on 19.08.24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    lazy var blurEffect = UIBlurEffect(style: .light)
    lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    var backgroundImageView = UIImageView()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.minimumLineSpacing = 100
        layout.minimumInteritemSpacing = 100
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: PlanetCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.frame = view.bounds
        return collectionView
    }()
    
    private let planets: [Planet] = [
        Planet(name: "Mercury", imageName: "mercury"),
        Planet(name: "Venus", imageName: "venus"),
        Planet(name: "Earth", imageName: "earth"),
        Planet(name: "Mars", imageName: "mars"),
        Planet(name: "Jupiter", imageName: "jupiter"),
        Planet(name: "Saturn", imageName: "saturn"),
        Planet(name: "Uranus", imageName: "uranus"),
        Planet(name: "Neptune", imageName: "neptune")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: "sky_4")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.backgroundColor = UIColor.clear
        blurEffectView.alpha = 0.7
        
        view.addSubview(backgroundImageView)
        view.addSubview(blurEffectView)
        view.addSubview(collectionView)
        
        collectionView.frame = view.bounds
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        let parallaxEffect = offset * 0.1
        backgroundImageView.transform = CGAffineTransform(translationX: parallaxEffect, y: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCollectionViewCell.identifier, for: indexPath) as? PlanetCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: planets[indexPath.row])
        return cell
    }
}
