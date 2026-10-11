import XCTest

class EasyBankPage {
    let app = XCUIApplication()
    
    var onboardingLoginButton: XCUIElement { app.buttons["onboarding.login"] }
    var onboardingRegisterButton: XCUIElement { app.buttons["onboarding.register"] }
    
    var loginEmailField: XCUIElement { app.textFields["login.email"] }
    var loginPasswordField: XCUIElement { app.secureTextFields["login.password"] }
    var loginSubmitButton: XCUIElement { app.buttons["login.submit"] }
    var loginErrorLabel: XCUIElement { app.staticTexts["login.error"] }
    
    var regEmailField: XCUIElement { app.textFields["registration.email"] }
    var regPasswordField: XCUIElement { app.secureTextFields["registration.password"] }
    var regRepeatPasswordField: XCUIElement { app.secureTextFields["registration.repeatPassword"] }
    var regSubmitButton: XCUIElement { app.buttons["registration.submit"] }
    
    
    var homeTab: XCUIElement { app.tabBars.buttons["Home"] }
    var logoutIcon: XCUIElement { app.buttons["home.logout"] }
    var logoutConfirmYes: XCUIElement { app.alerts.buttons["Yes"] }
}