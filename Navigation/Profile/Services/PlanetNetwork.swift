//
//  PlanetNetwork.swift
//  Navigation
//
//  Created by Apple Mac Air on 13.12.2023.
//

import Foundation

final class PlanetNetwork {
    
    func request (completion: @escaping (Result<PlanetModel, Error>) -> Void) {
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else { return }
        let request = URLRequest(url: url)
        let session  = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let HTTPResponse = response as? HTTPURLResponse {
                switch HTTPResponse.statusCode {
                case 200:
                    guard let data = data else {
                        return
                    }
                    do {
                        let planet = try JSONDecoder().decode(PlanetModel.self, from: data)
                        completion(.success(planet))
                    } catch {
                        completion(.failure(error))
                        print (error.localizedDescription)
                    }
                case 404:
                    print("error")
                default:
                    break
                }
            }
        }
        dataTask.resume()
    }
}
