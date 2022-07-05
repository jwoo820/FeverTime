//
//  SceneDelegate.swift
//  FeverTime
//
//  Created by Park Jungwoo on 2022/07/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = TabBarController()
        window?.backgroundColor = .systemBackground
        window?.tintColor = .black
        window?.makeKeyAndVisible()
    
    }
}

