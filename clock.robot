*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4200
@{CHROME_OPTIONS}    headless    disable-gpu

*** Test Cases ***
Default Page Should Show Clock
    Open Clock Site
    Clock Should Be Displayed Perfectly
    [Teardown]    Close Browser

*** Keywords ***
Open Clock Site
    Open Headless Browser    ${URL}

Clock Should Be Displayed Perfectly
    ${text}=    Get Text    tag=h1
    Should Match RegExp    ${text}    ^\\d+:\\d{2}:\\d{2} [AP]M$

Open Headless Browser
    [Arguments]    ${url}
    ${options}=    Set Chrome Options
    Create WebDriver    Chrome    chrome_options=${options} 
    Go To    ${url}

Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{CHROME_OPTIONS}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}
