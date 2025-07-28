*** Settings ***
Library    ../resources/mongo_helper.py
Variables  ../pageObject/variables.py

*** Keywords ***
Connect To MongoDB
    [Arguments]    ${uri}    ${db}    ${collection}
    ${conn}=    Connect To Mongo    ${uri}    ${db}    ${collection}
    Should Not Be Empty    ${conn}
    RETURN    ${conn}

Insert Product DB
    [Arguments]    ${conn}    ${product}
    ${id}=    insert_product    ${conn}    ${product}
    RETURN    ${id}

Find Product By Title DB
    [Arguments]    ${conn}    ${title}
    ${result}=    find_product_by_title    ${conn}    ${title}
    RETURN    ${result}

Update Product Price DB
    [Arguments]    ${conn}    ${title}    ${price}
    ${count}=    update_product_price   ${conn}    ${title}    ${price}
    RETURN    ${count}

Delete Product By Title DB
    [Arguments]    ${conn}    ${title}
    ${count}=    delete_product_by_title   ${conn}    ${title}
    RETURN    ${count}
