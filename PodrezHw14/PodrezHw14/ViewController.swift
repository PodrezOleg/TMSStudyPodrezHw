//
//  ViewController.swift
//  PodrezHw14
//
//  Created by Oleg Podrez on 19.08.24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView?
    private let backgroundImageView = UIImageView()
    
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
        
        view.backgroundColor = .cyan
        
        // Настройка фона
        backgroundImageView.image = UIImage(named: "sky_3")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        // Настройка UICollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = .zero
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: PlanetCollectionViewCell.identifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = .clear 
        guard let collectionView = collectionView else {
            return
        }
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Сдвиг фонового изображения при прокрутке
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

