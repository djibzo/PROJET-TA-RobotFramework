*** Settings ***
Library           AppiumLibrary

Variables        ../pageObject/variables.py
Variables        ../pageObject/locator.py



*** Keywords ***
Open Application MyApp
    Open Application       ${REMOTE_URL}   platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    noReset=true

Enter username
    Wait Until Element Is Visible    ${USERNAME}    10
    Click Element    ${USERNAME}
    Input Text    ${USERNAME}    johnd
    
Enter password
    Wait Until Element Is Visible    ${PASSWORD}    10
    Click Element    ${PASSWORD}
    Input Password    ${PASSWORD}    m38rmF$

Log In
    Wait Until Element Is Visible    ${LOGIN}    10
    Click Element    ${LOGIN}
    Wait Until Page Contains Element    ${PAGE_FORM}    10
    Page Should Contain Element    ${PAGE_FORM}

Fill titre
    Wait Until Element Is Visible    ${FORM_TITLE}    10
    Click Element    ${FORM_TITLE}
    Input Text    ${FORM_TITLE}    Rain Jacket Women Windbreaker    

Fill price
    Wait Until Element Is Visible    ${FORM_PRICE}    10
    Click Element    ${FORM_PRICE}
    Input Text    ${FORM_PRICE}    39.99

Fill description
    Wait Until Element Is Visible    ${FORM_DESCRIPTION}    10
    Click Element    ${FORM_DESCRIPTION}
    Input Text    ${FORM_DESCRIPTION}    Rain Jacket Women Windbreaker description

Fill categorie
    Wait Until Element Is Visible    ${FORM_CATEGORIE}    10
    Click Element    ${FORM_CATEGORIE}
    Input Text    ${FORM_CATEGORIE}    women's clothing

Fill url
    Wait Until Element Is Visible    ${FORM_URL}    10
    Click Element    ${FORM_URL}
    Input Text    ${FORM_URL}    http://example.com/image.jpg

Click Add Product Button
    Wait Until Element Is Visible    ${FORM_BUTTON_ADD}    10
    Click Element    ${FORM_BUTTON_ADD}
    Wait Until Page Contains Element    ${PAGE_LIST_PROUDCTS}    10
    Page Should Contain Element    ${PAGE_LIST_PROUDCTS}

Check Product Added
    Wait Until Element Is Visible    ${PRODUCT}    10
    Page Should Contain Element    ${PRODUCT}
    Click Element    ${PRODUCT}