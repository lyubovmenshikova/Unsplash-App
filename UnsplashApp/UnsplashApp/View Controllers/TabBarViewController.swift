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
            appearance.backgroundColor = .systemBackground
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
    }
   
    private func setViewControllers() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)

        let randomPhotoVC =  RandomPhotoListViewController(collectionViewLayout: layout)
        let favoritePhotoVC = FavoritePhotoViewController()

        randomPhotoVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "photo"), selectedImage: UIImage(systemName: "photo.fill"))
        favoritePhotoVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        viewControllers = [randomPhotoVC, favoritePhotoVC]
    }

    

}
