*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723/wd/hub
${DEVICE}        RF8X20PL5PE


${APP_PACKAGE}   com.saucelabs.mydemoapp.android
${APP_ACTIVITY}  com.saucelabs.mydemoapp.android.view.activities.SplashActivity

${USERNAME_FIELD}         //android.widget.EditText[@content-desc='test-Username']
${PASSWORD_FIELD}         //android.widget.EditText[@content-desc='test-Password']
${LOGIN_BUTTON}           //android.widget.TextView[@content-desc='test-LOGIN']
${ERROR_MESSAGE}          //android.widget.TextView[contains(@text,'Username and password')]

${CART_ICON}              //android.view.ViewGroup[@content-desc='test-Cart']
${CHECKOUT_BUTTON}        //android.widget.TextView[@content-desc='test-CHECKOUT']
${FIRSTNAME_FIELD}        //android.widget.EditText[@content-desc='test-First Name']
${LASTNAME_FIELD}         //android.widget.EditText[@content-desc='test-Last Name']
${ZIP_FIELD}              //android.widget.EditText[@content-desc='test-Zip/Postal Code']
${CONTINUE_BUTTON}        //android.widget.TextView[@content-desc='test-CONTINUE']
${FINISH_BUTTON}          //android.widget.TextView[@content-desc='test-FINISH']
${MENU_BUTTON}            //android.view.ViewGroup[@content-desc='test-Menu']
${LOGOUT_BUTTON}          //android.widget.TextView[@content-desc='test-LOGOUT']

*** Keywords ***

Open App
    [Documentation]    Launch the Sauce Demo app on connected device
    Open Application    ${REMOTE_URL}
    ...    platformName=Android
    ...    deviceName=${DEVICE}
    ...    automationName=UiAutomator2
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    Sleep    2s

Close App
    Close Application

Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Tap Login
    Click Element    ${LOGIN_BUTTON}
    Sleep    2s

Verify Home Screen
    Wait Until Page Contains Element    ${CART_ICON}    timeout=10s

Verify Error Message
    Page Should Contain Element    ${ERROR_MESSAGE}

Open And Login
    Open App
    Enter Username    standard_user
    Enter Password    secret_sauce
    Tap Login
    Verify Home Screen

Add Product To Cart
    [Arguments]    ${product}
    ${locator}=    Set Variable    //android.widget.TextView[@text='${product}']/../..//android.widget.TextView[@text='ADD TO CART']
    Click Element    ${locator}

Open Cart
    Click Element    ${CART_ICON}
    Sleep    1s

Verify Product In Cart
    [Arguments]    ${product}
    Page Should Contain Element    //android.widget.TextView[@text='${product}']

Verify Multiple Products In Cart
    [Arguments]    ${p1}    ${p2}
    Page Should Contain Element    //android.widget.TextView[@text='${p1}']
    Page Should Contain Element    //android.widget.TextView[@text='${p2}']

Remove Product From Cart
    [Arguments]    ${product}
    Click Element    //android.widget.TextView[@text='${product}']/../..//android.widget.TextView[@text='REMOVE']

Verify Cart Empty
    Page Should Contain    Your cart is empty

Tap Checkout
    Click Element    ${CHECKOUT_BUTTON}

Enter Checkout Details
    [Arguments]    ${fname}    ${lname}    ${zip}
    Input Text    ${FIRSTNAME_FIELD}    ${fname}
    Input Text    ${LASTNAME_FIELD}    ${lname}
    Input Text    ${ZIP_FIELD}         ${zip}

Tap Continue
    Click Element    ${CONTINUE_BUTTON}

Verify Order Summary
    Page Should Contain    Payment Information

Tap Finish
    Click Element    ${FINISH_BUTTON}

Verify Order Complete
    Page Should Contain    Thank you for your order!

Select Sort Option
    [Arguments]    ${option}
    Click Element    //android.widget.Spinner[@content-desc='test-Modal Selector Button']
    Click Element    //android.widget.CheckedTextView[@text='${option}']

Verify Sorting Low To High
    Page Should Contain    $7.99

Verify Sorting Z To A
    Page Should Contain    Test.allTheThings()

Open Product Details
    [Arguments]    ${product}
    Click Element    //android.widget.TextView[@text='${product}']

Verify Product Details UI
    Page Should Contain Element    //android.widget.ImageView[@content-desc='test-Item image']

Open Menu
    Click Element    ${MENU_BUTTON}

Tap Logout
    Click Element    ${LOGOUT_BUTTON}

Verify Login Screen
    Page Should Contain Element    ${LOGIN_BUTTON}