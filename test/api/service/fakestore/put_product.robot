*** Settings ***
Resource         ../../../../resources/imports.robot
Resource         ../../../../keywords/api/fakestore.robot

*** Test Cases ***
#Positive Case
Update Product Information Successfully
    [Documentation]    This test case validates the PUT request to update a product's details.
    Create Session    fakestoreapi    ${BASE_URL}
    ${response}=    PUT On Session    fakestoreapi   ${PATH}/${VALID_PRODUCT_ID}    ${DATA}    ${HEADERS}
    Should Be Equal As Numbers    ${response.status_code}    200
    should contain    ${response.text}    ${VALID_PRODUCT_ID}
    Log    Product updated successfully with status code: ${response.status_code}
    log to console    ${response.content}

#Negative Case
Update Non-Existent Product
    [Documentation]    This test case validates the PUT request for updating a non-existent product.
    Create Session    fakestoreapi    ${BASE_URL}
    ${response}=    PUT On Session    fakestoreapi   ${PATH}/${INVALID_PRODUCT_ID}    ${IVALID_DATA}    ${HEADERS}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Attempted to update a non-existent product with status code: ${response.status_code}
    log to console    ${response.content}