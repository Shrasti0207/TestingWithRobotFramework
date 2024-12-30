*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}  Admin
${PASSWORD}  admin123

*** Test Cases ***
LoginTest
    [Documentation]  This test logs into OrangeHRM using valid credentials.
    
    # Start the browser and open the login page
    Create WebDriver    Chrome    chrome_options=--headless,--no-sandbox,--disable-dev-shm-usage,--disable-gpu
    Open Browser    ${URL}    ${DEFAULT_BROWSER}
    Maximize Browser Window
    
    # Wait for the username input field and enter the username
    Wait Until Element Is Visible    css:input[name="username"]    timeout=10s
    Input Text    css:input[name="username"]    ${USERNAME}
    
    # Enter the password
    Wait Until Element Is Visible    css:input[name="password"]    timeout=10s
    Input Text    css:input[name="password"]    ${PASSWORD}
    
    # Click the login button
    Wait Until Element Is Visible   css:button[type="submit"]   timeout=10s
    Click Element    css:button[type="submit"]
    
    # Validate that the login was successful by checking the page title
    Title Should Be     OrangeHRM
    
    # Ensure the user dropdown is visible after successful login
    Wait Until Element Is Visible   css:span.oxd-userdropdown-tab   timeout=10s
    Element Should Be Visible   css:span.oxd-userdropdown-tab
    
    # Close the browser
    Close Browser
