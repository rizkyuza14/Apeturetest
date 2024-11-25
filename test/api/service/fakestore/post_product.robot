*** Settings ***
Documentation    Test suite for POST products endpoint of Fake Store API.
Resource         ../../../../resources/imports.robot
Resource         ../../../../keywords/api/fakestore.robot


*** Test Cases ***

# Positive Scenario: Valid Product Data
Post Valid Product
    [Documentation]    Test POST /products with valid data.
    Create Session     fake_store    ${BASE_URL}    headers=${HEADERS}
    ${payload}=        Create Dictionary    title=Wireless Mouse    price=25.99    description=A high-quality wireless mouse    category=electronics    image=https://example.com/mouse.jpg
    ${response}=       Post Request         fake_store    ${PATH}    json=${payload}
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain                ${response.text}    Wireless Mouse

# Negative Scenario: Missing Required Field
Post Product Missing Title
    [Documentation]    Test POST /products with missing required "title" field.
    Create Session     fake_store    ${BASE_URL}    headers=${HEADERS}
    ${payload}=        Create Dictionary    price=19.99    description=A basic mouse    category=electronics    image=https://example.com/mouse.jpg
    ${response}=       Post Request         fake_store    ${PATH}    json=${payload}
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain                ${response.text}    id

# Negative Scenario: Invalid Price Data Type
Post Product Invalid Price
    [Documentation]    Test POST /products with invalid data type for "price".
    Create Session     fake_store    ${BASE_URL}    headers=${HEADERS}
    ${payload}=        Create Dictionary    title=Stylish Bag    price="free"    description=A trendy bag    category=fashion    image=https://example.com/bag.jpg
    ${response}=       Post Request         fake_store    ${PATH}    json=${payload}
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain                ${response.text}    free

# Positive Scenario: Boundary Price Value
Post Product Boundary Price
    [Documentation]    Test POST /products with boundary value for price.
    Create Session     fake_store    ${BASE_URL}    headers=${HEADERS}
    ${payload}=        Create Dictionary    title=Cheap Pen    price=0.01    description=A pen that costs almost nothing    category=office supplies    image=https://example.com/pen.jpg
    ${response}=       Post Request         fake_store    ${PATH}    json=${payload}
    Log                Response Body: ${response.text}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain                ${response.text}    Cheap Pen