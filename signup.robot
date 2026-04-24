



*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Login Page Without Popup
Suite Teardown    Close Browser
*** Variables ***
${BROWSER}    Chrome
${USER}      jjcc
${PASS}      Password$123
${EMAIL}     t_br_dlv_stg_jjcc_distributorgroup
${PASSWORD}  jjcc1234
${URL}       https://${USER}:${PASS}@br-stg.jjcustomerconnect.com/store/en/login
@{g}
*** Keywords ***
 
Open Login Page Without Popup
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id:j_username    timeout=20s
wait click
    [Arguments]    ${LOC}
    Wait Until Keyword Succeeds    2x    10s    Scroll Element Into View    ${loc}
    Wait Until Element Is Enabled    ${LOC}
button signup
    Click Element    css:.btn.displayinlineblk.signUp
company inf
    Wait Until Element Is Visible    xpath=//a[@id="accordioncollapse8"]
    Click Element    xpath=//a[@id="accordioncollapse8"]
    Input Text    id=customerCode    7011
    Input Text    id=soldTo   7011
    Input Text    id=jnjAccountManager    shiv
    Click Element    xpath://button[@data-bs-toggle="dropdown"]
    # Wait Until Element Is Visible    xpath=//span[@class='text' and text()='Aruba']    timeout=10s
    Scroll Element Into View    xpath=//span[@class='text' and text()='United States']
    Click Element    xpath=//span[@class='text' and text()='United States']
    Input Text    id=shipAddress1    hdgh
    Input Text    xpath://input[@name="shipToCity"]    jhghj
    Scroll Element Into View    xpath=//div[@class="filter-option-inner-inner" and text()='Select State']  
    Click Element    xpath=//div[@class="filter-option-inner-inner" and text()='Select State']
    # Scroll Element Into View    xpath://span[@class="text" and text()='CT']    
    # Wait Until Element Is Visible    xpath://span[@class="text" and text()='CT']    15s
    # Click Element        id=bs-select-8-7
    wait click    xpath://span[@class="text" and text()='CT']   
    Click Element    xpath://span[@class="text" and text()='CT']
    # Execute Javascript    document.getElementById("bs-select-8-7").click();
    Input Text    id=shipToZipCode    72647
   
use inf
    Click Element    xpath=//a[@id="accordioncollapse3"]
    Input Text    xpath://input[@id="firstName"]    shiva
    Input Text    id=signup-lname    prasad
    Input Text    xpath=//input[@id="emailAddress"]    abc
    Input Text    xpath://input[@id="reenterEmailAddress"]    abc
    ${email1}=    Get Value    xpath=//input[@id="emailAddress"]
    ${email2}=    Get Value    id=reenterEmailAddress
    Should Be Equal    ${email1}    ${email2}    Email addresses do not match!
    Click Element    id=radioCTY
    Wait Until Element Is Visible    id=radioSmdd    timeout=10s
    Click Element    id=radioSmdd
    Input Text    id=regPhoneNumber    7015782485
    Input Password    xpath=//input[@id="password" and @type="password"]    Vivek@7013
    Input Password    id=reenter-password    Vivek@7013
    wait click    id=tab3NextButtonText   
    Click Element    id=tab3NextButtonText
 
Select Security Question With Id
    [Arguments]    ${dropdown_id}    ${option_id}    ${answer_id}    ${answer}
    Scroll Element Into View    xpath=//button[@data-id="${dropdown_id}"]
    Wait Until Element Is Enabled    xpath=//button[@data-id="${dropdown_id}"]    15s
    Click Element    xpath=//button[@data-id="${dropdown_id}"]
    Click Element    id=${option_id}
    Input Text      id=${answer_id}    ${answer}
sec questions
    # Wait Until Element Is Visible    id=accordioncollapse7    timeout=10s
    Click Element    id=accordioncollapse7
 
    Select Security Question With Id    questionList0    bs-select-2-3    profile.secret.answer0    shiva
    Select Security Question With Id    questionList1    bs-select-3-7    profile.secret.answer1    shiva
    Select Security Question With Id    questionList2    bs-select-4-1    profile.secret.answer2    shiva
    Select Security Question With Id    questionList3    bs-select-5-10    profile.secret.answer3    shiva
    Select Security Question With Id    questionList4    bs-select-6-16    profile.secret.answer4    shiva
    Select Security Question With Id    questionList5    bs-select-7-17    profile.secret.answer5    shiva
 
# ff
    # Click Element    id=accordioncollapse7
    # Click Element    xpath://button[@data-id="questionList0"]
    # Wait Until Element Is Visible    id=bs-select-2-3
    # Scroll Element Into View    id=bs-select-2-3
    # Click Element        id=bs-select-2-3
    # Input Text    id=profile.secret.answer0    shiva
    # Click Element    xpath://button[@data-id="questionList1"]
    # Wait Until Element Is Visible    id=bs-select-3-7  
    # Scroll Element Into View    id=bs-select-3-7  
    # Click Element        id=bs-select-3-7
    # Input Text    id=profile.secret.answer1    shiva
    # Click Element    xpath://button[@data-id="questionList2"]
    # Wait Until Element Is Visible    id=bs-select-4-1
    # Scroll Element Into View    id=bs-select-4-1
    # Click Element        id=bs-select-4-1
    # Input Text    id=profile.secret.answer2    shiva
    # Click Element    xpath://button[@data-id="questionList3"]
    # Wait Until Element Is Visible    id=bs-select-5-10
    # Scroll Element Into View    id=bs-select-5-10
    # Click Element        id=bs-select-5-10
    # Input Text    id=profile.secret.answer3    shiva
    # Click Element    xpath://button[@data-id="questionList4"]
    # Wait Until Element Is Visible    id=bs-select-6-16
    # Scroll Element Into View    id=bs-select-6-16
    # Click Element       id=bs-select-6-16
    # Input Text    id=profile.secret.answer4    shiva
    # Click Element    xpath://button[@data-id="questionList5"]
    # Wait Until Element Is Visible    id=bs-select-7-17
    # Scroll Element Into View    id=bs-select-7-17  
    # Click Element        id=bs-select-7-17
    # Input Text    id=profile.secret.answer5    shiva
   
signup verify
    Scroll Element Into View    id=terms-conditions
    Click Element    id=terms-conditions
    Click Element    xpath=//input[@id="privacy-policy"]
    Click Element    id=cancelButtonText
   
    
 
 
*** Test Cases ***
verify all
    button signup
    company inf
    use inf
    sec questions
    signup verify