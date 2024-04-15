//
//  LoginInspector.swift
//  Navigation
//
//  Created by Apple Mac Air on 09.01.2023.
//


struct LoginInspector: LoginViewControllerDelegate {
    
    let checkService = CheckService()
    
    func check(_ login: String, _ password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        
        checkService.checkCredentials(email: login, password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    func signUp (_ email: String, _ password: String, completion: @escaping (Result<FireBaseUser, Error>) -> Void) {
        checkService.signUp(email: email, password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
