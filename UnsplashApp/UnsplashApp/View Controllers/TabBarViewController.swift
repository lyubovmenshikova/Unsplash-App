//
//  TabBarViewController.swift
//  UnsplashApp
//
//  Created by Lyubov Menshikova on 09.06.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setUpTabBarAppearence()
    }
    
    private func setUpTabBarAppearence() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            
            //color for tabBar Icon
            appearance.stackedLayoutAppearance.normal.iconColor = .white
            appearance.stackedLayoutAppearance.selected.iconColor = .white
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
    }
   
    private func setViewControllers() {
        let randomPhotoVC =  RandomPhotosViewController()
        let favoritePhotoVC = FavoriteViewController()

        randomPhotoVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "photo"), selectedImage: UIImage(systemName: "photo.fill"))
        
        favoritePhotoVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        viewControllers = [randomPhotoVC, favoritePhotoVC]
    }

    

}
