//
//  CheckerService.swift
//  Navigation
//
//  Created by Apple Mac Air on 22.12.2023.
//
import UIKit
import FirebaseAuth

struct FireBaseUser {
    let user: FirebaseAuth.User
}

class CheckService: CheckerServiceProtocol {
    
    func checkCredentials(email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            
            if let authResult = result {
                completion(.success(FireBaseUser(user: authResult.user)))
            }
        }
    }
    
    func signUp (email: String, password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
                
                if let error = error {
                   completion(.failure(error))
                    print (error.localizedDescription)
                }
                
                if let authResult = result {
                    if isValidEmail(email) == true {
                    completion(.success(FireBaseUser(user: authResult.user)))
                }
            }
        }
    }
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    }

