*** Settings ***
Library    RequestsLibrary
Variables    ../pageObject/variables.py

*** Keywords ***
Create Session To Ebay API
    [Documentation]    Create a session to the eBay API with the base URL and headers
    Create Session    ebay    ${BASE_URL}    ${HEADERS}

Get Shipping Fulfillment Pass
    [Documentation]    Get the shipping fulfillment details from eBay API ( successful case )
    ${response}=    GET On Session    ebay    /sell/fulfillment/v1/order/${order_id}/shipping_fulfillment/${fulfillment_id}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Get Shipping Fulfillment No Pass
    [Documentation]    Get the shipping fulfillment details from eBay API ( unsuccessful case )
    ${response}=    GET On Session    ebay    /sell/fulfillment/v1/order/${wrong_order_id}/shipping_fulfillment/${wrong_fulfillment_id}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Get Shipping Fulfilments Pass
    [Documentation]    Get the shipping fulfillments from eBay API ( successful case )
    ${response}=    GET On Session    ebay    /sell/fulfillment/v1/order/${order_id}/shipping_fulfillment
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Get Shipping Fulfilments No Pass
    [Documentation]    Get the shipping fulfillments from eBay API ( unsuccessful case )
    ${response}=    GET On Session    ebay    /sell/fulfillment/v1/order/${wrong_order_id}/shipping_fulfillment
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Create Shipping Fulfillment Pass
    [Documentation]    Create a shipping fulfillment in eBay API ( successful case )
    ${response}=    POST On Session    ebay    /sell/fulfillment/v1/order/${order_id}/shipping_fulfillment    json=${body}
    Should Be Equal As Strings    ${response.status_code}    201
    Log To Console    ${response.json()}

Create Shipping Fulfillment No Pass
    [Documentation]    Create a shipping fulfillment in eBay API ( unsuccessful case )
    ${response}=    POST On Session    ebay    /sell/fulfillment/v1/order/${wrong_order_id}/shipping_fulfillment    json=${body}
    Should Be Equal As Strings    ${response.status_code}    400
    Log To Console    ${response.json()}