*** Settings ***
Library    String
Library    SeleniumLibrary

*** Test Cases ***
First Test Case
    Log    Hello World

Create a Random String
    Log To Console    Generating a random string
    Generate Random String    10
    Log To Console    String generated

Testing Selenium
    Open Browser    url=https://google.com    browser=chrome
    Input Text    locator=q    text=testing selenium
    Press Key    locator=q    key=\\13