//
//  RandomPhotosViewController.swift
//  UnsplashApp
//
//  Created by Lyubov Menshikova on 24.06.2022.
//

import UIKit

class RandomPhotosViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    var photos: [PhotosModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        getPhotos()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 6, height: (view.frame.size.height/4) - 15)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        
        collectionView.frame = view.bounds
    }
    
    private func getPhotos() {
        DataFetcherService.sharedInstance.fetchPhotos { photosModel in
            guard let photosModel = photosModel else { return }
            self.photos = photosModel
            self.collectionView.reloadData()
        }
    }
    

}

extension RandomPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        guard let photo = photos?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(with: photo)
        return cell
    }
    
    
    
    
    
}
