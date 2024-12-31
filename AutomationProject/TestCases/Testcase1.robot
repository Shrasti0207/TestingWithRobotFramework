*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${EXPECTED_TITLE}  OrangeHRM

*** Test Cases ***
Verify Login Page Title
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Create WebDriver    Chrome    options=${options}
    Go To    ${BASE_URL}
    Title Should Start With    ${EXPECTED_TITLE}
    Close Browser

*** Keywords ***
Title Should Start With
    [Arguments]    ${expected}
    ${title}=    Get Title
    Should Start With    ${title}    ${expected}

