//
//  PhotosViewController.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 29.09.24.
//
import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var photos: [Photo] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView
            .register(
                StyleForLablePhoto.self,
                forCellReuseIdentifier: "PhotoCell"
            )
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        print("Photo Loaded")
        UISetup.setupAnimatedBackground(for: self.view)

        view.addSubview(tableView)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage() 
            navigationController?.navigationBar.isTranslucent = true

        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        loadPhotos()
    }

    private func loadPhotos() {
        let dataDownloader = DataToDownload()
        dataDownloader.loadPhotos { [weak self] photos in
            DispatchQueue.main.async {
                self?.photos = photos
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "PhotoCell",
            for: indexPath
        ) as! StyleForLablePhoto
        cell.backgroundColor = .clear
        
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title 
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectPhoto = photos[indexPath.row]
        let detailVC = PhotoDetailViewController()
        
        detailVC.photo = selectPhoto
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
