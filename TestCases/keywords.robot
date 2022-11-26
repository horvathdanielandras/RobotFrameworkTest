*** Settings ***

*** Test Cases ***
Good addition
    Calculate Additon    ${2}    ${3}    ${5}

*** Keywords ***
Calculate Additon
    [Arguments]    ${first}   ${second}    ${expected}
    [Documentation]    Simple adding function

    ${temp}     evaluate  $first + $second

    Should Be Equal  ${temp}  ${expected}
