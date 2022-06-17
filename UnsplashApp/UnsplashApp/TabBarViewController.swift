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
    }
    
    
    private func setViewControllers() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let randomPhotoVC = RandomPhotoListViewController(collectionViewLayout: layout)
        let favoritePhotoVC = FavoritePhotoViewController()
        
        setViewControllers([randomPhotoVC, favoritePhotoVC], animated: false)
    }
    

}
