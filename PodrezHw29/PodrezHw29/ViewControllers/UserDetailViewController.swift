//
//  UserDetailViewController.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 30.09.24.
//
import UIKit

class UserDetailViewController: UIViewController {
    
    var user: Users?

    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    private let addressLabel = UILabel()
    private let companyLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup.setupAnimatedBackground(for: self.view)
        setupUI()
        displayUserDetails()
    }
    
    private func setupUI() {

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.numberOfLines = 0
           usernameLabel.numberOfLines = 0
           emailLabel.numberOfLines = 0
           phoneLabel.numberOfLines = 0
           websiteLabel.numberOfLines = 0
           addressLabel.numberOfLines = 0
           companyLabel.numberOfLines = 0
        
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneLabel)
        view.addSubview(websiteLabel)
        view.addSubview(addressLabel)
        view.addSubview(companyLabel)
        
        let horizontalPadding: CGFloat = 20 

         NSLayoutConstraint.activate([
             nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
             nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
             
             usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
             usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),

             emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
             emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),

             phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
             phoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),

             websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
             websiteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             websiteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),

             addressLabel.topAnchor.constraint(equalTo: websiteLabel.bottomAnchor, constant: 20),
             addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),

             companyLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
             companyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
             companyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
         ])
     }
    
    private func displayUserDetails() {
        guard let user = user else { return }
        
        nameLabel.text = "Name: \(user.name)"
        usernameLabel.text = "Username: \(user.username)"
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "Website: \(user.website)"
        
        let address = "Address: \(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
        addressLabel.text = address
        
        let company = "Company: \(user.company.name) - \(user.company.catchPhrase)"
        companyLabel.text = company
    }
}
