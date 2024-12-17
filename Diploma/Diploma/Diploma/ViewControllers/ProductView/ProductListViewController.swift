//
//  ProductListViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 15.12.2024.
//

import UIKit

class ProductListViewController: UIViewController {
    private var collectionView: UICollectionView!
    private var products: [Product] = []
    var onProductSelected: ((Product) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupKeyboardHandling()
        collectionView.reloadData()
    }

    func setProducts(_ products: [Product]) {
        self.products = products
        if collectionView != nil {
            collectionView.reloadData()
        }
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 10, height: 100)
        layout.minimumLineSpacing = 8

        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        layout.sectionFootersPinToVisibleBounds = true

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.backgroundColor = UIColor.UISetup.setupAnimatedBackground(for: collectionView)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")

        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            fatalError("Could not dequeue ProductCell")
        }
        let product = products[indexPath.row] 
        cell.configure(with: product)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        onProductSelected?(selectedProduct)
        navigationController?.popViewController(animated: true)
    }
}
