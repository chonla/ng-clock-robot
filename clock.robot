*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4200

*** Test Cases ***
Default Page Should Show Clock
    Open Clock Site
    Clock Should Be Displayed Perfectly
    [Teardown]    Close Browser

*** Keywords ***
Open Clock Site
    Open Browser    ${URL}    gc

Clock Should Be Displayed Perfectly
    ${text}=    Get Text    tag=h1
    Should Match RegExp    ${text}    ^\\d+:\\d{2}:\\d{2} [AP]M$