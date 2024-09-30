*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${URL1}    https://www.google.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Login Test

    [Documentation]    This test opens a browser, logs in with valid credentials, and verifies login success.

    Open Browser    ${URL}  Chrome
    Maximize Browser Window

    Input Text    id=user-name   ${USERNAME}
    Input Text    id=password    ${PASSWORD}

    Click Button  id=login-button

    Wait Until Element Is Visible  id=shopping_cart_container    3 seconds

    [Teardown]    Close Browser
