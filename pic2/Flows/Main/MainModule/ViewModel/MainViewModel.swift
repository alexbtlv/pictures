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
    private let activityIndicator = ActivityIndicator()
    private let disposeBag = DisposeBag()
    
    // MARK: Public properties
    let page = BehaviorRelay<Int>(value: 1)
    
    init(provider: MoyaProvider<APIProvider>) {
        self.provider = provider
        getPhotos()
    }
    
    private func getPhotos() {
        let request = photosRequestObservable()
        request.subscribe(onNext: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                print("SUCCESS", photos)
            case .failed(let message):
                print("FAILED TO GET PHOTOS",message)
            }
        }).disposed(by: disposeBag)
    }
    
    private func photosRequestObservable() -> Observable<PhotosResponseResult> {
        return provider.rx.request(.getPhotos(page: page.value))
            .retry(3)
            .trackActivity(activityIndicator)
            .filterSuccessfulStatusCodes()
            .map([Photo].self, using: JSONDecoder(), failsOnEmptyData: true)
            .map { pics in
                return PhotosResponseResult.success(photos: pics)
            }.asObservable()
    }
}
