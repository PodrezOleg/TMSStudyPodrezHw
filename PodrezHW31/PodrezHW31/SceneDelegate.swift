//
//  SceneDelegate.swift
//  PodrezHW31
//
//  Created by Oleg Podrez on 27.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
  
        window = UIWindow(windowScene: windowScene)
        
        let navController = UINavigationController(rootViewController: TranslatorTableVC())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
    
    }
}
