*** Settings ***
Library    SeleniumLibrary    timeout=5s 
Resource    ../resources/variables.resource
Resource    ../resources/common.resource
Test Teardown    Close Browser


*** Test Cases ***
# Cenário 4
Successful Login
    Enter Login Page
    Type Email    test@test.com 
    Type Password    test
    Click Login Button
    Verify Successful Login and Redirection


# Cenário 5
Invalid credentials
    Enter Login Page
    Type Email    test@test.com
    Type Password    invalid
    Click Login Button
    Verify Invalid Credentials Error Message


# Cenário 6
Non-existent credentials
    Enter Login Page
    Type Email    nonexistent@nonexistent
    Type Password    test
    Click Login Button
    Verify Invalid Credentials Error Message

*** Keywords ***
Enter Login Page
    Open Browser    url=${BASE_URL}   browser=${BROWSER}
    Wait Until Page Contains Element    css=a[href="/password/login"]    
    Click Link    css=a[href="/password/login"] 


Click Login Button
    Click Button    css=button[type="submit"]


Verify Successful Login and Redirection
    Wait Until Page Contains    Welcome!
    Wait Until Page Contains    Login successful
    Location Should Contain    /password/login



Verify Invalid Credentials Error Message
    Wait Until Page Contains    Invalid credentials