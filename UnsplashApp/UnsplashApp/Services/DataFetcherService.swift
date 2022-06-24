//
//  DataFetcherService.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 18.05.2022.
//

import Foundation

private let apiKey = "HFuUjvvZzUoOEVCA3RY0djTxp_Q8JKpCr3p-9kFlqk8"
 
class DataFetcherService {
    
    var dataFetcher: DataFetcher!
    static let sharedInstance = DataFetcherService()
    
    private init(dataFetcher: DataFetcher = NetworkDataFetcher()){
        self.dataFetcher = dataFetcher
    }
    
    func fetchPhotos (completion: @escaping ([PhotosModel]?) -> Void) {
        let urlPhotos = "https://api.unsplash.com/photos/?client_id=\(apiKey)"
        dataFetcher.fetchGenericJSONData(urlString: urlPhotos, response: completion)
    }
    
}
