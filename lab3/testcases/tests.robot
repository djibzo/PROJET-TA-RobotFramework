*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Create Session To Ebay API

*** Test Cases ***
Get Shipping Fulfillments Pass
    [Documentation]    Test pour avoir les details d'expeditions (cas passant)
    Get Shipping Fulfilments Pass

Get Shipping Fulfillments No Pass
    [Documentation]    Test pour avoir les details d'expeditions (cas non passant)
    Get Shipping Fulfilments No Pass

Create Shipping Fulfillment Pass
    [Documentation]    Test pour creer une expedition (cas passant)
    Create Shipping Fulfillment Pass

Create Shipping Fulfillment No Pass
    [Documentation]    Test pour creer une expedition (cas non passant)
    Create Shipping Fulfillment No Pass

Get Shipping Fulfillment Pass
    [Documentation]    Test pour avoir les details d'une expedition (cas passant)
    Get Shipping Fulfillment Pass

Get Shipping Fulfillment No Pass
    [Documentation]    Test pour avoir les details d'une expedition (cas non passant)
    Get Shipping Fulfillment No Pass

