//
//  LocalAuthorizationService.swift
//  Navigation
//
//  Created by Apple Mac Air on 01.05.2024.
//

import Foundation
import LocalAuthentication

enum BiometricType {
    case none
    case touchID
    case faceID
    case unknown
}

enum BiometricError: LocalizedError {
    case authenticationFailed
    case biometryNotAvailable
    case biometryNotEnrolled
    case biometryLockout
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .authenticationFailed:
            return "There was a problem verifying your identity."
        case .biometryNotAvailable:
            return "Face ID/Touch ID is not available."
        case .biometryNotEnrolled:
            return "Face ID/Touch ID is not set up."
        case .biometryLockout:
            return "Face ID/Touch ID is locked."
        case .unknown:
            return "Face ID/Touch ID may not be configured"
        }
    }
}

class LocalAuthorizationService {
    
    private let context = LAContext()
    private var error: NSError?
    
    var biometricType: BiometricType {
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        
        switch context.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        @unknown default:
            return .unknown
        }
    }
    
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool, BiometricError?) -> Void) {
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "verify identity") { [weak self] success, error in
                
                DispatchQueue.main.async {
                    if success {
                        authorizationFinished (true, nil)
                    } else {
                        authorizationFinished (false, self?.biometricError(from: error! as NSError))
                    }
                }
            }
        } else {
            authorizationFinished (false, self.biometricError(from: error! as NSError))
        }
    }
    
    private func biometricError(from nsError: NSError) -> BiometricError {
        let error: BiometricError
        
        switch nsError {
        case LAError.authenticationFailed:
            error = .authenticationFailed
        case LAError.biometryNotAvailable:
            error = .biometryNotAvailable
        case LAError.biometryNotEnrolled:
            error = .biometryNotEnrolled
        case LAError.biometryLockout:
            error = .biometryLockout
        default:
            error = .unknown
        }
        
        return error
    }
}
