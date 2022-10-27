//
//  MainNavigationController.swift
//  UnsplashPhoto
//
//  Created by DiOS on 22.10.2022.
//

import UIKit

class MainNavigationController: UINavigationController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
           self.modalPresentationStyle = .fullScreen
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           navigationBar.isTranslucent = true
           isNavigationBarHidden = true
           
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
}
