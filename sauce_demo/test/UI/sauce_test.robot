*** Settings ***


Library AppiumLibrary
Resource ../../mobile_test/lib/sauce_keywords.robot


*** Test Cases ***

Valid Login Should Succeed
    [Tags]    app
    Open App
    Enter Username    standard_user
    Enter Password    secret_sauce
    Tap Login
    Verify Home Screen
    Close App

Invalid Login Should Show Error
    [Tags]    app
    Open App
    Enter Username    wrong_user
    Enter Password    wrong_pass
    Tap Login
    Verify Error Message
    Close App

Add Single Product To Cart
    [Tags]    app
    Open And Login
    Add Product To Cart    Sauce Labs Backpack
    Open Cart
    Verify Product In Cart    Sauce Labs Backpack
    Close App

Add Multiple Products To Cart
    [Tags]    app
    Open And Login
    Add Product To Cart    Sauce Labs Backpack
    Add Product To Cart    Sauce Labs Bike Light
    Open Cart
    Verify Multiple Products In Cart    Sauce Labs Backpack    Sauce Labs Bike Light
    Close App

Remove Product From Cart
    [Tags]    app
    Open And Login
    Add Product To Cart    Sauce Labs Backpack
    Open Cart
    Remove Product From Cart    Sauce Labs Backpack
    Verify Cart Empty
    Close App

Checkout Flow Should Complete
    [Tags]    app
    Open And Login
    Add Product To Cart    Sauce Labs Fleece Jacket
    Open Cart
    Tap Checkout
    Enter Checkout Details    Ibad    Syed    75500
    Tap Continue
    Verify Order Summary
    Tap Finish
    Verify Order Complete
    Close App

Sort Products By Price Low To High
    [Tags]    app
    Open And Login
    Select Sort Option    Price (low to high)
    Verify Sorting Low To High
    Close App

Sort Products By Name Z To A
    [Tags]    app
    Open And Login
    Select Sort Option    Name (Z to A)
    Verify Sorting Z To A
    Close App

Open Product Details And Verify UI
    [Tags]    app
    Open And Login
    Open Product Details    Sauce Labs Bolt T-Shirt
    Verify Product Details UI
    Close App

Logout From App
    [Tags]    app
    Open And Login
    Open Menu
    Tap Logout
    Verify Login Screen
    Close App