//
//  Photo.swift
//  pic2
//
//  Created by Alexander Batalov on 11/17/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

struct Photo: Decodable {
    let id: String
    let author: String
    let url: String
    let downloadUrl: String
    
    private enum CodingKeys : String, CodingKey {
        case id, author, url, downloadUrl = "download_url"
    }
}
