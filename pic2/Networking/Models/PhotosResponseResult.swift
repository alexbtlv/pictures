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

struct PhotosResponseModel: Decodable {
    let photos: [Photo]
}
