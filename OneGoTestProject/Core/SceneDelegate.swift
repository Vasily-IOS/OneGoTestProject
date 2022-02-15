//
//  SceneDelegate.swift
//  OneGoTestProject
//
//  Created by Василий on 15.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = TableViewController()
        window?.makeKeyAndVisible()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
    }

}

