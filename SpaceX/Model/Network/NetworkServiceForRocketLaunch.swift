//
//  NetworkServiceForRocketLaunch.swift
//  SpaceX
//
//  Created by Мария Филиппова on 14.04.2022.
//

import Foundation

class NetworkServiceForRocketLaunch {

    func request(completion: @escaping (Result<[ModelLaunch.Launch], Error>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/launches"
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
                    let launches = try decoder.decode([ModelLaunch.Launch].self, from: data)
                    completion(.success(launches))
                } catch let jsonError {
                    print(jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}

