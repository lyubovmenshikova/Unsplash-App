//
//  PhotosModel.swift
//  UnsplashApp
//
//  Created by Lyubov Menshikova on 24.06.2022.
//

import Foundation

struct PhotosModel: Decodable {
    let id: String?
    let urls: Urls
}

struct Urls: Decodable {
    let raw: String?
}
