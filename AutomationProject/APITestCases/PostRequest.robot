*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Post Request
    Create Session    mysession    ${BASE_URL}
    ${body}=    Create Dictionary    id=101    title=My Title    body=This is a test paragraph.
    ${response}=    POST On Session    mysession    /posts    json=${body}
    Should Be Equal As Integers    ${response.status_code}    201
    ${response_body}=    Set Variable    ${response.text}
    Should Contain    ${response_body}    My Title
    Should Contain    ${response_body}    This is a test paragraph.
