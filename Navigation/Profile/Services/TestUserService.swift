//
//  TestUserService.swift
//  Navigation
//
//  Created by Apple Mac Air on 29.12.2022.
//

import UIKit

class TestUserService: UserService {
    
    var user = User.init(login: "0000", name: "User Name", avatar: UIImage(named: "a") ?? .add, status: "something")
    
    func authorization(_ login: String) -> User? {
        return login == user.login ? user : nil
    }
}
