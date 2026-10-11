import XCTest

class BankingFlowTests: BaseClass {
    let steps = EasyBankSteps()
    
    func testInvalidEmailFormat() {
        steps.navigateToLogin()
        steps.login(email: EasyBankConstants.TestData.invalidEmail, pass: EasyBankConstants.TestData.validPassword)
        steps.verifyLoginError(contains: EasyBankConstants.ErrorMessages.badlyFormattedEmail)
    }
    
    func testInvalidLoginCredentials() {
        steps.navigateToLogin()
        steps.login(email: EasyBankConstants.TestData.unregisteredEmail, pass: EasyBankConstants.TestData.wrongPassword)
        steps.verifyLoginError(contains: EasyBankConstants.ErrorMessages.invalidCredentials)
    }
    
    func testRegisterLogoutLogin() {
        let uniqueEmail = "user_\(UUID().uuidString.prefix(6))@example.com"
        let pass = EasyBankConstants.TestData.validPassword
        
        steps.navigateToRegister()
        steps.register(email: uniqueEmail, pass: pass)
        
        steps.verifyMainScreen()
        steps.logout()
        
        steps.login(email: uniqueEmail, pass: pass)
        steps.verifyMainScreen()
    }
}