
import Foundation

enum AppConfiguration: CaseIterable {
    
    case one (String)
    case two (String)
    case three (String)
    
    static var allCases: [AppConfiguration] {
        return [.one("https://swapi.dev/api/planets/"), .two("https://swapi.dev/api/films/"), .three("https://swapi.dev/api/species/")]
    }
}
