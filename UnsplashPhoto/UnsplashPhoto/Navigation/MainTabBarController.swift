//
//  MainTabBarController.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    let homeNavigationController = HomeNavigationController(nibName: nil, bundle: nil)
    let favouriteNavigationController = FavouritesNavigationController(nibName: nil, bundle: nil)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeNavigationController, favouriteNavigationController]
        tabBar.tintColor = UIColor(named: R.Color.dark)
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        selectedIndex = 0
        
        homeNavigationController.setUpTabBarItem()
        favouriteNavigationController.setUpTabBarItem()
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
}
