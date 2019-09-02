//
//  PhotosResponseResult.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

enum PhotosResponseResult {
    case success(photos: [Photo])
    case failed(message: String)
}

struct Photo: Decodable {
    let id: String
    let author: String
    let url: String
    let downloadUrl: String
    
    private enum CodingKeys : String, CodingKey {
        case id, author, url, downloadUrl = "download_url"
    }
}

struct PhotosResponseModel: Decodable {
    let photos: [Photo]
}
