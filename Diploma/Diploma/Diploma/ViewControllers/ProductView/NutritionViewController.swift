//
//  NitritionViewController.swift
//  Diploma
//
//  Created by Oleg Podrez on 14.12.2024.
//


import UIKit

class NutritionViewController: UIViewController {
    private let viewModel = NutritionViewModel()
    private let searchField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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

        view.addSubview(searchField)
        view.addSubview(searchButton)
        view.addSubview(resultLabel)

        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            resultLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupBindings() {
        viewModel.onDataFetched = { [weak self] products in
            self?.displayProductInfo(products)
        }

        viewModel.onError = { [weak self] error in
            self?.displayError(error)
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
        resultLabel.text = """
        Название: \(product.productName ?? "Неизвестно")
        Белки (на 100г): \(nutriments?.proteins ?? 0) г
        Жиры (на 100г): \(nutriments?.fat ?? 0) г
        Углеводы (на 100г): \(nutriments?.carbohydrates ?? 0) г
        Индекс полезности: \(product.nutriscoreGrade ?? "Неизвестен")
        """
    }

    private func displayError(_ error: Error) {
        resultLabel.text = "Ошибка: \(error.localizedDescription)"
    }
}
