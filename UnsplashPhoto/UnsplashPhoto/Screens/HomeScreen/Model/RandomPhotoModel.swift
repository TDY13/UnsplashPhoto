//
//  RandomPhotoModel.swift
//  UnsplashPhoto
//
//  Created by DiOS on 23.10.2022.
//

import Foundation
// Get random photos
struct RandomPhotoModel: Decodable {
    let id: String
    let created_at: String
    let likes: Int
    let urls: PhotoModel
    let user: UserModel
    let width: Int
    let height: Int
}

struct PhotoModel: Decodable {
    let small: String
    let smallS3: String
    let thumb: String
    
    enum CodingKeys: String, CodingKey {
        case small
        case smallS3 = "small_s3"
        case thumb
    }
}

struct UserModel: Decodable {
    let name: String
    let profileImage: ProfileImageModel
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImage = "profile_image"
    }
}

struct ProfileImageModel: Decodable {
    let small: String
}
// Find photo
struct FindPhoto: Decodable {
    let results: [RandomPhotoModel]
}

