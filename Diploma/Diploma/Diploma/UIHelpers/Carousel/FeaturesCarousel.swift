//
//  FeaturesCarusel.swift
//  Diploma
//
//  Created by Oleg Podrez on 8.12.24.
//

import UIKit

protocol FeaturesCarouselDelegate: AnyObject {
    func featuresCarousel(_ carousel: FeaturesCarousel, didSelectFeatureAt index: Int)
}

class FeaturesCarousel: UIView {
    weak var delegate: FeaturesCarouselDelegate?
    
    private var features: [(text: String, imageName: String)] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: LayoutConstants.cellWidth, height: LayoutConstants.cellHeight)
        let buildCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        buildCollectionView.backgroundColor = .clear
        buildCollectionView.isPagingEnabled = true
        buildCollectionView.showsHorizontalScrollIndicator = false
        buildCollectionView.translatesAutoresizingMaskIntoConstraints = false
        buildCollectionView.dataSource = self
        buildCollectionView.delegate = self
        buildCollectionView.register(CarouselCellColletionView.self, forCellWithReuseIdentifier: CarouselCellColletionView.reuseIdentifier)
        return collectionView
    }()
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init? (coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupCollectionView() {
         addSubview(collectionView)
         
         NSLayoutConstraint.activate([
             collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
             collectionView.topAnchor.constraint(equalTo: topAnchor),
             collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
         ])
     }
     
     func configure(with features: [(text: String, imageName: String)]) {
         self.features = features
         collectionView.reloadData()
     }
 }

extension FeaturesCarousel: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return features.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CarouselCellColletionView.reuseIdentifier,
                for: indexPath
        ) as? CarouselCellColletionView else {
            print("Error: Unable to dequeue CarouselCellColletionView. Returning a default cell.")
            return UICollectionViewCell()
        }
        
        let feature = features[indexPath.item]
        cell.configureCell(with: feature)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.featuresCarousel(self, didSelectFeatureAt: indexPath.item)
    }
}
