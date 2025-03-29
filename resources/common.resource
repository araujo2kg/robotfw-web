*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Type Email
    [Arguments]    ${email}
    Wait Until Page Contains Element    css=input[type="email"]    
    Input Text    css=input[type="email"]    ${email}

Type Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    css=input[type="password"]    
    Input Password    css=input[type="password"]    ${password}