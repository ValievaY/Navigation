//
//  UserService.swift
//  Navigation
//
//  Created by Apple Mac Air on 25.12.2022.
//

import Foundation

protocol UserService {
    func authorization (_ login: String) -> User?
}
