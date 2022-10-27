//
//  HomeViewModel.swift
//  UnsplashPhoto
//
//  Created by DiOS on 27.10.2022.
//

import UIKit

class HomeViewModel {
    var dataArray: [RandomPhotoModel] = []
    
    func getData(_ url: String) -> Data {
        guard let url = URL(string: url) else { return Data() }
        if let data = try? Data(contentsOf: url) {
            return data
        }
        return Data()
    }
    
    func createObj(with data: RandomPhotoModel) -> FavouritesPhoto? {
        if let urlImage = URL(string: data.urls.small),
           let urlAuthor = URL(string: data.user.profileImage.small) {
            if let dataImage = try? Data.init(contentsOf: urlImage), let dataAuthor = try? Data.init(contentsOf: urlAuthor) {
                return CoreDataManager.shared.createObject(UIImage(data: dataImage)!, authorImage: UIImage(data: dataAuthor)!, authorName: data.user.name, id: data.id, likes: data.likes, publicationDate: data.created_at)
            }
        }
        return nil
    }
    
}
