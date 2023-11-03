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
${btn_login}=    xpath=//android.widget.TextView[@text="Login"]
${input_username}=  xpath=//*[@text="Enter here"] 
${input_pass}=      xpath=//*[@text="Enter here"]
${ctn_btn_login_page}=         xpath=//*[@text="Continue"] 
${ctn_authen_btn}=  xpath=//android.widget.TextView[@text="Continue"]
${no_btn_quick_login}=    xpath=//android.widget.TextView[@text="No"]
${done_btn_thank_you_page}=  xpath=//android.widget.TextView[@text="Done"]
${got_it_btn}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${skip_btn}=      xpath=//android.widget.TextView[@text="Skip"]


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
    Input Text        ${input_username}    test01  
    Input Password    ${input_pass}    Rr123123
    Click Element    ${ctn_btn_login_page}

Enter to homepage
    Sleep  2s
    Click Element    ${ctn_authen_btn}
    Sleep  2s
    Click Element    ${no_btn_quick_login}
    Sleep  2s
    Click Element    ${done_btn_thank_you_page}
    Sleep  3s
    Click Element    ${got_it_btn}   
    Sleep  3s
    Click Element    ${skip_btn}


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
    Sleep  3s
    Enter Username_Password   
    Enter to homepage
    Swipe    0    1000   0    100
    capture page screenshot   img_homepage_banner.png
    # Stop Screen Recording
   

 
   
    