//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Apple Mac Air on 25.12.2022.
//

import UIKit

class CurrentUserService: UserService {
    
    var user = User.init(login: "1234", name: "Yulia Valieva", avatar: UIImage(named: "fox") ?? .add, status: "waiting for something")
    
    func authorization(_ login: String) -> User? {
        return login == user.login ? user : nil
    }
}
