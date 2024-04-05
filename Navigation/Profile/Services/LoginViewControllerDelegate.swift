//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Apple Mac Air on 09.01.2023.
//

import UIKit

protocol LoginViewControllerDelegate {
    func check (_ login: String, _ password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void)
   
    func signUp (_ email: String, _ password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void)
}
