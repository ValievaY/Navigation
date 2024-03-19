
import Foundation

struct NetworkService {
    
    static func request(for configuration: AppConfiguration) {
        var url: URL
        
        switch configuration {
        case .one(let planets):
            url = URL(string: planets)!
        case .two(let films):
            url = URL(string: films)!
        case .three(let species):
            url = URL(string:species)!
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
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
                    print ("data: \(data)")
                case 404:
                    print("error")
                default:
                    break
                }
                print (HTTPResponse.statusCode)
                print (HTTPResponse.allHeaderFields)
            }
        }
        dataTask.resume()
    }
}
