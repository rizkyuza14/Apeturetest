*** Settings ***
Resource         ../../resources/imports.robot

*** Variables ***
${HEADERS}       {"Content-Type": "application/json"}
${BASE_URL}      https://fakestoreapi.com
${PATH}          /products
${VALID_PRODUCT_ID}  1
${INVALID_PRODUCT_ID}    99999
${ENDPOINT_CATEGORY}       /products/categories
${INVALID_PATH}    /invalid
${BASE_URL}    https://fakestoreapi.com
${DESC}        sort=desc
${ASC}         sort=asc
${DATA}       {"title": "Updated Product", "price": 20.99, "description": "Updated description", "category": "electronics", "image": "https://example.com/updated_image.jpg"}
${IVALID_DATA}=    {"title": "Non-Existent Product", "price": 25.99, "description": "This product does not exist", "category": "electronics", "image": "https://example.com/non_existent_image.jpg"}


