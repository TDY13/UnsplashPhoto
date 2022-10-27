//
//  HomeNavigationController.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//


import UIKit

class HomeNavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 10)]
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundImage = UIImage()
            appearance.backgroundColor = .clear
            navigationBar.standardAppearance = appearance
            navigationBar.tintColor = .white
        } else {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        }
    }
    
    private func setup() {
        let homeViewController = HomeViewController()
        setUpTabBarItem()
        self.viewControllers = [homeViewController]
        isNavigationBarHidden = true
    }
    
    func setUpTabBarItem() {
        let tabBarItemIcon = UIImage(named: R.Images.home)
        let tabBarItem = UITabBarItem(title: R.String.home,
                                      image: tabBarItemIcon?.withRenderingMode(.alwaysOriginal),
                                      selectedImage: tabBarItemIcon?.withRenderingMode(.alwaysTemplate))
        self.tabBarItem = tabBarItem
    }
}
