//
//  ApplicationRepository.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/22.
//

import Foundation
import Moya

class ApplicationRepository {
    typealias Handler = (Result<Void, Error>) -> Void
    
    //    func get(complecationHandler: () -> ()) {
    //           let provider = MoyaProvider<PostService>()
    //           provider.request(.getPosts) { result in
    //               switch result {
    //               case let .success(moyaResponse):
    //                   do {
    //                       let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
    //                       let posts = try filteredResponse.map([Post].self)
    ////                       self.posts = posts
    ////                       self.objectWillChange.send()
    //                   } catch let error {
    //                        print("Error: \(error)")
    //                   }
    //               case let .failure(error):
    //                   print("Error: \(error)")
    //               }
    //           }
    //       }
    func report(title: String, content: String, completionHandler: @escaping Handler) {
        let provider = MoyaProvider<MILService>()
        provider.request(.reportError(title: title, content: content)) { result in
            switch result {
            case .success:
                completionHandler(.success(()))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
