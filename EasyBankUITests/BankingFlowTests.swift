import XCTest

class BankingFlowTests: BaseClass {
    let steps = EasyBankSteps()
    
    func testInvalidEmailFormat() {
        steps.navigateToLogin()
        steps.login(email: "invalid-email", pass: "AnyPass123!")
        steps.verifyLoginError(contains: "badly formatted")
    }
    
    func testInvalidLoginCredentials() {
        steps.navigateToLogin()
        steps.login(email: "notregistered@example.com", pass: "WrongPass123!")
        steps.verifyLoginError(contains: "malformed or has expired")
    }
    
    func testRegisterLogoutLogin() {
        let uniqueEmail = "user_\(UUID().uuidString.prefix(6))@example.com"
        let pass = "SecurePass123!"
        
        steps.navigateToRegister()
        steps.register(email: uniqueEmail, pass: pass)
        
        steps.verifyMainScreen()
        steps.logout()
        
        steps.login(email: uniqueEmail, pass: pass)
        steps.verifyMainScreen()
    }
}