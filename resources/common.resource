*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Type Email
    [Arguments]    ${email}
    Input Text    css=input[type="email"]    ${email}

Type Password
    [Arguments]    ${password}
    Input Password    css=input[type="password"]    ${password}