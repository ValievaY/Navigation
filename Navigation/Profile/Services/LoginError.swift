//
//  LoginError.swift
//  Navigation
//
//  Created by Apple Mac Air on 20.03.2023.
//

import Foundation

enum LoginError: Error {
    case invalidAuthorisation
    case notFound
    case unexpected(code: Int)
}

extension LoginError {
    public var errorDescription: String {
        switch self {
        case .invalidAuthorisation:
            return "Неверное имя пользователя или пароль"
        case .notFound:
            return "Пользователь не найден"
        case .unexpected(_):
            return "Непредвиденная ошибка"
        }
    }
}
