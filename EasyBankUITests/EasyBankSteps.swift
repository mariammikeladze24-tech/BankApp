import XCTest

class EasyBankSteps {
    let page = EasyBankPage()
    let timeout: TimeInterval = EasyBankConstants.defaultTimeout
    
    func navigateToLogin() {
        XCTAssertTrue(page.onboardingLoginButton.waitForExistence(timeout: timeout))
        page.onboardingLoginButton.tap()
    }
    
    func navigateToRegister() {
        XCTAssertTrue(page.onboardingRegisterButton.waitForExistence(timeout: timeout))
        page.onboardingRegisterButton.tap()
    }
    
    func login(email: String, pass: String) {
        XCTAssertTrue(page.loginEmailField.waitForExistence(timeout: timeout))
        page.loginEmailField.tap()
        page.loginEmailField.typeText(email)
        
        page.loginPasswordField.tap()
        page.loginPasswordField.typeText(pass)
        
        if page.app.keyboards.element.exists { 
            page.app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.05)).tap()
        }
        page.loginSubmitButton.tap()
    }
    
    func register(email: String, pass: String) {
        XCTAssertTrue(page.regEmailField.waitForExistence(timeout: timeout))
        page.regEmailField.tap()
        page.regEmailField.typeText(email)
        
        page.regPasswordField.tap()
        
        let closePrompt = page.app.buttons["Close"]
        if closePrompt.waitForExistence(timeout: 2.0) { 
            closePrompt.tap() 
            page.regPasswordField.tap() // Re-focus the field just in case
        }
        
        page.regPasswordField.typeText(pass)
        
        page.regRepeatPasswordField.tap()
        page.regRepeatPasswordField.typeText(pass)
        
        if page.app.keyboards.element.exists { 
            page.app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.05)).tap()
        }
        
        XCTAssertTrue(page.regSubmitButton.waitForExistence(timeout: timeout))
        page.regSubmitButton.tap()
    }
    
    func verifyLoginError(contains text: String) {
        XCTAssertTrue(page.loginErrorLabel.waitForExistence(timeout: timeout))
        XCTAssertTrue(page.loginErrorLabel.label.contains(text))
    }
    
    func verifyMainScreen() {
        XCTAssertTrue(page.homeTab.waitForExistence(timeout: timeout))
    }
    
    func logout() {
        XCTAssertTrue(page.logoutIcon.waitForExistence(timeout: timeout))
        page.logoutIcon.tap()
        XCTAssertTrue(page.logoutConfirmYes.waitForExistence(timeout: timeout))
        page.logoutConfirmYes.tap()
    }
}