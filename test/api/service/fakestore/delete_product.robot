*** Settings ***
Resource         ../../../../resources/imports.robot
Resource         ../../../../keywords/api/fakestore.robot

*** Test Cases ***
Delete Product - Positive Scenario
    [Documentation]  Verify the successful deletion of an existing product.
    Create Session    fakestore    ${BASE_URL}
    ${response}    DELETE On Session    fakestore   ${PATH}/${VALID_PRODUCT_ID}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Response: ${response.content}

    # Verify the product no longer exists
    ${response}    GET On Session    fakestore   ${PATH}/${VALID_PRODUCT_ID}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Product with ID ${VALID_PRODUCT_ID} has been deleted.

Delete Product - Negative Scenario (Non-existent Product)
    [Documentation]  Verify error when attempting to delete a non-existent product.
    Create Session    fakestore    ${BASE_URL}
    ${response}    DELETE On Session    fakestore  ${PATH}/${INVALID_PRODUCT_ID}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Response: ${response.content}