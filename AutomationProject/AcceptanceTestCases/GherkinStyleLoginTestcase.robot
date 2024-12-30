*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  Chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
LoginTest
    Given Open Login Page
    When Pass Admin and admin123
    Then Login should Pass

*** Keywords ***
Open Login Page
    Create WebDriver    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Pass ${username} and ${password}
    Wait Until Element Is Visible    css:input[name="username"]    timeout=10s
    Input Text    css:input[name="username"]    ${username}
    Input Text    css:input[name="password"]    ${password}
    Wait Until Element Is Visible   css:button[type="submit"]   timeout=10s
    Click Element    css:button[type="submit"]

Login should Pass
    Title Should Be     OrangeHRM
    Wait Until Element Is Visible   css:span.oxd-userdropdown-tab   timeout=10s
    Element Should Be Visible   css:span.oxd-userdropdown-tab
    Close Browser


