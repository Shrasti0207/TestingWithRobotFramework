# Importing SeleniumLibrary to use browser automation keywords
*** Settings ***
Library  SeleniumLibrary

# Defining variables for browser type and application URL
*** Variables ***
${browser}  Chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

# Test Case to validate login functionality
*** Test Cases ***
LoginTest
    Given Open Login Page
    When Pass Admin and admin123
    Then Login should Pass

*** Keywords ***
# Keyword to open the login page
Open Login Page
    Create WebDriver    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

# Keyword to input username and password
Pass ${username} and ${password}
    Wait Until Element Is Visible    css:input[name="username"]    timeout=10s
    Input Text    css:input[name="username"]    ${username}
    Input Text    css:input[name="password"]    ${password}
    Wait Until Element Is Visible   css:button[type="submit"]   timeout=10s
    Click Element    css:button[type="submit"]

# Keyword to validate successful login
Login should Pass
    Title Should Be     OrangeHRM
    Wait Until Element Is Visible   css:span.oxd-userdropdown-tab   timeout=10s
    Element Should Be Visible   css:span.oxd-userdropdown-tab
    Close Browser


