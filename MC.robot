*** Settings ***
Library    Selenium2Library
Library    DateTime
Library    String
# Library    Pdf2TextLibrary
Library     OperatingSystem
# Suite teardown    Close all browsers


*** Variables ***
${BROWSER}              chrome
${MC_web}               http://10.26.11.90:10001/en
${Email_1}              test01@testmc.com
${Pass_1}               test1234
${Email_2}              test02@testmc.com
${Pass_2}               test1234
${MC_card}              Automate Test
${img}              ${CURDIR}/img/6.png
${doc}              ${CURDIR}/file/doc.docx
${excel}            ${CURDIR}/file/excel.xlsx
${pdf}              ${CURDIR}/file/pdf.pdf
${ppt}              ${CURDIR}/file/ppt.pptx
${vdo}              ${CURDIR}/file/video.mp4


*** Keywords ***
Open MC web
    Open BROWSER                                        ${MC_web}                                                               ${BROWSER}
    Maximize Browser Window

Register1
    Wait Until Page Contains                            Learn. Build. Success.
    Click Element                                       //a[contains(text(),"Sign up")]
    Wait Until Page Contains                            Have an account?
    Input Text                                          input-firstname                                                 pimm
    Input Text                                          input-lastname                                                  test user1
    Input Text                                          input-email                                                     ${Email_1}
    Input Text                                          input-password                                                  test
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Password should be at least 6 characters
    Input Text                                          input-password                                                  ${Pass_2}
    Click Button                                        //button[@class="btn btn-success"]

Register2
    Wait Until Page Contains                            Learn. Build. Success.
    Click Element                                       //a[contains(text(),"Sign up")]
    Wait Until Page Contains                            Have an account?
    Input Text                                          input-firstname                                                 pimm
    Input Text                                          input-lastname                                                  test user2
    Input Text                                          input-email                                                     ${Email_2}
    Input Text                                          input-password                                                  test
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Password should be at least 6 characters
    Input Text                                          input-password                                                  ${Pass_2}
    Click Button                                        //button[@class="btn btn-success"]

login
    Wait Until Page Contains                            Learn. Build. Success.
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${Email_1}
    Input Text                                          input-password                                                  ${Pass_1}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn. Build. Success.

login2
    Wait Until Page Contains                            Learn. Build. Success.
    Click Element                                       //a[contains(text(),"Sign in")]
    Wait Until Page Contains                            Don't have an account?
    Input Text                                          input-email                                                     ${Email_2}
    Input Text                                          input-password                                                  ${Pass_2}
    Click Button                                        //button[@class="btn btn-success"]
    Wait Until Page Contains                            Learn. Build. Success.

Logout
    Click Element                                       //span[@class="user-profile ml-2"]
    Click Element                                       //a[contains(text(),"Sign out")]
    Wait Until Page Contains                            Sign up

Go Homepage
    Click Element                                       //img[@class="logo logo__header"]


Search
    Input Text                                          inputSearchMC                                                   Full Stack
    Press key                                           inputSearchMC                                                   \\13

Go Applied MC
    sleep                                               2
    Click Element                                       //a[contains(text(),"Applied MCs")]
    Wait Until Page Contains                            Applied Micro Credentials

Go Owner MC
    sleep                                               2
    Click Element                                       //a[contains(text(),"My Own MCs")]
    Wait Until Page Contains                            My Micro-credentials

Go Reviewer MC
    sleep                                               2
    Click Element                                       //a[contains(text(),"Review Evidence Submission")]
    Wait Until Page Contains                            My Micro-credentials

Create MC
    sleep                                               2
    Click Element                                       show-btn
    Wait Until Page Contains                            Overview
    Click Element                                       //button[@class="btn btn-success"]
    Wait Until Page Contains                            Title is required
    Click Element                                       //a[contains(text(),"Cancel")]
    sleep                                               1
    Click Element                                       show-btn
    Wait Until Page Contains                            Overview
    Input Text                                          mc-title                                                     Automate Test
    Input Text                                          mc-description                                               Automate Test Description
    Click Element                                       (//div[@class="tags-input-root"])[1]
    Click Element                                       //*[contains(text(),"Programming")]
    Click Element                                       (//div[@class="tags-input-root"])[2]
    Click Element                                       //*[contains(text(),"GraphQL")]
    Click Element                                       (//div[@class="tags-input-root"])[2]
    Click Element                                       //*[contains(text(),"Vuex")]
    Click Element                                       (//div[@class="tags-input-root"])[3]
    Click Element                                       //*[contains(text(),"Web Development")]
    Click Element                                       //*[@class="ml-5 custom-control custom-radio"]
    Click Element                                       //*[@id="price"]
    Input Text                                          //*[@id="price"]                                                       500
    Click Element                                       //label[contains(text(),"Free")]
    Click Element                                       //*[@id="price"]
    Input Text                                          //*[@id="price"]                                                       555
    Click Button                                        //button[@class="btn btn-success"]
    Sleep                                               1

Add Detail MC
    Sleep                                               1
    Click Element                                       //h4[contains(text(),"Automate Test")]
    Wait Until Page Contains                            Constructive Course Design
    # Click Element                                       //div[span[p[contains(text(),"Constructive Course Design")]]]//button[contains(text(),"Edit")]
    # Select From List                                    //select[@class="form-control"]                             Publish
    # Input Text                                          mc-description                                              Edit Automate Test Description add more text too long word.
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[span[p[contains(text(),"Detail")]]]//button[contains(text(),"Edit")]
    # Sleep                                               2
    # ${text} =                                           getFile                                                                 ${CURDIR}/file/MCdetial.txt    encoding=UTF-8
    # Select Frame                                        //*[@class="tox-edit-area__iframe"]
    # Input Text                                          tinymce                                                                                                     ${text}
    # Unselect Frame
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[p[contains(text(),"Learning unit/ Learning resources")]]//button[contains(text(),"+ Add")]
    # Input Text                                          input-title                                                             Learning Unit 1
    # Input Text                                          editor                                                                  Description Learning Unit 1
    # sleep                                               1
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[p[contains(text(),"Learning unit/ Learning resources")]]//button[contains(text(),"+ Add")]
    # Input Text                                          input-title                                                             Learning Unit 2
    # Input Text                                          editor                                                                  Description Learning Unit 2
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${img}
    # sleep                                               3
    # Choose File                                         //input[@type="file"]                                                                ${doc}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${excel}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${pdf}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${ppt}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${vdo}
    # sleep                                               2
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[p[contains(text(),"Learning unit/ Learning resources")]]//button[contains(text(),"+ Add")]
    # Input Text                                          input-title                                                             For Delete
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[div[a[contains(text(),"For Delete")]]]//button[contains(text(),"Delete")]
    # Click Button                                        //button[@class="btn btn-primary"]
    # sleep                                               1
    # Click Element                                       //div[p[contains(text(),"Submission & Evaluation")]]//button[contains(text(),"+ Add")]
    # Input Text                                          input-title                                                             test
    # Input Text                                          //textarea[@k-obj="input-description"]                                  test
    # sleep                                               1
    # Choose File                                         //input[@type="file"]                                                                ${img}
    # Input Text                                          input-passCriterion                                                     test
    # Input Text                                          input-notPassCriterion                                                  test
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[div[li[a[contains(text(),"test")]]]]//button[contains(text(),"Delete")]
    # Click Button                                        //button[@class="btn btn-primary"]
    # sleep                                               1
    # Click Element                                       //div[p[contains(text(),"Submission & Evaluation")]]//button[contains(text(),"+ Add")]
    # Input Text                                          input-title                                                             คำถามข้อที่ 1
    # ${submis}                                           getFile                                                                 ${CURDIR}/file/submission.txt    encoding=UTF-8
    # Input Text                                          //textarea[@k-obj="input-description"]                                  ${submis}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${img}
    # sleep                                               3
    # Choose File                                         //input[@type="file"]                                                                ${doc}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${excel}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${pdf}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${ppt}
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${vdo}
    # sleep                                               2
    # Input Text                                          input-passCriterion                                                     How to Pass ?
    # Input Text                                          input-notPassCriterion                                                  How to Not Pass ?
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    # Click Element                                       //div[p[contains(text(),"Submission & Evaluation")]]//button[contains(text(),"+ Add")]
    # Input Text                                          input-title                                                             คำถามข้อที่ 2
    # Input Text                                          //textarea[@k-obj="input-description"]                                  ไก่กับไข่อะไรเกิดก่อน?
    # sleep                                               2
    # Choose File                                         //input[@type="file"]                                                                ${img}
    # sleep                                               2
    # Input Text                                          input-passCriterion                                                     How to Pass ?
    # Input Text                                          input-notPassCriterion                                                  How to Not Pass ?
    # Click Button                                        //button[@class="btn btn-success"]
    # sleep                                               1
    Click Element                                       //div[p[contains(text(),"Reviewer")]]//div[contains(text(),"+ Add")]
    sleep                                               2
    Click Element                                       //div[contains(text(),"pimm pimmp")]
    Click Element                                       //div[contains(text(),"Palm Kmutt")]
    Click Element                                       //div[contains(text(),"pimm test user1")]
    Click Button                                        //button[@class="btn btn-success"]
    sleep                                               1
    Click Element                                       //div[div[div[contains(text(),"Palm Kmutt")]]]//div[contains(text(),"Delete")]
    Wait Until Page Contains                            Are you sure that you want to delete this?
    Click Button                                        //button[a[contains(text(),"Delete")]]
    sleep                                               1

Select tab MC
    Sleep                                               1
    Click Element                                       //h4[contains(text(),"Automate Test")]
    Wait Until Page Contains                            Constructive Course Design
    Click Element                                       //span[contains(text(),"Reviewer")]
    Click Element                                       //span[contains(text(),"Overview")]
    Click Element                                       //span[contains(text(),"Submission & Evaluation")]
    Click Element                                       //span[contains(text(),"Details")]
    Click Element                                       //span[contains(text(),"Learning unit/Learning resources")]

Search for apply MC
    Input Text                                          inputSearchMC                                                   Automate test
    Press key                                           inputSearchMC                                                   \\13
    Wait Until Element Is Enabled                       //h4[contains(text(),"${MC_card}")]
    Click Element                                       //h4[contains(text(),"${MC_card}")]
    Wait Until Page Contains                            Apply
    Click Element                                        //button/span/span[contains(text(),"Apply")]
    Sleep                                               2

Submit MC
# Go card
    sleep                                               2
    Click Element                                       //h4[contains(text(),"Automate Test")]
    Wait Until Page Contains                            Constructive Course Design
    # #//////////////////////Bug ของน้อยโหน่งขึ้น submit ต้องโหลดใหม่ถึงขึ้นของตัวเอง///////////////////////////////
    # Reload Page
    # Wait Until Page Contains                            Constructive Course Design
# Try to Click
    sleep                                               2
    Click Element                                       //div[div[a[contains(text(),"Learning Unit 1")]]]//div[contains(text(),"Show Learning Unit")]
    Wait Until Page Contains                            Hide Learning Unit
    Click Element                                       //div[div[a[contains(text(),"Learning Unit 1")]]]//p[contains(text(),"Hide Learning Unit")]
    Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Show Learning Unit")]
    # Wait Until Page Contains                            Hide Learning Unit
    Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Hide Learning Unit")]
    Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Assessment Rubric")]
    Sleep                                               1
    Click Element                                       //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//p[contains(text(),"Assessment Rubric")]
# Answer
    ${ans}                                              getFile                                                                 ${CURDIR}/file/answer.txt    encoding=UTF-8
    Input Text                                          //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//textarea[@id="textarea-description"]                                  ${ans}
    sleep                                               2
    Choose File                                         //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//input[@type="file"]                                                                ${img}
    sleep                                               1
    Choose File                                         //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//input[@type="file"]                                                                ${doc}
    sleep                                               2
    Choose File                                         //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//input[@type="file"]                                                                ${excel}
    sleep                                               2
    Choose File                                         //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//input[@type="file"]                                                                ${pdf}
    sleep                                               2
    Choose File                                         //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//input[@type="file"]                                                                ${ppt}
    sleep                                               2
    Choose File                                         //div[div[a[contains(text(),"คำถามข้อที่ 1")]]]//input[@type="file"]                                                                ${vdo}
    sleep                                               3

Tag

Category

*** Test cases ***
# Open MC web
#     Open MC web
#     Register1
#     Sleep    3
    # Close Browser
    # Open MC web
    # Register2
    # Logout
    # login2
    # Search
    # Homepage

# User 1 Create MC
#     Open MC web
#     login

# Designer Create MC
#     Go Owner MC
#     # Create MC
#     Add Detail MC
#     Go Homepage

# Designer Select tab MC
#     Go Owner MC
#     Select tab MC
#     Go Homepage

# Close user 1
#     Logout
    # Close Browser

User 2 Apply MC
    Open MC web
    login2

# User Apply MC
#     Search for apply MC
#     Go Homepage

Submit MC
    Go Applied MC
    Submit MC

# Close user 2
#     Close Browser

# User 1 Review
#     Open MC web
#     login

# Reviewer
#     Go Reviewer MC

# Log out MC Web
#     Logout

Wait
    Sleep                       5