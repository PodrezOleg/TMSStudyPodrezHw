//
//  NitritionViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.
//


import UIKit
import CoreData

class NutritionViewController: UIViewController {
    var onProductSelected: ((Product) -> Void)?
    private let viewModel = NutritionViewModel()
    private let searchField = UITextField()
    private let searchButton = CustomButton()
    private let resultLabel = UILabel()
    private let productImageView = UIImageView()
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupKeyboardHandling()
        setupBindings()
    }
    private func setupUI() {
        UISetup.setupAnimatedBackground(for: view)
        title = "Поиск Продукта"

        searchField.placeholder = "Введите название продукта"
        searchField.borderStyle = .roundedRect
        searchField.translatesAutoresizingMaskIntoConstraints = false

        searchButton.setTitle("Поиск", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)

        resultLabel.numberOfLines = 0
        resultLabel.translatesAutoresizingMaskIntoConstraints = false

        productImageView.contentMode = .scaleAspectFit
        productImageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(searchField)
        view.addSubview(searchButton)
        view.addSubview(resultLabel)
        view.addSubview(productImageView)
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.welcomeViewBetweenElements),

            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements / 2),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            resultLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.welcomeViewBetweenElements),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.welcomeViewBetweenElements),

            productImageView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: LayoutConstants.welcomeViewBetweenElements / 2),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            productImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func setupBindings() {
        viewModel.onDataFetched = { [weak self] products in
            self?.displayProductInfo(products)
        }
    }

    @objc private func searchTapped() {
        guard let text = searchField.text, !text.isEmpty else { return }
        
        Task {
            await viewModel.searchProduct(named: text)
        }
    }

    private func displayProductInfo(_ products: [Product]) {
        guard !products.isEmpty else {
            resultLabel.text = "Продукты не найдены"
            productImageView.image = nil
            return
        }

        let productListVC = ProductListViewController()
        productListVC.setProducts(products)
        productListVC.onProductSelected = { [weak self] selectedProduct in
            self?.showProductDetails(selectedProduct)
        }
        navigationController?.pushViewController(productListVC, animated: true)
    }

    private func showProductDetails(_ product: Product) {
        let nutriments = product.nutriments
        onProductSelected?(product) // Передача продукта
        navigationController?.popViewController(animated: true)
    }
}
