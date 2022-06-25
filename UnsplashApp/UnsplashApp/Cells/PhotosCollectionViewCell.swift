//
//  PhotosCollectionViewCell.swift
//  UnsplashApp
//
//  Created by Lyubov Menshikova on 24.06.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with photosModel: PhotosModel) {
        DispatchQueue.global().async {
            guard let data = ImageManager.shared.fetchImageData(from: photosModel.urls.small) else { return }
            DispatchQueue.main.async {
                self.photoImage.image = UIImage(data: data)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImage.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 10)
    }
    
}
