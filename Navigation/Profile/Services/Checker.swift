//
//  Checker.swift
//  Navigation
//
//  Created by Apple Mac Air on 09.01.2023.
//

import UIKit

final class Checker {
    
    static let shared = Checker()
    private init() {
        login = "0000"
        password = "1234"
    }
    
    private let login: String
    private let password: String
    
    func check(_ userLogin: String, _ userPassword: String) -> Bool {
      return userLogin == login && userPassword == password
    }
}
