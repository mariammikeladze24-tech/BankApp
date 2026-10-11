func register(email: String, pass: String) {
    XCTAssertTrue(page.regEmailField.waitForExistence(timeout: timeout))
    page.regEmailField.tap()
    page.regEmailField.typeText(email)
    
    let closePrompt = page.app.buttons["Close"]
    if closePrompt.waitForExistence(timeout: 2.0) { closePrompt.tap() }
    
    page.regPasswordField.tap()
    page.regPasswordField.typeText(pass)
    
    page.regRepeatPasswordField.tap()
    page.regRepeatPasswordField.typeText(pass)
    
   
    if page.app.keyboards.element.exists { 
        page.app.swipeDown() 
    }
    
    XCTAssertTrue(page.regSubmitButton.isHittable, "Register button is blocked by the keyboard")
    page.regSubmitButton.tap()
}