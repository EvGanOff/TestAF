//
//  NetworkManager.swift
//  TestAF
//
//  Created by Евгений Ганусенко on 5/13/22.
//

import UIKit
import Alamofire

class NetworkManager: NetworkManagerProtocol {
    let decoder = JSONDecoder()
    let configuration = URLConfiration()

    init() {}

    func getHerousFromURL(completion: @escaping (Result<[MarvelCharacter], AFErrors>) -> ()) {
        AF.request(configuration.getURL(), method: .get).response { response in
            guard let data = response.data else { return }
            do {
                let result = try self.decoder.decode(MarvelResponse.self, from: data)
                completion(.success(result.data.results))
            } catch {
                completion(.failure(.invalidData))
            }
        }
    }
}

