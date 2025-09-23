*** Variables ***
# mock locator
${LOGIN_PAGE.LOGIN_BUTTON}       xpath=//button[contains(., "Login") or contains(., "เข้าสู่ระบบ")]
${LOGIN_PAGE.EMAIL_INPUT}        xpath=//input[@name="email" or @type="email"]
${LOGIN_PAGE.PASSWORD_INPUT}     xpath=//input[@name="password" or @type="password"]
${LOGIN_PAGE.SUBMIT_BUTTON}      xpath=//button[@type="submit" or contains(., "Sign In") or contains(., "เข้าสู่ระบบ")]