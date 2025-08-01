*** Settings ***
Library           SeleniumLibrary
Variables           ../pageObject/variables.py
Variables           ../pageObject/locator.py

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Set Selenium Timeout    10s

Close Browser Session
    Close Browser

Click Login Link
    Click Element    ${login_link_after}

Enter Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${username_input}    ${username}
    Input Text    ${password_input}    ${password}

Submit Login Form
    Click Button    ${submit_button}

Verify Home Page
    Page Should Contain    ${home_title}

Verify Login Success
    Page Should Contain     ${logout_button}

Verify Login Error
    Page Should Contain    ${login_error}
    
Login With Valid Credentials
    Click Element    ${login_link}
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Button    ${submit_button}
    Wait Until Page Contains    ${logout}

Login With Invalid Credentials
    Click Element    ${login_link}
    Enter Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Click Button    ${submit_button}
    Wait Until Page Contains    ${login_error}

Logout
    Click Element    ${logout_button}
    Wait Until Page Contains    ${text_signed}

Go To Add Customer Page
    Click Element    ${new_customer_button}
    Wait Until Page Contains    Add Customer

Add New Customer
    Input Text    ${email_customer_input}    ${EMAIL_CUSTOMER}
    Input Text    ${first_name_input}    ${FIRST_NAME}
    Input Text    ${last_name_input}    ${LAST_NAME}
    Input Text    ${city_input}    ${CITY}
    Select From List By Value    ${state_select}    ${STATE}
    Click Element    ${gender}
    Click Element    ${promos_checkbox}
    Click Element    ${submit_customer_button}
    Wait Until Page Contains    ${succes_add}
