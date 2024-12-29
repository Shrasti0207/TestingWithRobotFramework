*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${post_id}      1

*** Test Cases ***
Delete Request
    Create Session    mysession    ${BASE_URL}
    ${response}=    DELETE On Session    mysession    /posts/${post_id}
    Should Be Equal As Integers    ${response.status_code}    200
