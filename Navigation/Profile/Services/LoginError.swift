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
            return ~"invalidAuthorisation"
        case .notFound:
            return ~"notFound"
        case .unexpected(_):
            return ~"unexpected"
        }
    }
}
