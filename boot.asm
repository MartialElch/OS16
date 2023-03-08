[ORG 0x7c00]
BITS 16

start:
    ; Set up the stack pointer
    mov sp, 0x7c00
    mov ax, 0
    mov ds, ax

    ; print welcome message
    mov si, msg     ; load pointer to msg

ch_loop:
    lodsb           ; load char from string into al
    or al, al       ; zero means end of string
    jz done         ; go to end of loop om zero
    mov ah, 0x0E    ; color in hi byte of word
    int 0x10        ; use bios for print
    jmp ch_loop     ; go to next char
done:

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

halt:
    ; Infinite loop
    cli             ; disable interrupts
    hlt             ; stop processor
    jmp $

msg db 'Hello World!', 13, 10, 0

    times 510-($-$$) db 0
	db 0x55         ;write boot sector signature at
	db 0xAA         ;and of sector
