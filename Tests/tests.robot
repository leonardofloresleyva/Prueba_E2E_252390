*** Settings ***
Library     SeleniumLibrary
Resource    ../Variables/variables.robot
Resource    ../Keywords/keywords.robot
# Caso de prueba End-To-End
# Agrega un producto al carrito y lo compra
*** Test Cases ***
TC_001_E2E_Compra
    # Entra a la página de pruebas
    Initialize
    # Selecciona el producto
    Wait Until Page Contains Element    css=${product_location}
    Page Should Contain Element    css=${product_location}
    Click Element    css=${product_location}
    # Agrega el producto al carrito
    Wait Until Page Contains    ${product}
    Page Should Contain    ${product}
    Click Element    xpath=${add_product_to_cart_btn}
    Handle Alert
    # Entra al carrito y verifica que el producto haya sido agregado
    Click Element    id=cartur
    Wait Until Page Contains    ${product}
    Page Should Contain    ${product}
    # Expera hasta que el botón de place order sea visible y esté habilitado
    Wait_For_Element_Ready    xpath=${place_order_button}
    # Hace click en el botón de place order
    Click Button    xpath=${place_order_button}
    # Ingresa la información del nombre
    Enter_Text    id=name    ${client_name}
    # Ingresa la información del país
    Enter_Text    id=country    ${client_country}
    # Ingresa la información de la ciudad
    Enter_Text    id=city    ${client_city}
    # Ingresa la información de la tarjeta
    Enter_Text    id=card    ${client_card}
    # Ingresa la información del mes
    Enter_Text    id=month    ${client_card_month}
    # Ingresa la información del año
    Enter_Text    id=year    ${client_card_year}
    # Expera hasta que el botón de purchase sea visible y esté habilitado
    Wait_For_Element_Ready    xpath=${purchase_button}
    # Hace click en el botón de purchase
    Click Button    xpath=${purchase_button}
    # Expera hasta que el botón de ok sea visible y esté habilitado
    Wait_For_Element_Ready    xpath=${ok_button}
    # Verifica que aparezca el mensaje de confirmación
    Page Should Contain    ${confirmation_message}
    # Hace click en el botón de ok
    Click Button    xpath=${ok_button}
    # Cierra el navegador
    Close Browser