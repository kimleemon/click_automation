*** Settings ***
# Library           SeleniumLibrary
Library           AppiumLibrary
Library           Collections




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
${btn_username}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[6]/android.view.ViewGroup[1]/android.view.ViewGroup
${input_username}=  xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.EditText
${input_pass}=      xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.EditText
${ctn_btn}=         xpath=//*[@text="Continue"] 
${ctn_authen_btn}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${quick_login}=    xpath=//*[@text="No"] 
${thank_you_page}=  xpath=//*[@text="Done"] 
${got_it_btn}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${skip_btn}=      xpath=//*[@text="Skip"] 


*** Keywords ***
Open Test Application
    Open Application    http://localhost:4723/wd/hub
            ...    deviceName=emulator-5554
            ...    platformName=Android
            ...    platformVersion=13
            ...    appPackage=com.thmtlphoenix
            ...    appActivity=com.thmtlphoenix.MainActivity
            ...    appWaitPackage=com.thmtlphoenix
Enter Username_Password
    Input Text        ${input_username}    test1001  
    Input Password    ${input_pass}    Rr123123

Enter to homepage
    # Click Element    ${ctn_btn} 
    Click Element    ${ctn_btn} 
    Sleep  3s
    Click Element    ${ctn_authen_btn}
    Sleep  3s
    Click Element    ${quick_login}
    Sleep  3s
    Click Element    ${thank_you_page}
    Sleep  5s
    Click Element    ${got_it_btn}   
    Sleep  5s
    Click Element    ${skip_btn}





*** Test Cases ***
demo_test
    [Tags]    demo_test_test
    Log  Hiiiiii
    Open Test Application
    Wait Until Element Is Visible    ${allow_noti}
    Wait Until Element Is Visible    ${allow_btn}
    Click Element       ${allow_btn}
    Wait Until Page Contains    Let’s start   60S
    Wait Until Element Is Visible   ${let_start_btn}    60S
    Click Element   ${let_start_btn}
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
    Wait Until Element Is Visible    ${btn_username}    30S
    Click Element    ${btn_username}
    Sleep  3s
    Enter Username_Password   
    Enter to homepage
   

 
   
    