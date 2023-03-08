	; Print the message to the console
    mov ah, 0x0e    ; BIOS function for printing a character
    mov al, 'H'     ; Character to print
    int 0x10        ; Call the BIOS to print the character
    mov al, 'e'     ; Character to print
    int 0x10
    mov al, 'l'     ; Character to print
    int 0x10
    int 0x10
    mov al, 'o'     ; Character to print
    int 0x10
    mov al, 'P'     ; Character to print
    int 0x10
    mov al, 'r'     ; Character to print
    int 0x10
    mov al, 'o'     ; Character to print
    int 0x10
    mov al, 'g'     ; Character to print
    int 0x10
    mov al, 'r'     ; Character to print
    int 0x10
    mov al, 'a'     ; Character to print
    int 0x10
    mov al, 'm'     ; Character to print
    int 0x10
