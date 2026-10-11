import Foundation

struct EasyBankConstants {
    static let defaultTimeout: TimeInterval = 10.0
    
    struct TestData {
        static let invalidEmail = "invalid-email"
        static let unregisteredEmail = "notregistered@example.com"
        static let validPassword = "SecurePass123!"
        static let wrongPassword = "WrongPass123!"
    }
    
    struct ErrorMessages {
        static let badlyFormattedEmail = "badly formatted"
        static let invalidCredentials = "malformed or has expired"
    }
}