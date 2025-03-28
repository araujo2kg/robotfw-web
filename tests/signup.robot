*** Settings ***
Library    SeleniumLibrary    timeout=5s 
Library    String
Resource    ../resources/variables.resource
Resource    ../resources/common.resource
Test Teardown    Close Browser


*** Test Cases ***
# Cenário 1
Successful Signup
    Skip
    Enter Signup Page
    Generate New Valid Email
    Type Email    ${new_random_email}
    Type Password    password
    Click Signup Button
    Verify Redirection After Signup


# Cenário 2
Required Fields
    Enter Signup Page
    Click Signup Button
    Verify Missing Email Error Message
    Verify Missing Password Error Message


# Cenário 3
Email Format Validation
    Enter Signup Page
    Type Email    invalid
    Type Password    password
    Click Signup Button
    Verify Incorrect Email Error Message


*** Variables ***
${new_random_email}=    null

*** Keywords ***
Enter Signup Page
    Open Browser    url=${BASE_URL}   browser=${BROWSER}
    Click Link    css=a[href="/password/login"] 
    Wait Until Page Contains Element    css=a[href="/password/signup"]    
    Click Link    css=a[href="/password/signup"]
    Wait Until Location Contains    /password/signup


Generate New Valid Email
    ${new_random_email}=    Generate Random String    5-10
    ${new_random_email}=    Set Variable    ${new_random_email}@test.com
    Set Global Variable    ${new_random_email}
    

Click Signup Button
    Click Button    css=button[type="submit"]


Verify Redirection After Signup
    Wait Until Page Contains    Welcome!
    Wait Until Page Contains    Signup successful!
    Page Should Contain Element    css=a[href="/password/login"]


Verify Missing Email Error Message
    ${validation_message}=    Get Element Attribute    css=input[type="email"]    validationMessage
    Should Contain    ${validation_message}    Please fill out this field.


Verify Missing Password Error Message
    ${validation_message}=    Get Element Attribute    css=input[type="password"]    validationMessage
    Should Contain    ${validation_message}    Please fill out this field.


Verify Incorrect Email Error Message
    ${validation_message}=    Get Element Attribute    css=input[type="email"]    validationMessage
    Should Contain Any    ${validation_message}    Please include an '@' in the email address.    Please enter a part following '@'.

