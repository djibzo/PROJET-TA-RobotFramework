*** Settings ***
Variables    ../pageObject/variables.py
Resource     ../resources/resources.robot

*** Test Cases ***
Create Product - Valid
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${id}=      Insert Product DB    ${conn}    ${valid_product}
    Should Not Be Empty    ${id}

Create Product - Missing Title (Invalid)
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    Run Keyword And Expect Error    *    Insert Product DB    ${conn}    ${invalid_product_missing_title}

Create Product - Price Not Number (Invalid)
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    Run Keyword And Expect Error    *Price must be a number*    Insert Product DB    ${conn}    ${invalid_product_price_string}

Read Product - Valid
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${product}=    Find Product By Title DB   ${conn}    ${valid_product['title']}
    Should Contain    ${product['title']}    ${valid_product['title']}

Read Product - Non-existent (Invalid)
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${product}=    Find Product By Title DB   ${conn}    NotExists123
    Should Be Equal    ${product}    ${None}

Read Product - Empty (Invalid)
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${product}=    Find Product By Title DB    ${conn}    ${EMPTY}
    Should Be Equal    ${product}    ${None}

Update Product - Valid
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${count}=    Update Product Price DB    ${conn}    ${valid_product['title']}    29.99
    Should Be Equal As Integers    ${count}    1

Update Product - Invalid Title
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${count}=    Update Product Price DB    ${conn}    InvalidTitle    39.99
    Should Be Equal As Integers    ${count}    0

Update Product - Invalid Price Type
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    Run Keyword And Expect Error    *must be a number*    Update Product Price DB    ${conn}    ${valid_product['title']}    abc    

Delete Product - Valid
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${count}=    Delete Product By Title DB   ${conn}    ${valid_product['title']}
    Should Be Equal As Integers    ${count}    1

Delete Product - Already Deleted
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${count}=    Delete Product By Title DB    ${conn}    ${valid_product['title']}
    Should Be Equal As Integers    ${count}    0

Delete Product - Empty Title
    ${conn}=    Connect To MongoDB    ${MONGO_URI}    ${DB_NAME}    ${COLLECTION_PRODUCTS}
    ${count}=    Delete Product By Title DB    ${conn}    ${EMPTY}
    Should Be Equal As Integers    ${count}    0
