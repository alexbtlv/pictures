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

extension PhotosResponseResult: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case success
        case failed
    }
    
    enum PhotosTypeCodingError: Error {
        case decoding(String)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? values.decode([Photo].self, forKey: .success) {
            self = .success(photos: value)
            return
        }
        if let msg = try? values.decode(String.self, forKey: .failed) {
            self = .failed(message: msg)
            return
        }
        throw PhotosTypeCodingError.decoding("Whoops! \(dump(values))")
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .success(let photos):
            try container.encode(photos, forKey: .success)
        case .failed(let msg):
            try container.encode(msg, forKey: .failed)
        }
    }
}
