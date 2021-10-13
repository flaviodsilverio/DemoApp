//
//  RequestManager.swift
//  RequestManager
//
//  Created by Flávio Silvério on 13/10/2021.
//

import Foundation

enum RequestManagerError: Error {
    case invalidURL
    case invalidResponse
    case invalidJSON
    case unknownError
    case dataError
}

class RequestManager {
    let session: URLSession

    init(with session: URLSession = .shared) {
        self.session = session
    }

    func perform<T: Decodable>(
        requestWith urlString: String,
        responseType type: T.Type,
        _ completion: ((Result<T, Error>)->())?) {

        guard let url = URL(string: urlString) else {
            completion?(.failure(RequestManagerError.invalidURL))
            return
        }

        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion?(.failure(error ?? RequestManagerError.unknownError))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion?(.failure(RequestManagerError.invalidResponse))
                return
            }

            switch response.statusCode {
            case 200...300:

                guard let data = data else {
                    completion?(.failure(RequestManagerError.dataError))
                    return
                }

                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion?(.success(object))

                } catch {
                    debugPrint(error)
                }


            default:
                completion?(.failure(RequestManagerError.invalidResponse))
            }

        }.resume()
    }
}
