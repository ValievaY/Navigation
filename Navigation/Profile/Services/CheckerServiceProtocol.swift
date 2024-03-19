//
//  CheckerServiceProtocol.swift
//  Navigation
//
//  Created by Apple Mac Air on 22.12.2023.
//

import Foundation

protocol CheckerServiceProtocol {
    
    func checkCredentials (email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void)
    
    func signUp (email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void)
}
