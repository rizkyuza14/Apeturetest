*** Settings ***
Documentation    Test suite for GET products info
Resource         ../../../../resources/imports.robot
Resource         ../../../../keywords/api/fakestore.robot

*** Test Cases ***

# Positive Scenario: Fetch All Products
Get All Products
    [Documentation]    Test GET list products
    Create Session     fake_store    ${BASE_URL}
    ${response}=       GET On Session   fake_store    ${PATH}
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain                ${response.text}    id
    Should Contain                ${response.text}    title

# Positive Scenario: Fetch Product by ID
Get Product By ID
    [Documentation]    Test GET products by product id
    Create Session     fake_store    ${BASE_URL}
    ${response}=       GET On Session    fake_store    ${PATH}/20
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain                ${response.text}    id
    Should Contain                ${response.text}    title

# Negative Scenario: Fetch Product with Invalid ID
Get Product Invalid ID
    [Documentation]    Test GET products with an invalid ID (e.g., a non-existent product).
    Create Session     fake_store    ${BASE_URL}
    ${response}=       GET On Session    fake_store    ${PATH}/11111
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}  200
    should be empty               ${response.text}

# Negative Scenario: Fetch Product with Invalid Data Type for ID
Get Product Non-Numeric ID
    [Documentation]    Test GET products with a non-numeric ID.
    Create Session     fake_store    ${BASE_URL}
    ${response}=       GET On Session    fake_store    ${PATH}/abc
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}   200
    should be empty               ${response.text}