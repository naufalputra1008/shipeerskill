*** Settings ***
Library    Selenium2Library

*** Variables ***
${browser}                                chrome
${url}                                    https://shipper.id/
${SCRL_CARI_TARIF}                        xpath=//*[@id="__next"]/main/section[4]/div/h2
${ASAL_FIELD}                             xpath=//*[@id="ratesFrom"]
${TUJUAN_FIELD}                           xpath=//*[@id="ratesTo"]
${BERAT_FIELD}                            xpath=//*[@id="ratesWeight"]
${CARI_TARIF_BTN}                         xpath=//*[@id="home-button-rates"]
${VRFY_TARIF_PENGIRIMAN}                  xpath=//*[@id="__next"]/main/section[1]/div/h1
${URUTKAN_CMBBOX}                         xpath=/html/body/div/main/section[2]/div/div/div[1]/div[3]/div[2]/div/select
${TERMURAH_BTN}                           xpath=/html/body/div/main/section[2]/div/div/div[1]/div[3]/div[2]/div/select
${VRFY_TERMURAH_FLITER}                   xpath=//*[@id="__next"]/main/section[2]/div/div/div[2]/div[2]/div


*** Keywords ***
Open Shipper website in chrome
    Open browser                          ${url}                ${browser}
    Maximize Browser Window

Close The Browser
    Close Browser

Scroll cari tarif
    Set Selenium Speed        0.8
    Scroll Element Into View            ${SCRL_CARI_TARIF}

Input Asal
    Set Selenium Speed        0.8
    Input Text                          ${ASAL_FIELD}            Balaraja, Balaraja, Tangerang, Kab., Banten 
    Press Keys                          ${ASAL_FIELD}            ENTER                   
    
Input Tujuan
    Set Selenium Speed        0.8
    Input Text                          ${TUJUAN_FIELD}          Cipete Utara, Kebayoran Baru, Jakarta Selatan, DKI Jakarta
    Press Keys                          ${TUJUAN_FIELD}          ENTER
    
Input Berat
    Set Selenium Speed        0.8
    Input Text                          ${BERAT_FIELD}           1

Click button cari tarif
    Set Selenium Speed        0.8
    Click Element                       ${CARI_TARIF_BTN}

Preview tarif pengiriman
    Wait Until Element Is Visible       ${VRFY_TARIF_PENGIRIMAN}

Click urutkan
    Set Selenium Speed       0.8
    Click Element                       ${URUTKAN_CMBBOX}

Select Termurah
    Set Selenium Speed       0.8
    Click Element                       ${TERMURAH_BTN}

Preview filter by Termurah
    Set Selenium Speed       0.8
    Wait Until Element Is Visible        ${VRFY_TERMURAH_FLITER}

*** Test Cases ***
User Able Filter by Tercepat
    Given Open Shipper website in chrome
    And Scroll cari tarif
    When Input Asal 
    And Input Tujuan
    When Input Berat
    When Click button cari tarif
    Then Preview tarif pengiriman 
    When Click urutkan 
    And Select Termurah
    Then Preview filter by Termurah

 