*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variables.resource


*** Test Cases ***
Successful Signup
    Enter Signup Page





*** Keywords ***
Enter Signup Page
    Open Browser    url=${BASE_URL}   browser=${BROWSER}