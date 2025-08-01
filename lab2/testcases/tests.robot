*** Settings ***
Documentation     Test suite for CRM application automation
Resource          ../resources/resources.robot
Suite Setup       Open Browser To Home Page
Suite Teardown    Close Browser Session

*** Test Cases ***
1001 - Home page should load
    [Tags]    Smoke
    Verify Home Page

1002 - Login should succeed with valid credentials
    [Tags]    Smoke
    Login With Valid Credentials

1003 - Login should fail with missing credentials
    [Tags]    Functional
    Login With Invalid Credentials
    Verify Login Error

1004 - Remember Me should persist email
    [Tags]    Functional
    Click Login Link
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Select Checkbox    ${rem_checkbox}
    Click Button    ${submit_button}
    Wait Until Page Contains    ${logout}
    Logout
    Click Login Link
    Textfield Value Should Be    ${username_input}    ${VALID_USERNAME}

1005 - Should be able to logout
    [Tags]    Functional
    Login With Valid Credentials
    Logout

1006 - Customers page should display multiple customers
    [Tags]    Smoke
    Login With Valid Credentials
    ${rows}=    Get Element Count    ${table}
    Should Be True    ${rows} > 1
    Logout

1007 - Should be able to add new customer
    [Tags]    Smoke
    Login With Valid Credentials
    Go To Add Customer Page
    Add New Customer
    Logout

1008 - Should be able to cancel adding new customer
    [Tags]    Functional
    Login With Valid Credentials
    Go To Add Customer Page
    Click Element    ${cancel_button}
    Page Should Contain Element    ${new_customer_button}
    Logout