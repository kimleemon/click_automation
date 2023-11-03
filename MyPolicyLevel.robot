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
${term_and_cond}=   xpath=//android.widget.TextView[@text="Accept"]
${accept_consent_product}=   xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup
${accept_consent_personal}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup
${accept_consent_offer}=     xpath=//android.widget.TextView[@text="Accept"]
${accept_consent_business}=  xpath=//android.widget.TextView[@text="Accept"]
${btn_login}=    xpath=//android.widget.TextView[@text="Login"]
${input_username}=  xpath=//*[@text="Enter here"] 
${input_pass}=      xpath=//*[@text="Enter here"]
${ctn_btn_login_page}=         xpath=//*[@text="Continue"] 
${ctn_authen_btn}=  xpath=//android.widget.TextView[@text="Continue"]
${no_btn_quick_login}=    xpath=//android.widget.TextView[@text="No"]
${done_btn_thank_you_page}=  xpath=//android.widget.TextView[@text="Done"]
${got_it_btn}=    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView
${skip_btn}=      xpath=//android.widget.TextView[@text="Skip"]
${policy_btn}=    xpath=//android.widget.TextView[@text="Policy"]
${home_btn}=    xpath=//android.widget.TextView[@text="Home"]
${back_btn}=      xpath=//android.widget.ImageView
${insurance_card}=    xpath=//android.widget.TextView[@text="Insurance card"]


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
    Click Element    ${ctn_btn_login_page}

Enter to homepage
    Sleep  5s
    Click Element    ${ctn_authen_btn}
    Sleep  3s
    ${visible_quick_login}    Run Keyword And Return Status   Element Should Be Visible   ${no_btn_quick_login}
    Run Keyword If  '${visible_quick_login}'=='True'     Click Element    ${no_btn_quick_login}
    Sleep  3s
    ${visible_done_btn}    Run Keyword And Return Status   Element Should Be Visible   ${done_btn_thank_you_page}
    Run Keyword If  '${visible_done_btn}'=='True'     Click Element   ${done_btn_thank_you_page}
    Sleep  3s
    Click Element    ${got_it_btn} 
    Sleep  3s
    Click Element    ${skip_btn}


# if news popup appear
Diglog Gift
    ${CreateButtonVisibleCancel}  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Cancel"]
    Run Keyword If  '${CreateButtonVisibleCancel}'=='True'    click element   xpath=//android.widget.TextView[@text="Cancel"]
    sleep   5S

My Policy Level
    Wait Until Element Is Visible   ${policy_btn}    60S
    Click Element    ${policy_btn}
    Sleep     3S
    Wait Until Element Is Visible   xpath=//android.widget.TextView[@text="Skip"]    60S
    Click Element    xpath=//android.widget.TextView[@text="Skip"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="My Policies"]
    Sleep     3S

    # My policy level 1
    ${visible_myPolicy_level_1}    Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Your Coverage"]
    Run Keyword If  '${visible_myPolicy_level_1}'=='True'     capture page screenshot   img_policyLevel1.png
    #sleep   3S
    Log To Console  "My policy level 1"
    # My policy level 2
    ${visible_myPolicy_level_2}    Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Life"]
    Run Keyword If  '${visible_myPolicy_level_2}'=='True'     click element   xpath=//android.widget.TextView[@text="Life"]    
    #sleep   3S
    capture page screenshot   img_policyLevel2.png
    #sleep   3S
    Log To Console  "My policy level 2"
    # My policy level 3
    ${visible_myPolicy_level_3}    Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="My Life Coverage"]
    Run Keyword If  '${visible_myPolicy_level_2}'=='True'    click element   xpath=//android.widget.TextView[@text="VALID TILL"] 
    Wait Until Page Contains    EFFECTIVE DATE   60S
    capture page screenshot   img_policyLevel3.png
    #sleep   3S
    Log To Console  "My policy level 3"

    ${back_button}    Run Keyword And Return Status   Element Should Be Visible   ${back_btn}
    Run Keyword If  '${back_button}'=='True'    
    ...    Wait Until Element Is Visible    ${back_btn}
    click element    ${back_btn}
    
    ${back_btn_my_life_coverrage}    Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="My Life Coverage"]
    Run Keyword If  '${back_btn_my_life_coverrage}'=='True'
    ...    Wait Until Element Is Visible    ${back_btn_my_life_coverrage}   
    Wait Until Element Is Visible    ${back_btn}
    click element    ${back_btn}
    Wait Until Element Is Visible    ${home_btn}
    click element    ${home_btn}
    Log To Console  "my_life_coverrage"


My digicard
    Wait Until Element Is Visible    ${insurance_card}
    click element    ${insurance_card}
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="My Digicards"]
    Log To Console  "My digicard"
    capture page screenshot   img_digicard.png



*** Test Cases ***
My Policy Level
    [Tags]    My Policy Level
    Open Test Application
    # Start Screen Recording
    Wait Until Element Is Visible    ${allow_noti}
    Wait Until Element Is Visible    ${allow_btn}
    Click Element       ${allow_btn}
    Wait Until Page Contains    Let’s start   60S
    Wait Until Element Is Visible   ${let_start_btn}    60S
    Click Element   ${let_start_btn}
    Wait Until Element Is Visible  ${term_and_cond}    60S
    Click Element    ${term_and_cond}   
    Wait Until Element Is Visible   ${accept_consent_personal}    60S
    Click Element    ${accept_consent_personal}
    Wait Until Element Is Visible    ${accept_consent_product}    60S
    Click Element    ${accept_consent_product}
    Wait Until Element Is Visible    ${accept_consent_offer}    60S
    Click Element    ${accept_consent_offer}
    Wait Until Element Is Visible    ${accept_consent_business}    60S
    Click Element    ${accept_consent_business}
    Wait Until Element Is Visible    ${btn_login}    60S
    Click Element    ${btn_login}
    Sleep  3s
    Enter Username_Password   
    Enter to homepage
    # Stop Screen Recording
    Diglog Gift
    Log To Console    'banner_homepage'
    Swipe    0    1000   0    100
    ${visible_home}=  Run Keyword And Return Status   Element Should Be Visible   xpath=//android.widget.TextView[@text="Home"]
    Run Keyword If  '${visible_home}'=='True'    capture page screenshot   img_banner_homepage.png
    My Policy Level
    My digicard
   

 
   
    