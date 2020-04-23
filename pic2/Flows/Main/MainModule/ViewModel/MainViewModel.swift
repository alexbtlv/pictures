//
//  MainViewModel.swift
//  pic2
//
//  Created by Alexander Batalov on 9/3/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

final class MainViewModel {
    
    // MARK: Private properties
    private let provider: MoyaProvider<APIProvider>
    private let disposeBag = DisposeBag()
    private var photos = [Photo]() {
        didSet {
            setupSections()
        }
    }
    
    // MARK: Public properties
    let page = BehaviorRelay<Int>(value: 1)
    let sections = BehaviorRelay<[MainSectionModel]>(value: [])
    let executing = BehaviorRelay(value: false)
    
    init(provider: MoyaProvider<APIProvider>) {
        self.provider = provider
        getPhotos()
    }
    
    private func getPhotos() {
        executing.accept(true)
        provider.request(.getPhotos(page: page.value)) { [weak self] (result) in
            self?.executing.accept(false)
            switch result {
            case.success(let response):
                if let photos = try? JSONDecoder().decode([Photo].self, from: response.data) {
                    self?.photos = photos
                }
            case .failure(let error):
                let title = R.string.localizable.photosListNetworkingErrorTitle()
                DefaultWireframe.shared.showAlert(title: title, message: error.errorDescription)
            }
        }
    }
    
    private func setupSections() {
        let items = photos.map { MainSectionItem.photo(cellViewModel: PhotoCellViewModel(photo: $0)) }
        sections.accept([.main(items: items)])
    }
}
