//
//  UserNetwork.swift
//  Navigation
//
//  Created by Apple Mac Air on 12.12.2023.
//

import Foundation

final class UserNetwork {
    
    func request(completion: @escaping (String) -> Void) {
      guard let url = URL(string:
                        "https://jsonplaceholder.typicode.com/todos/8") else { return }
        
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
                        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                        guard let title = json ["title"] as? String else { return }
                        completion(title)
                    } catch {
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
