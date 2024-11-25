*** Settings ***
Resource         ../../../../resources/imports.robot
Resource         ../../../../keywords/api/fakestore.robot

*** Test Cases ***
Test Get Products Sorted Descending
    [Documentation]    This test case performs a GET request to fetch products sorted in descending order, like the curl command.
    Create Session    fakestoreapi    ${BASE_URL}
    ${response}=    GET On Session   fakestoreapi    ${PATH}    ${DESC}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log  ${response.text}
Test Get Products Sorted Ascending
    [Documentation]    This test case performs a GET request to fetch products sorted in ascending order, like the curl command.
    Create Session    fakestoreapi    ${BASE_URL}
    ${response}=    GET On Session   fakestoreapi    ${PATH}    ${ASC}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log   ${response.text}
