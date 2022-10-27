//
//  SceneDelegate.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarController = MainTabBarController()
        let mainNavigationVC = MainNavigationController(nibName: nil, bundle: nil)
        mainNavigationVC.viewControllers = [tabBarController]
        mainNavigationVC.isNavigationBarHidden = true
        window?.rootViewController = mainNavigationVC
        window?.makeKeyAndVisible()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.

            // Save changes in the application's managed object context when the application transitions to the background.
            CoreDataManager.shared.saveContext()
        }
}

