//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Apple Mac Air on 10.01.2023.
//

import UIKit

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
