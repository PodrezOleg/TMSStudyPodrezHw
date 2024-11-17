//
//  TabBarFactoryforController.swift
//  PodrezHW35
//
//  Created by Oleg Podrez on 18.11.24.
//

import UIKit

class TabBarFactoryForController {
    static func build() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let mvpViewController = MVPViewController()
        mvpViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("MVP", comment: ""),
            image: nil,
            tag: 0
        )
        
        let vipViewController = VIPViewController()
        vipViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("VIP", comment: ""),
            image: nil,
            tag: 1
        )
        
        let mvvmViewController = MVVMViewController()
        mvvmViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("MVVM", comment: ""),
            image: nil,
            tag: 2
        )
        
        tabBarController.viewControllers = [mvpViewController, vipViewController, mvvmViewController]
        tabBarController.tabBar.backgroundColor = .systemFill
        
        return tabBarController
    }
}
