//
//  APIProvider.swift
//  pic2
//
//  Created by Alexander Batalov on 9/2/19.
//  Copyright © 2019 Alexander Batalov. All rights reserved.
//

import Foundation

enum APIProvider {
    case getPhotos(page: Int)
}

extension APIProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://picsum.photos/")!
    }

    var path: String {
        switch self {
        case .getPhotos:
            return "v2/list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getPhotos:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getPhotos(let page):
            return [ParameterKey.page : page]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var task: Task {
        return Task.requestParameters(parameters: parameters!, encoding: parameterEncoding)
    }

    var headers: [String : String]? {
        return nil
    }
}
