BITS 16

start:
    ; Set up the stack pointer
    mov sp, 0x7c00

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
    int 0x10
    mov al, 'W'     ; Character to print
    int 0x10
    mov al, 'o'     ; Character to print
    int 0x10
    mov al, 'r'     ; Character to print
    int 0x10
    mov al, 'l'     ; Character to print
    int 0x10
    mov al, 'd'     ; Character to print
    int 0x10
    int 0x10

    ; Infinite loop
    cli
    hlt
    jmp $
    
    times 510-($-$$) db 0
	db 0x55         ;write boot sector signature at
	db 0xAA         ;and of sector