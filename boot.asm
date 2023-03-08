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

    ; Load the program from floppy
    mov ax, 0x0201   ; Read one sector from floppy
    mov bx, 0x0002   ; Destination buffer address: 0x0000:0x8000
    mov es, bx
    mov bx, 0x8000
    mov dl, 0x00     ; Drive number: floppy A
    mov dh, 0x00     ; Head number: 0
    mov cx, 0x0002   ; Sector number: 2
    mov ah, 0x02     ; BIOS disk function
    int 0x13         ; Call the BIOS to read the sector

    ; Jump to the program's entry point
    jmp 0x0000:0x8000

    ; Infinite loop
    cli             ; disable interrupts
    hlt             ; stop processor
    jmp $
    
    times 510-($-$$) db 0
	db 0x55         ;write boot sector signature at
	db 0xAA         ;and of sector
