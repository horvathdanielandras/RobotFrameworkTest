*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}   https://www.google.com
${BROWSER}    Chrome
*** Test Cases ***
Look at google
    open browser    ${HOMEPAGE}  ${BROWSER}
    TRY
        ${CookieConsent}    get webelement    id=W0wltc
        click button  ${CookieConsent}
    EXCEPT    Element with locator 'id=W0wltc' not found.
        log   Element with locator 'id=W0wltc' not found.
    END

    wait until element is visible    name=q
    Search Topic    VNDB
*** Keywords ***
Search Topic
    [Arguments]    ${Topic}
    input text    name=q  ${Topic}
    press keys    name=q   ENTER