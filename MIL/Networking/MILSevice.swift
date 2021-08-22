//
//  MILSevice.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/22.
//

import Foundation
import Moya

enum MILService {
    case getPosts
    case createPost(title: String, content: String, imagePath: String)
    case reportError(title: String, content: String)
}

extension MILService: TargetType {
    var baseURL: URL { return URL(string: "http://127.0.0.1:8000")! }

    var path: String {
        switch self {
        case .getPosts:
            return "/post"
        case .createPost:
            return "/post"
        case .reportError:
            return "/error-report"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getPosts:
            return .get
        case .createPost, .reportError:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getPosts:
            return .requestPlain
        case let .createPost(title, content, imagePath):
            return .requestParameters(parameters: ["title": title, "content": content, "imagePath": imagePath], encoding: JSONEncoding.default)
        case let .reportError(title, content):
            return .requestParameters(parameters: ["title": title, "content": content], encoding: JSONEncoding.default)
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    // HTTP code가 200에서 299사이인 경우 요청이 성공한 것으로 간주된다.
    public var validationType: ValidationType {
        return .successCodes
    }

}
