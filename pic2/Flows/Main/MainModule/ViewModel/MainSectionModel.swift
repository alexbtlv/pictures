//
//  MainSectionModel.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

enum MainSectionModel {
    case main(items: [MainSectionItem])
}

enum MainSectionItem {
    case photo(cellViewModel: PhotoCellViewModel)
}

extension MainSectionModel: SectionModelType {
    typealias Item = MainSectionItem
    
    var items: [MainSectionItem] {
        switch self {
        case .main(let items):
            return items
        }
    }
    
    init(original: MainSectionModel, items: [MainSectionItem]) {
        switch original {
        case .main(let items):
            self = .main(items: items)
        }
    }
}
