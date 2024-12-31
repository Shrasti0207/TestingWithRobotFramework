*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${EXPECTED_TITLE}   OrangeHRM

*** Test Cases ***
Verify Login Page Title
    Open Login Page
    Title Should Start With    ${EXPECTED_TITLE}
    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css:input[name="username"]    timeout=10s

Title Should Start With
    [Arguments]    ${expected}
    ${title}=    Get Title
    Should Start With    ${title}    ${expected}
