//
//  PhotoCellViewModel.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class PhotoCellViewModel {
    
    let imageSource: URL?
    
    init(photo: Photo) {
        self.imageSource =  URL(string: photo.downloadUrl)
    }
}
