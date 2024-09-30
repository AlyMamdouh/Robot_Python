*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Login Test

    [Documentation]    This test opens a browser, logs in with valid credentials, and verifies login success.


    Open Browser    ${URL}    Chrome
    Go To           ${URL}                                                                 # to go to any website after any task.
    Maximize Browser Window


    Input Text    id=user-name                         ${USERNAME}
    Input Text    XPath={//*[@id="user-name"]}         ${USERNAME}
    Input Text    XPath={//*[@name="user-name"]}       ${USERNAME}
    Input Text    XPath={//*[@id="user-name"]}         ${USERNAME}
    Input Text    XPath={//*[@id="user-name"]}         ${USERNAME}
    Input Text    id=password                          ${PASSWORD}


    Click Button  id=login-button


    Wait Until Element Is Visible  id=shopping_cart_container    3 seconds
    Wait Until Page Contains  Hegllo
    Page Should Contain Element    id=shopping_cart_container


    Capture Page Screenshot        filename=screen_test.png

    [Teardown]    Close Browser
