//
//  NetworkService.swift
//  SpaceX
//
//  Created by Мария Филиппова on 14.04.2022.
//

import Foundation

class NetworkService {

    func request(completion: @escaping (Result<[Model.RocketModel], Error>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    let rockets = try decoder.decode([Model.RocketModel].self, from: data)
                    completion(.success(rockets))
                } catch let jsonError {
                    print(jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
