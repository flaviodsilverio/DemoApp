//
//  RequestClient.swift
//  RequestClient
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation

class RequestClient<T> where T: Decodable  {

    var basePath: String
    let requestManager: RequestManager
    let parser: Parser

    init(path basePath: String = Constants.Strings.baseURLPath,
        with type: String,
        requestManager rManager: RequestManager = RequestManager(),
        dataParser parser: Parser = Parser()) {
        self.basePath = basePath + type
            self.requestManager = rManager
            self.parser = parser
    }

    typealias requestCompletion = ((Result<T, Error>) -> ())?

    func fetchAll(_ completion: requestCompletion) {
        fetch(completion: completion)
    }

    func fetchItem(with path: String, _ completion: requestCompletion) {
        fetch(appending: path, completion: completion)
    }

    private func fetch(appending string: String? = nil, completion: requestCompletion) {

        let requestPath = basePath + (string  ?? "")
        requestManager.perform(requestWith: requestPath) { result in
            switch result {
            case .success(let data):
                guard let parsedData = self.parser.parse(data, ofType: T.self) else {
                    completion?(.failure(ParserError.unknown))
                    return
                }

                completion?(.success(parsedData))

                break
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}


