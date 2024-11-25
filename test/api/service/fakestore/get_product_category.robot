*** Settings ***
Resource         ../../../../resources/imports.robot
Resource         ../../../../keywords/api/fakestore.robot

*** Test Cases ***
# Positive Test Case: Verify GET Categories Endpoint Returns Expected Results
Get Product Categories - Positive Test
    [Documentation]    Verify that the GET /products/categories endpoint returns
    ...                a valid response with an expected status code and structure.
    Create Session     fake_store_session    ${BASE_URL}
    ${response}=       get on session    fake_store_session    ${ENDPOINT_CATEGORY}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console     Response Body: ${response.json()}
    ${categories}=     Convert To List       ${response.json()}
    Log To Console     Categories: ${categories}
    Should Contain     ${categories}    electronics
    Should Contain     ${categories}    jewelery

# Negative Test Case: Verify GET Categories not contain another product category
Get Product Categories - Negative Test
    Create Session     fake_store_session    ${BASE_URL}
    ${response}=       get on session    fake_store_session    ${ENDPOINT_CATEGORY}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console     Response Body: ${response.json()}
    ${categories}=     Convert To List       ${response.json()}
    Log To Console     Categories: ${categories}
    should not contain     ${categories}    Car
    should not contain     ${categories}    Motorcycle







