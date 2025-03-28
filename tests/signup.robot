*** Settings ***
Library    SeleniumLibrary    timeout=5s 
Library    String
Resource    ../resources/variables.resource
Resource    ../resources/common.resource


*** Test Cases ***
# Cenário 1
Successful Signup
    Skip
    Enter Signup Page
    Generate New Valid Email
    Type Email    ${new_email}
    Type Password    password
    Click Signup Button
    Verify Redirection After Signup
    [Teardown]



*** Variables ***
${new_email}=    null

*** Keywords ***
Enter Signup Page
    Open Browser    url=${BASE_URL}   browser=${BROWSER}
    Click Link    css=a[href="/password/login"] 
    Wait Until Page Contains Element    css=a[href="/password/signup"]    
    Click Link    css=a[href="/password/signup"]
    Wait Until Location Contains    /password/signup

Generate New Valid Email
    ${new_email}=    Generate Random String    5-10
    ${new_email}=    Set Variable    ${new_email}@test.com
    Set Global Variable    ${new_email}
    
Click Signup Button
    Click Button    css=button[type="submit"]

Verify Redirection After Signup
    Wait Until Page Contains    Welcome!
    Wait Until Page Contains    Signup successful!
    Page Should Contain Element    css=a[href="/password/login"]