*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${post_id}      1

*** Test Cases ***
Put Request
    Create Session    mysession    ${BASE_URL}
    ${body}=    Create Dictionary    id=${post_id}    title=Updated Title    body=Updated Body.
    ${response}=    PUT On Session    mysession    /posts/${post_id}    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_body}=    Set Variable    ${response.text}
    Should Contain    ${response_body}    Updated Title
    Should Contain    ${response_body}    Updated Body.
