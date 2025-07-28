*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Create Session To Ebay API

*** Test Cases ***
Get Shipping Fulfillments
    [Documentation]    Test to get shipping fulfillment details (successful case)
    Get Shipping Fulfilments Pass