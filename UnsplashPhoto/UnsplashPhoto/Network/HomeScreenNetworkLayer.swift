//
//  HomeScreenNetworkLayer.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//

import Foundation

class HomeScreenNetworkLayer {
    
    static let shared = HomeScreenNetworkLayer()
    
    private init() {}
    
    func getRandomPhotos(_ completion: @escaping([RandomPhotoModel]) -> Void) {
        let accessToken = ""
        let urlStr = "https://api.unsplash.com/photos/?client_id=\(accessToken)"
        guard let url = URL(string: urlStr) else { return }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let myData = data else { return }
            do {
                let result = try JSONDecoder().decode([RandomPhotoModel].self, from: myData)
                completion(result)
                print(result)
            } catch {
               print("❌")
            }

        }
        session.resume()
    }
    
    func fingPhotoBy(name: String, completion: @escaping(FindPhoto) -> Void) {
        let accessToken = ""
        let urlStr = "https://api.unsplash.com/search/photos?page=1&query=\(name)&client_id=\(accessToken)"
        guard let url = URL(string: urlStr) else { return }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let myData = data else { return }
            do {
                let result = try JSONDecoder().decode(FindPhoto.self, from: myData)
                completion(result)
                print(result)
            } catch {
               print("❌")
            }

        }
        session.resume()
    }
}
