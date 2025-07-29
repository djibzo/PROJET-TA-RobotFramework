*** Settings ***
Library           AppiumLibrary

Variables        ../pageObject/variables.py
Resource         ../resources/resources.robot


Suite Setup    Run Keyword    Open Application MyApp


*** Test Cases ***
Open Application and Login
    [Documentation]    Open the application, log in, and fill the form with animal details
    [Tags]     "mobile" "login" "form" "init"
    Enter username
    Enter password
    Log In

Fill Form with Product Details
    [Documentation]    Fill the form with product details
    [Tags]     "mobile" "form" "product"
    Fill titre
    Fill price
    Fill description
    Fill categorie
    Fill url
    Click Add Product Button

Check Product
    [Documentation]    Check if the product is added successfully
    Check Product Added