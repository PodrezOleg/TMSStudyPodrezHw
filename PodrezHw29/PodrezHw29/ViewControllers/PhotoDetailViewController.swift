//
//  PhotoDetailViewController.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 30.09.24.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?

    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let urlLabel = UILabel()
    private let thumbnailURLLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: self.view)
        setupUI()
        displayPhotoDetails()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(urlLabel)
        view.addSubview(thumbnailURLLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        thumbnailURLLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 0
        urlLabel.numberOfLines = 0
        thumbnailURLLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200), 
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            urlLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            urlLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            urlLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            urlLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            thumbnailURLLabel.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 20),
            thumbnailURLLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thumbnailURLLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            thumbnailURLLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func displayPhotoDetails() {
        guard let photo = photo else { return }
        titleLabel.text = "Title: \(photo.title)"
        
        if let url = URL(string: photo.url) {
            loadImage(from: url)
        }
        
        urlLabel.text = "Image URL: \(photo.url)"
        thumbnailURLLabel.text = "Thumbnail URL: \(photo.thumbnailURL)"
    }
    
    private func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        task.resume()
    }
}
