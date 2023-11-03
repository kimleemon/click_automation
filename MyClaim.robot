*** Settings ***
# Library           SeleniumLibrary
Library           AppiumLibrary
Library           Collections
Library    XML



*** Variables ***
${REMOTE_URL}=  http://localhost:4723/wd/hub
#${APP}=  MTL CLICK.apk
${allow_noti}=  xpath=//hierarchy/android.widget.FrameLayout
${allow_btn}=  xpath=//hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.Button[1]
${let_start_btn}=   xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup

${term_and_cond}=   xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
${dialog_term}=     xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${accept_consent_product}=   xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup
${accept_consent_personal}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup
${accept_consent_offer}=     xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView
${accept_consent_business}=  xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup
${btn_login}=    xpath=//android.widget.TextView[@text="Login"]
${input_username}=  xpath=//*[@text="Enter here"] 
${input_pass}=      xpath=//*[@text="Enter here"]
${ctn_btn_login_page}=         xpath=//*[@text="Continue"] 
${ctn_authen_btn}=  xpath=//android.widget.TextView[@text="Continue"]
${no_btn_quick_login}=    xpath=//android.widget.TextView[@text="No"]
${done_btn_thank_you_page}=  xpath=//android.widget.TextView[@text="Done"]
${got_it_btn}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${skip_btn}=      xpath=//android.widget.TextView[@text="Skip"]
${smc_btn}=    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[3]/android.widget.ImageView    
${insurance_card}=    xpath=//android.widget.TextView[contains(@text, 'Insurance card')]

*** Keywords ***
Open Test Application
    Open Application    http://localhost:4723/wd/hub
            ...    deviceName=emulator-5554
            ...    platformName=Android
            ...    platformVersion=13
            ...    appPackage=com.thmtlphoenix
            ...    appActivity=com.thmtlphoenix.MainActivity
            ...    appWaitPackage=com.thmtlphoenix

Start
    Wait Until Element Is Visible     ${let_start_btn}    30S
    ${letstart}=   Run Keyword And Return Status   Element Should Be Visible   ${let_start_btn} 
     Run Keyword If  '${letstart}'=='True'    
     ...    Log To Console    '${letstart}, Test'
     click Element   ${let_start_btn} 
     
Enter Username_Password
    Wait Until Element Is Visible     ${input_username}    30S
    Input Text        ${input_username}    Testg108  
    Input Password    ${input_pass}    Rr123123
    Click Element    ${ctn_btn_login_page}

Enter to homepage
    #authenContinue
    Wait Until Page Contains    Continue   30S
    Wait Until Element Is Visible     ${ctn_authen_btn}    60S
    ${authenContinue}=   Run Keyword And Return Status    Element Should Be Visible   ${ctn_authen_btn} 
    Run Keyword If  '${authenContinue}'=='True'    click element   ${ctn_authen_btn} 
    #no_btn_quick_login
    Wait Until Element Is Visible     ${no_btn_quick_login}    30S
    ${quickLogin}=   Run Keyword And Return Status    Element Should Be Visible   ${no_btn_quick_login} 
    Run Keyword If  '${quickLogin}'=='True'    click element   ${no_btn_quick_login} 
    #done_btn_thank_you_page
    Wait Until Element Is Visible     ${done_btn_thank_you_page}    40S
    ${doneThakyou}=   Run Keyword And Return Status    Element Should Be Visible   ${done_btn_thank_you_page} 
    Run Keyword If  '${doneThakyou}'=='True'    click element   ${done_btn_thank_you_page} 
    #got_it_btn
    Wait Until Element Is Visible     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView    30S
    ${gotItBtn}=   Run Keyword And Return Status    Element Should Be Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
    Run Keyword If  '${gotItBtn}'=='True'    click element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
    #skip_btn
    Wait Until Element Is Visible     xpath=//android.widget.TextView[@text="Skip"]    30S
    ${CreateButtonVisibleskip}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Skip"]
    Run Keyword If  '${CreateButtonVisibleskip}'=='True'    click element   xpath=//android.widget.TextView[@text="Skip"]

    # if news popup appear
         ${CreateButtonVisibleCancel}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Cancel"]
    Run Keyword If  '${CreateButtonVisibleCancel}'=='True'    click element   xpath=//android.widget.TextView[@text="Cancel"]
        sleep   5S
    # if news popup appear
         ${CreateButtonVisibleClose}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Close"]
    Run Keyword If  '${CreateButtonVisibleClose}'=='True'    click element   xpath=//android.widget.TextView[@text="Close"]
    # if news popup appear
        sleep   5S
         ${CreateButtonVisibleOk}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="OK"]
    Run Keyword If  '${CreateButtonVisibleOk}'=='True'    click element   xpath=//android.widget.TextView[@text="OK"]
        sleep   5S


#My group Claim Menu
Group_Claim
    Start Screen Recording
    Log To Console    'before click My Claim'
    ${visible_home}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="My Claim"]
    Run Keyword If  '${visible_home}'=='True'    capture page screenshot   img_MyClaim1.png

    #My Claim
    ${visible_myClaim}=  Run Keyword And Return Status   Element Should Be Visible    xpath=//android.widget.TextView[@text="My Claim"]
    Run Keyword If  '${visible_myClaim}'=='True'     click element    xpath=//android.widget.TextView[@text="My Claim"]
    capture page screenshot   img_MyClaim.png
    Log To Console    'after click My Claim'

    #Add Claim
    ${visible_addClaim}=  Run Keyword And Return Status   Element Should Be Visible    xpath=//android.widget.TextView[@text="Add Claim"]
    Run Keyword If  '${visible_addClaim}'=='True'     click element    xpath=//android.widget.TextView[@text="Add Claim"]

    wait until element is visible    xpath=//android.widget.TextView[@text="Group claim"]    30S
    ${CreateButtonVisiblegroupClaim1}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Group claim"]
    Run Keyword If  '${CreateButtonVisiblegroupClaim1}'=='True'     click element  xpath=//android.widget.TextView[@text="Group claim"]

    #Accident
     ${CreateButtonVisiblegroupacc1}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Accidental"]
    Run Keyword If  '${CreateButtonVisiblegroupacc1}'=='True'     click element   xpath=//android.widget.TextView[@text="Accidental"]
    #sleep   5S

     ${CreateButtonVisiblegroupacc2}=  Run Keyword And Return Status   Element Should Be Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.ImageView
    Run Keyword If  '${CreateButtonVisiblegroupacc2}'=='True'     click element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.ImageView
    #sleep   5S

     ${CreateButtonVisiblegroupacc3}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Continue"]
    Run Keyword If  '${CreateButtonVisiblegroupacc3}'=='True'     click element    xpath=//android.widget.TextView[@text="Continue"]
    #sleep   5S

     ${CreateButtonVisiblegroupacc4}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Continue"]
    Run Keyword If  '${CreateButtonVisiblegroupacc4}'=='True'     capture page screenshot   img_GroupclaimAccident.png
    Run Keyword If  '${CreateButtonVisiblegroupacc4}'=='True'     click element    xpath=//android.widget.TextView[@text="Cancel"]
    #sleep   5S

    #Dental
     ${CreateButtonVisiblegroupden1}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Dental"]
    Run Keyword If  '${CreateButtonVisiblegroupden1}'=='True'     click element   xpath=//android.widget.TextView[@text="Dental"]
    #sleep   5S

     ${CreateButtonVisiblegroupden2}=  Run Keyword And Return Status   Element Should Be Visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.ImageView
    Run Keyword If  '${CreateButtonVisiblegroupden2}'=='True'     click element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.ImageView
    #sleep   5S

     ${CreateButtonVisiblegroupden3}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Continue"]
    Run Keyword If  '${CreateButtonVisiblegroupden3}'=='True'     click element    xpath=//android.widget.TextView[@text="Continue"]
    #sleep   5S

     ${CreateButtonVisiblegroupden4}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Continue"]
    Run Keyword If  '${CreateButtonVisiblegroupden4}'=='True'     capture page screenshot   img_GroupclaimDental.png
    Run Keyword If  '${CreateButtonVisiblegroupden4}'=='True'     click element    xpath=//android.widget.TextView[@text="Cancel"]
    #sleep   5S

    wait until element is visible    xpath=//android.widget.TextView[@text="Group claim"]    30S
    ${CreateButtonVisiblegroupClaim1}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Group claim"]
    Run Keyword If  '${CreateButtonVisiblegroupClaim1}'=='True'     click element  xpath=//android.widget.TextView[@text="Group claim"]

    
    # Stop Screen Recording      TestResult_Myclaim_Group


    #My Individual  Claim Menu
Individual_Claim
    wait until element is visible    xpath=//android.widget.TextView[@text="Individual claim"]    30S
    ${CreateButtonVisibleIndClaim1}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Individual claim"]
    Run Keyword If  '${CreateButtonVisibleIndClaim1}'=='True'     click element  xpath=//android.widget.TextView[@text="Individual claim"]
    Log To Console    'Individual_Claim'

    #Health compensation
    ${CreateButtonVisibleIndopd1}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Health compensation"]
    Run Keyword If  '${CreateButtonVisibleIndopd1}'=='True'     click element   xpath=//android.widget.TextView[@text="Health compensation"]

    ${visible_Indopd}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="OPD (Outpatient Department)"]
    Run Keyword If  '${visible_Indopd}'=='True'     click element   xpath=//android.widget.TextView[@text="OPD (Outpatient Department)"]

    ${visible_ind_con}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Continue"]
    Run Keyword If  '${visible_ind_con}'=='True'     click element    xpath=//android.widget.TextView[@text="Continue"]

    ${visible_ind_con2}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Continue"]
    Run Keyword If  '${visible_ind_con2}'=='True'     capture page screenshot   img_IndividualclaimOPD.png
    Run Keyword If  '${visible_ind_con2}'=='True'     click element    xpath=//android.widget.TextView[@text="Cancel"]

    Log To Console    'Health compensation'

    # Stop Screen Recording      TestResult_Myclaim_Group


*** Test Cases ***
Login
    [Tags]    Login MTL Click
    Open Test Application
    # Start Screen Recording
    Wait Until Element Is Visible    ${allow_noti}
    Wait Until Element Is Visible    ${allow_btn}
    Click Element       ${allow_btn}
    Start
    Wait Until Element Is Visible  ${dialog_term}    60S
    Click Element    ${term_and_cond}   
    Wait Until Element Is Visible   ${accept_consent_personal}    60S
    Click Element    ${accept_consent_personal}
    Wait Until Element Is Visible    ${accept_consent_product}    30S
    Click Element    ${accept_consent_product}
    Wait Until Element Is Visible    ${accept_consent_offer}    30S
    Click Element    ${accept_consent_offer}
    Wait Until Element Is Visible    ${accept_consent_business}    30S
    Click Element    ${accept_consent_business}
    Wait Until Element Is Visible    ${btn_login}    30S
    Click Element    ${btn_login}
    Enter Username_Password   
    Sleep  3s
    Enter to homepage
    Sleep  4s
    Group_Claim
    Individual_Claim
    

 
   
    