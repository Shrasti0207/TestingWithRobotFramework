# *** Settings ***
# Library  SeleniumLibrary

# *** Variables ***
# ${browser}  Chrome
# ${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
# ${username}     Admin
# ${password}    admin123

# *** Test Cases ***
# LoginTest
#     Create WebDriver    ${browser}
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Wait Until Element Is Visible    css:input[name="username"]    timeout=10s
#     Input Text    css:input[name="username"]    ${username}
#     Input Text    css:input[name="password"]    ${password}
#     Wait Until Element Is Visible   css:button[type="submit"]   timeout=10s
#     Click Element    css:button[type="submit"]
#     Title Should Be     OrangeHRM
#     Wait Until Element Is Visible   css:span.oxd-userdropdown-tab   timeout=10s
#     Element Should Be Visible   css:span.oxd-userdropdown-tab
#     Close Browser


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
