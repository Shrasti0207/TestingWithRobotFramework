*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${EXPECTED_TITLE}  OrangeHRM

*** Test Cases ***
Verify Login Page Title
# Test case to verify the title of the login page.
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create WebDriver    Chrome    options=${options}
    Go To    ${BASE_URL}
    Title Should Start With    ${EXPECTED_TITLE}
    Close Browser

*** Keywords ***
# Keyword to check if the page title starts with the expected text.
Title Should Start With
    [Arguments]    ${expected}
    ${title}=    Get Title
    Should Start With    ${title}    ${expected}

