//
//  UsersToDownload.swift
//  PodrezHw29
//
//  Created by Oleg Podrez on 29.09.24.
//


import Foundation

class DataToDownload {
    enum APIHandler {
        static let users = "https://jsonplaceholder.typicode.com/users"
        static let photos = "https://jsonplaceholder.typicode.com/photos"
    }
    func loadUsers(completion: @escaping ([Users]) -> Void) {
        guard let urlUsers = URL(string: APIHandler.users) else { return }
        let request = URLRequest(url: urlUsers)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else { return }
            let decoder = JSONDecoder()
            guard let user: [Users]? = try? decoder.decode([Users].self, from: data)
            else { return }
            guard let user else { return }
            completion(user)
        }
        dataTask.resume()
    }
    
    func loadPhotos(completion: @escaping ([Photos]) -> Void) {
        guard let urlPhoto = URL(string: APIHandler.photos) else { return }
        let request = URLRequest(url: urlPhoto)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data else { return }
            let decoder = JSONDecoder()
            guard let photo: [Photos]? = try? decoder.decode([Photos].self, from: data)
            else { return }
            guard let photo else { return }
            completion(photo)
        }
        dataTask.resume()
    }
}
