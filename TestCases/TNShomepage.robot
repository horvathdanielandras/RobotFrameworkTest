*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}   https://www.google.com
${BROWSER}    Chrome
*** Test Cases ***
Look at google
    open browser    url=${HOMEPAGE}  browser=${BROWSER}    executable_path=TestCases/chromedriver.exe
    TRY
        ${CookieConsent}    get webelement    id=W0wltc
        click button  ${CookieConsent}
         log  Cookie popup was present.    INFO
    EXCEPT    Element with locator 'id=W0wltc' not found.
        log   No Cookie popup was present.    INFO
    END

    wait until element is visible    name=q
    Search Topic    VNDB
*** Keywords ***
Search Topic
    [Arguments]    ${Topic}
    input text    name=q  ${Topic}
    press keys    name=q   ENTER